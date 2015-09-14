--
library ieee;
use ieee.std_logic_1164.all, ieee.numeric_std.all;

library UNISIM;
use UNISIM.vcomponents.all;

library UNIMACRO;  
use UNIMACRO.Vcomponents.all;

entity HSaqusition is
	generic( sram_addr_width : natural := 19; --Number of bits in SRAM addr bus
		 sram_data_width : natural := 18;
		 address : std_ulogic_vector( 7 downto 0 ) := "00000001"
		 );

	port (
		clk : in std_ulogic;
		rst : in std_ulogic;
		datain : in std_ulogic_vector( 7 downto 0);
		addr : in std_ulogic_vector( 7 downto 0);
		wr : in std_ulogic;
		rd : in std_ulogic;
		dataout : out std_ulogic_vector( 7 downto 0);
		sram_addr : out std_ulogic_vector( sram_addr_width-1 downto 0);
		sram_data : inout std_ulogic_vector( sram_data_width-1 downto 0);
		sram_wr : out std_ulogic;
		sram_ce : out std_ulogic;
		sram_oe : out std_ulogic;
		digital_in : in std_ulogic_vector( 7 downto 0);
		hs_adc_a : in std_ulogic_vector( 7 downto 0);
		hs_adc_b : in std_ulogic_vector( 7 downto 0);
		adc_clk_a : out std_ulogic;
		adc_clk_b : out std_ulogic;
		adc_pwd_d : out std_ulogic;
		hs_clock_2 : in std_ulogic;
		hs_clock_4 : in std_ulogic
		);
end HSaqusition;

architecture RTL of HSaqusition is

component COUNTER_LOAD_INC_MACRO is
  generic ( 
    DEVICE : string := "VIRTEX5";
            STYLE : string := "AUTO";
            WIDTH_DATA : integer := 48
       );

  port (
      Q : out std_logic_vector(WIDTH_DATA-1 downto 0);   
      CE : in std_logic;
      CLK : in std_logic;   
      DIRECTION : in std_logic;
      COUNT_BY : in std_logic_vector(WIDTH_DATA-1 downto 0); 
      LOAD : in std_logic;
      LOAD_DATA : in std_logic_vector(WIDTH_DATA-1 downto 0);
      RST : in std_logic   
     );   
end component COUNTER_LOAD_INC_MACRO;

type datamachine is (idle, process_command, read_trigger, read_ram, read_status, configure);
signal data_state : datamachine := idle; 
type WRcountermachine is (idle, counting, read_data, wait_ready);
signal ram_count_state_wr, ram_count_state_rd : WRcountermachine := idle;
signal ram_group_0_select, ram_group_1_select, trigger_select, trigger_select_HS  : std_ulogic_vector( 1 downto 0 ) := (others => '0');
signal ram_group_2_select, ram_group_3_select : std_ulogic_vector( 2 downto 0 ) := (others => '0');
signal ram_group_2_select_master, ram_group_3_select_master : std_ulogic_vector( 2 downto 0 ) := (others => '0') ;
signal digital_in_by_8_muxed : std_ulogic;
signal ram_write_counter, ram_read_counter, ram_address_offset, ram_trigger_address: unsigned( sram_addr_width-1 downto 0 ) :=(others => '0') ;
signal read_ram_stop, ram_read_size : unsigned( sram_addr_width-1 downto 0 ) := (others => '1');
signal ram_counter_wr_stop : std_ulogic_vector( sram_addr_width-1 downto 0 ) := (others => '0');
signal ram_data_in, ram_data_out : std_ulogic_vector(sram_data_width-1 downto 0 ) := (others => '0');
signal adc_clk_a_select, adc_clk_b_select, read_ready, ram_data_available, ram_read_finished, ram_ready : std_ulogic := '0';
signal trigger_source, trigger_source_tmp, trigger_d1, trigger_d2, trigger_val , trigger_val_hs: std_ulogic_vector(7 downto 0) := (others => '0');
signal start_ram_capture, ram_full, data_capture_started, trigger_edge, triggered, manual_trigger : std_ulogic := '0';
signal ram_addr_adder : unsigned( sram_addr_width downto 0 ) := (others => '0');
signal combus_0, combus_1 : std_ulogic_vector( 7 downto 0 ) := (others => '0');
signal combus_2 : std_ulogic_vector( 1 downto 0) := (others => '0');
signal combus : std_ulogic_vector( 2 downto 0) := (others => '0');
signal command : std_ulogic_vector( 2 downto 0) := (others => '0');
signal sram_wr_sig, configdone, interruptdataread : std_ulogic := '0';
signal rdcnt : unsigned(7 downto 0) := (others => '0');
signal first_ram_read : std_ulogic := '0';
signal clocksel : std_ulogic_vector(1 downto 0) := (others => '0');
signal clock_mux_con,  clock_mux_con_n : std_ulogic :='0';
signal hs_clock, hs_clock_n : std_ulogic := '0';
signal adc_clk_a_select_n, adc_clk_b_select_n : std_ulogic := '0';
signal gnd, vcc : std_ulogic;
signal ram_group_0_register, ram_group_1_register, adc_a_register, adc_b_register, digital_in_register : std_ulogic_vector(7 downto 0) := (others => '0');
signal ram_group_2_register, ram_group_3_register : std_ulogic := '0';
signal ram_write_counter_reset, ram_write_counter_enable : std_ulogic :='1';
signal trig_it : std_ulogic := '0';
signal count_inc_by : std_ulogic_vector( sram_addr_width+9 downto 0 ) := "00000000000000000010000000000";
signal counter_connection : std_ulogic_vector( sram_addr_width+9 downto 0 );
signal ram_dcm_fb : std_ulogic;
begin
	gnd <= '0';
	vcc <= '1';
	--
	--   CLK_1----|-------|
	--   CLK_2----|-------|----|------|
	--   CLK_3-----------------|------|----CLKO
	--            
	--
	--
	--
	
	
	-- BUFGMUX: Global Clock Mux Buffer
	-- Spartan-6
	-- Xilinx HDL Libraries Guide, version 12.4
	BUFGMUX_inst_1 : BUFGMUX
	generic map (
		CLK_SEL_TYPE => "SYNC" -- Glitchles ("SYNC") or fast ("ASYNC") clock switch-over
	)
	port map (
		O => hs_clock, -- 1-bit output Clock buffer output
		I0 => clock_mux_con, -- 1-bit input Clock buffer input (S=0)
		I1 => hs_clock_4, -- 1-bit input Clock buffer input (S=1)
		S => clocksel(1) -- 1-bit input Clock buffer select
	);
	-- End of BUFGMUX_inst instantiation
	-- BUFGMUX: Global Clock Mux Buffer
	-- Spartan-6
	-- Xilinx HDL Libraries Guide, version 12.4
	BUFGMUX_inst_2 : BUFGMUX
	generic map (
		CLK_SEL_TYPE => "SYNC" -- Glitchles ("SYNC") or fast ("ASYNC") clock switch-over
	)
	port map (
		O => clock_mux_con, -- 1-bit output Clock buffer output
		I0 => clk, -- 1-bit input Clock buffer input (S=0)
		I1 => hs_clock_2, -- 1-bit input Clock buffer input (S=1)
		S => clocksel(0) -- 1-bit input Clock buffer select
	);


	-- ODDR2: Output Double Data Rate Output Register with Set, Reset
	-- and Clock Enable.
	-- Spartan-6
	-- Xilinx HDL Libraries Guide, version 12.4
	ODDR2_inst_1 : ODDR2
	generic map(
		DDR_ALIGNMENT => "NONE", -- Sets output alignment to "NONE", "C0", "C1"
		INIT => '0', -- Sets initial state of the Q output to ’0’ or ’1’
		SRTYPE => "SYNC") -- Specifies "SYNC" or "ASYNC" set/reset
	port map (
		Q => adc_clk_a, -- 1-bit output data
		C0 => hs_clock, -- 1-bit clock input
		C1 => not(hs_clock), -- 1-bit clock input
		CE => vcc, -- 1-bit clock enable input
		D0 => adc_clk_a_select, -- 1-bit data input (associated with C0)
		D1 => not(adc_clk_a_select), -- 1-bit data input (associated with C1)
		R => gnd, -- 1-bit reset input
		S => gnd -- 1-bit set input
	);
	ODDR2_inst_2 : ODDR2
	generic map(
		DDR_ALIGNMENT => "NONE", -- Sets output alignment to "NONE", "C0", "C1"
		INIT => '0', -- Sets initial state of the Q output to ’0’ or ’1’
		SRTYPE => "SYNC") -- Specifies "SYNC" or "ASYNC" set/reset
	port map (
		Q => adc_clk_b, -- 1-bit output data
		C0 => hs_clock, -- 1-bit clock input
		C1 => not(hs_clock), -- 1-bit clock input
		CE => vcc, -- 1-bit clock enable input
		D0 => adc_clk_b_select, -- 1-bit data input (associated with C0)
		D1 => not(adc_clk_b_select), -- 1-bit data input (associated with C1)
		R => gnd, -- 1-bit reset input
		S => gnd -- 1-bit set input
	);
	-- End of ODDR2_inst instantiation
	
	
	sram_ce <= '1';
	sram_data <= ram_data_in when sram_wr_sig = '1' else (others => 'Z');
	ram_data_out <= sram_data;
	sram_wr <= sram_wr_sig;
	sram_addr <= std_ulogic_vector(ram_write_counter) when sram_wr_sig = '1' else std_ulogic_vector(ram_read_counter);

	getData: process (rst, clk, datain, addr) is
	
	begin
		if rising_edge(clk) then
			if addr( 3 downto 0 ) = address( 3 downto 0 ) then
				case data_state is
					when idle =>
						if wr = '1' then
							command <= datain( 2 downto 0);
							data_state <= process_command;
						end if;
						interruptdataread  <= '0';
					when process_command =>
						case command is
							when "000" =>
								data_state <= read_trigger;
							when "001" =>
								data_state <= read_ram;
								read_ready <= '0';
							when "010" =>
								data_state <= configure;
							when "011" =>
								data_state <= read_status;
							when others =>
								data_state <= idle;
						end case;
					when read_trigger  =>
						if rd = '1' then
							case combus is
								when "000" =>
									dataout <= std_ulogic_vector(ram_trigger_address( 7 downto 0));
									combus <= "001";
								when "001" =>
									dataout <= std_ulogic_vector(ram_trigger_address( 15 downto 8));
									combus <= "010";
								when "010" =>
									dataout(2 downto 0) <= std_ulogic_vector(ram_trigger_address( sram_addr_width-1 downto 16));
									dataout(7 downto 3) <= (others => '0');
									combus <= "011";
								when "011" =>
									dataout <= ram_counter_wr_stop( 7 downto 0 );
									combus <= "100";
								when "100" =>
									dataout <= ram_counter_wr_stop( 15 downto 8 );
									combus <= "101";
								when "101" =>
									dataout(2 downto 0) <= ram_counter_wr_stop( sram_addr_width-1 downto 16 );
									dataout(7 downto 3) <= (others => '0');
									combus <= "000";
								when others =>
									combus <= "000";
									data_state <= idle;
							end case;
						end if;
						if wr = '1' then
							data_state <= idle; --make sure we can interrupt a transfer so it won't lock up
						end if;
					when read_status =>
						if rd = '1' then
							dataout(0) <= ram_data_available;
							dataout(1) <= ram_full;
							dataout(2) <= triggered;
							dataout(3) <= ram_read_finished;
							dataout(4) <= read_ready;
							dataout(7 downto 5) <= "110"; 
							data_state <= idle;
						end if;
					when read_ram =>
						if rd = '1' then
							if ram_data_available = '1'  then
								if addr(4) = '1' then
									ram_read_size <= "0001111111111111111";
								else
									ram_read_size <= "1111111111111111111";
								end if;
								case combus is
									when "000" =>
										dataout <= combus_0;
										combus <= "001";
										read_ready <= '0';
									when "001" =>
										dataout <= combus_1;
										combus <= "010";
									when "010" =>
										dataout <= "101010" & combus_2;
										--dataout <= std_ulogic_vector(rdcnt);
										combus <= "000";
										read_ready <= '1';
										if ram_read_finished = '1' then
											data_state <= idle;
										end if;
									when others =>
										combus <= "000";
										data_state <= idle;
								end case;
							else
								dataout(0) <= manual_trigger;
								dataout(1) <= trigger_edge;
								dataout(2) <= configdone;
								dataout(3) <= data_capture_started;
								dataout(4) <= read_ready;
								dataout(5) <= start_ram_capture;
								dataout(7 downto 6) <= "00";
							end if;
							rdcnt <= rdcnt + 1;
						end if;
						if wr = '1' then
							data_state <= idle; --make sure we can interrupt a transfer so it won't lock up
							read_ready <= '0';
							combus <= "000";
							interruptdataread  <= '1';
						end if;
					when configure =>
						if wr = '1' then
							case combus is
								when "000" =>
									ram_group_0_select <= datain(1 downto 0); 
									ram_group_1_select <= datain(3 downto 2);
									ram_group_2_select_master <= datain(6 downto 4);
									digital_in_by_8_muxed <= datain(7);
									combus <= "001";
									configdone <= '0';
								when "001" =>
									ram_group_3_select_master <= datain(2 downto 0);
									adc_clk_a_select <= datain(3);
									adc_clk_b_select <= datain(4);
									adc_pwd_d <= datain(5);
									clocksel <= datain(7 downto 6);
									combus <= "010";
								when "010" =>
									trigger_select <= datain( 1 downto 0);
									trigger_edge <= datain(2);
									manual_trigger <= datain(3);
									if datain( 7 downto 4 ) = "0000" then
										count_inc_by <= "00000000000000000010000000000"; 
									elsif datain( 7 downto 4 ) = "0001" then
										count_inc_by <= "00000000000000000001000000000"; 
									elsif datain( 7 downto 4 ) = "0010" then
										count_inc_by <= "00000000000000000000100000000"; 
									elsif datain( 7 downto 4 ) = "0011" then
										count_inc_by <= "00000000000000000000010000000"; 
									elsif datain( 7 downto 4 ) = "0100" then
										count_inc_by <= "00000000000000000000001000000"; 
									elsif datain( 7 downto 4 ) = "0101" then
										count_inc_by <= "00000000000000000000000100000"; 
									elsif datain( 7 downto 4 ) = "0110" then
										count_inc_by <= "00000000000000000000000010000"; 
									elsif datain( 7 downto 4 ) = "0111" then
										count_inc_by <= "00000000000000000000000001000"; 
									elsif datain( 7 downto 4 ) = "1000" then
										count_inc_by <= "00000000000000000000000000100"; 
									elsif datain( 7 downto 4 ) = "1001" then
										count_inc_by <= "00000000000000000000000000010"; 
									elsif datain( 7 downto 4 ) = "1010" then
										count_inc_by <= "00000000000000000000000000001";
									end if;
									combus <= "011";
								when "011" =>
									trigger_val <= datain;
									combus <= "100";
								when "100" =>
									ram_address_offset(7 downto 0) <= unsigned(datain);
									combus <= "101";
								when "101" =>
									ram_address_offset(15 downto 8) <= unsigned(datain);
									combus <= "110";
								when "110" =>
									ram_address_offset(18 downto 16) <= unsigned(datain(2 downto 0));
									start_ram_capture <= datain(3);
									combus <= "000";
									configdone <= '1';
									data_state <= idle;
								when others => 
									combus <= "000";
									data_state <= idle;
							end case;
						end if;
				end case;
			
			end if;
			
			if ram_full = '1' then
				manual_trigger <= '0';
			end if;
			
			if data_capture_started = '1' then
				start_ram_capture <= '0';
			end if;
		end if;
	end process getData;
	
	
	SpeedDevil : process( hs_clock, rst )
	begin
		if rising_edge(hs_clock) then
			adc_a_register <= hs_adc_a;
			adc_b_register <= hs_adc_b;
			ram_data_in(7 downto 0) <= ram_group_0_register;
			ram_data_in(15 downto 8) <= ram_group_1_register;
			ram_data_in(16) <= ram_group_2_register;
			ram_data_in(17) <= ram_group_3_register;
			trigger_select_HS <= trigger_select;
			trigger_source <= trigger_source_tmp;
			trigger_val_hs <= trigger_val; 
		end if;
	end process SpeedDevil;
	
	-- Select ADC/DIGITAL input on first part of SRAM
	ram_group_0_register <=	adc_a_register when ram_group_0_select = "00" else
					adc_b_register when ram_group_0_select = "01" else
					digital_in when ram_group_0_select = "10" else
					"XXXXXXXX";
	-- Select ADC/DIGITAL input on second part of SRAM
	ram_group_1_register <=	adc_a_register when ram_group_1_select = "00" else
					adc_b_register when ram_group_1_select = "01" else
					digital_in when ram_group_1_select = "10" else
					"XXXXXXXX";			
	-- Select DIgital channel in for  last part of SRAM
	ram_group_2_register <=	digital_in(0) when ram_group_2_select = "000" else
				digital_in(1) when ram_group_2_select = "001" else
				digital_in(2) when ram_group_2_select = "010" else
				digital_in(3) when ram_group_2_select = "011" else
				digital_in(4) when ram_group_2_select = "100" else
				digital_in(5) when ram_group_2_select = "101" else
				digital_in(6) when ram_group_2_select = "110" else
				digital_in(7) when ram_group_2_select = "111" else
				'X';
	-- Select DIgital channel in for  last part of SRAM
	ram_group_3_register <=	digital_in(0) when ram_group_3_select = "000" else
				digital_in(1) when ram_group_3_select = "001" else
				digital_in(2) when ram_group_3_select = "010" else
				digital_in(3) when ram_group_3_select = "011" else
				digital_in(4) when ram_group_3_select = "100" else
				digital_in(5) when ram_group_3_select = "101" else
				digital_in(6) when ram_group_3_select = "110" else
				digital_in(7) when ram_group_3_select = "111" else
				'X';
	
	ram_group_2_select <=	'0' & std_ulogic_vector(ram_write_counter(1 downto 0)) when digital_in_by_8_muxed = '0' else
				ram_group_2_select_master when digital_in_by_8_muxed = '1' else
				"XXX";
	ram_group_3_select <=	'1' & std_ulogic_vector(ram_write_counter(1 downto 0)) when digital_in_by_8_muxed = '0' else
				ram_group_3_select_master when digital_in_by_8_muxed = '1' else
				"XXX";
	
	
	--select trigger input
	trigger_source_tmp <=  ram_data_in( 7 downto 0 ) when trigger_select_HS = "00" else
			   ram_data_in( 15 downto 8 ) when trigger_select_HS = "01" else
			   "0000000" & ram_data_in(16) when trigger_select_HS = "10" else
			   "0000000" & ram_data_in(17) when trigger_select_HS = "11" else
			   "XXXXXXXX";

	--		   
	-- ADDSUB_MACRO: Variable width & latency - Adder / Subtrator implemented in a DSP48E
	-- Spartan-6
	-- Xilinx HDL Libraries Guide, version 12.4
	ADDSUB_MACRO_inst : ADDSUB_MACRO
	generic map (
			DEVICE => "SPARTAN6", -- Target Device: "VIRTEX5", "VIRTEX6", "SPARTAN6"
			LATENCY => 2, -- Desired clock cycle latency, 0-2
			WIDTH => sram_addr_width+1) -- Input / Output bus width, 1-48
		port map (
				CARRYOUT => open, -- 1-bit carry-out output signal
				unsigned(RESULT) => ram_addr_adder, -- Add/sub result output, width defined by WIDTH generic
				A => std_logic_vector('0' & ram_address_offset), -- Input A bus, width defined by WIDTH generic
				ADD_SUB => vcc, -- 1-bit add/sub input, high selects add, low selects subtract
				B => std_logic_vector('0' & ram_trigger_address), -- Input B bus, width defined by WIDTH generic
				CARRYIN => gnd, -- 1-bit carry-in input
				CE => vcc, -- 1-bit clock enable input
				CLK =>hs_clock, -- 1-bit clock input
				RST => rst -- 1-bit active high synchronous reset
		);
	-- End of ADDSUB_MACRO_inst instantiation
	--ram_addr_adder <= ('0' & ram_address_offset) + ('0' & ram_trigger_address);
	ram_counter_wr_stop <= std_ulogic_vector(ram_addr_adder( sram_addr_width-1 downto 0 ));
	
	procTrigger: process ( rst, hs_clock ) is
	begin
		if rising_edge(hs_clock) then
			trigger_d1 <= trigger_source;
			--trigger_d2 <= trigger_d2;
			if trigger_edge = '1' then
				if (trigger_d1 < trigger_val_hs) and (trigger_source >= trigger_val_hs) and triggered = '0' then
					trig_it <= '1';
				end if;
			else
				if (trigger_d1 > trigger_val_hs) and (trigger_source <= trigger_val_hs) and triggered = '0' then
					trig_it <= '1';
				end if;
			end if;
			
			if trig_it = '1' then
				triggered <= '1';
				ram_trigger_address <= ram_write_counter;
				trig_it <= '0';
			end if;
			
			if manual_trigger = '1' and triggered = '0' then
				triggered <= '1';
				ram_trigger_address <= ram_write_counter;
			end if;
			
			if start_ram_capture = '1' then
				triggered <= '0';
			end if;
			
			if interruptdataread = '1' or ram_read_finished = '1' then
				triggered <= '0';
			end if;
		end if;
	end process procTrigger;
	
	
	-- COUNTER_LOAD_MACRO: Loadable variable counter implemented in a DSP48E
	-- Spartan-6
	-- Xilinx HDL Libraries Guide, version 12.4
	COUNTER_LOAD_INC_MACRO_inst : COUNTER_LOAD_INC_MACRO
	generic map (
		DEVICE => "SPARTAN6", -- Target Device: "VIRTEX5", "VIRTEX6", "SPARTAN6"
		WIDTH_DATA => sram_addr_width + 10) -- Counter output bus width, 1-48
	port map (
		std_ulogic_vector(Q) => counter_connection, -- Counter ouput, width determined by WIDTH_DATA generic
		CLK => hs_clock, -- 1-bit clock input
		CE => ram_write_counter_enable, -- 1-bit clock enable input
		DIRECTION => '1', -- 1-bit up/down count direction input, high is count up
		COUNT_BY => std_logic_vector(count_inc_by),
		LOAD => '0', -- 1-bit active high load input
		LOAD_DATA => (others => '0'), -- Counter load data, width determined by WIDTH_DATA generic
		RST => ram_write_counter_reset -- 1-bit active high synchronous reset
	);
	-- End of COUNTER_LOAD_MACRO_inst instantiation
	ram_write_counter <= unsigned(counter_connection( sram_addr_width+9 downto 10)); 

	
	RamWriteCounter: process ( rst, hs_clock, ram_counter_wr_stop ) is
	begin
	
		if rising_edge(hs_clock) then  --We change address on falling edge
			case ram_count_state_wr is
				when idle =>
					if start_ram_capture = '1' then
						ram_count_state_wr <= counting;
						data_capture_started <= '1';
						ram_full <= '0';
						sram_wr_sig <= '1';
						ram_write_counter_enable <= '1';
					end if;	
				when counting =>
					if std_ulogic_vector(ram_write_counter) = ram_counter_wr_stop and triggered = '1' then
						ram_count_state_wr <= idle;
						ram_full <= '1';
						sram_wr_sig <= '0';
						ram_write_counter_reset <= '1';
						ram_write_counter_enable <= '1';
					end if;
				when others =>
					ram_count_state_wr <= idle;
					sram_wr_sig <= '0';
			end case;
			
			if data_capture_started = '1' and start_ram_capture = '0' then
				data_capture_started <= '0';
			end if;
			
			if ram_write_counter_reset = '1' then
				ram_write_counter_enable <= '0';
				ram_write_counter_reset <= '0';
			end if;
			
			if interruptdataread = '1' or ram_read_finished = '1' then
				ram_write_counter_reset <= '1';
				ram_write_counter_enable <= '1';
				ram_full <= '0';
				data_capture_started <= '0';
				sram_wr_sig <= '0';
			end if;
		end if;	
	end process RamWriteCounter;
	
	
	RamReadCounter: process ( rst, clk ) is
	begin	
		
		if rising_edge(clk) then
			case ram_count_state_rd is
				when idle =>
					if ram_full = '1' then
						ram_count_state_rd <= read_data;
						read_ram_stop <= ram_trigger_address + ram_address_offset;
						ram_read_counter <= ram_trigger_address - (ram_read_size - ram_address_offset);
					end if;
					if read_ready = '1' then
						ram_data_available <= '0';
					end if;
					sram_oe <= '0';
					ram_read_finished <= '0';
					first_ram_read <= '0';
				when read_data =>
					if ram_data_available = '0' then
						if ram_read_counter =  read_ram_stop  then
							ram_count_state_rd <= idle;
							ram_read_finished <= '1';
						else
							sram_oe <= '1';
							combus_0 <= ram_data_out( 7 downto 0 );
							combus_1 <= ram_data_out( 15 downto 8 );
							combus_2 <= ram_data_out( sram_data_width-1 downto 16 );
							ram_data_available <= '1';
							ram_read_finished <= '0';
							ram_count_state_rd <= counting;
							first_ram_read <= '1';
						end if;
					end if;
				when counting =>		
					if read_ready = '0' then
						ram_read_counter <= ram_read_counter + 1;
						ram_count_state_rd <= wait_ready;
					end if;
				when wait_ready =>
					if read_ready = '1' then
						ram_data_available <= '0';
						ram_count_state_rd <= read_data;
					end if;
					
			end case;
			
			if interruptdataread = '1' then
				ram_count_state_rd <= idle;
				ram_data_available <= '0';
			end if;
		end if;
	end process RamReadCounter;

end RTL;
