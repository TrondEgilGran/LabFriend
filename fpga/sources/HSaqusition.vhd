-------------------------------------------------------------------------
--High speed data aqusition module for TEG Electronics 
--LabFriend Measurement system.
--
--Description: 	Stores data from AD coverters and digital inputs to then
--		DDR3 Ram.
--Written: 2015 by Trond Egil Gran
--------------------------------------------------------------------------
library ieee;
use ieee.std_logic_1164.all, ieee.numeric_std.all;

library UNISIM;
use UNISIM.vcomponents.all;

library UNIMACRO;  
use UNIMACRO.Vcomponents.all;

entity HSaqusition is
	generic( ram_addr_width : natural := 30; --Number of bits in SRAM addr bus
		 ram_data_width : natural := 32; --Width of the ddr interface data bus
		 ram_depth : natural := 24;  --Max level size to use for ram addressing, shold be less than max level of one bank
		 address : std_logic_vector( 7 downto 0 ) := "00000001" --Module address used to address this dev device, should be defined
									--in gerneric map on top level.
		 );

	port (  --Data communication ports used to communicate with the master system
		clk : in std_logic; --system clock 
		rst : in std_logic; --system reset
		datain : in std_logic_vector( 7 downto 0); --datainput from comm master 
		addr : in std_logic_vector( 7 downto 0);   --address input from comm master
		wr : in std_logic; --write pulse from comm master
		rd : in std_logic; --read pulse from comm master
		dataout : out std_logic_vector( 7 downto 0); --data output to comm master
		-------------------------------------------------------------------------
		--
		--DDR3 interface 
		ram_addr : out std_logic_vector( ram_addr_width-1 downto 0);
		ram_data_write : out std_logic_vector( ram_data_width-1 downto 0);
		ram_wr_en : out std_logic;
		ram_rd_en : out std_logic;
		ram_rd_empty : in std_logic;
		ram_cmd_en : out std_logic;
		ram_data_read : in std_logic_vector( ram_data_width-1 downto 0);
		ram_command : out std_logic_vector(2 downto 0);
		ram_bl : out std_logic_vector(5 downto 0);
		ram_clock : out std_logic;
		-----------------------------------------------------------------------
		--
		--Data aqusition signals
		digital_in : in std_logic_vector( 7 downto 0); 
		hs_adc_a : in std_logic_vector( 7 downto 0);
		hs_adc_b : in std_logic_vector( 7 downto 0);
		adc_clk_a : out std_logic;
		adc_clk_b : out std_logic;
		adc_pwd_d : out std_logic;
		--
		--High speed clock inputs
		hs_clock_2 : in std_logic;  --2x master clock 
		hs_clock_4 : in std_logic;  --4x master clock
		-------------------------------------------------------------------
		--
		--External triggers
		trigger_in1 : in std_logic;
		trigger_in2 : in std_logic;
		trigger_out : out std_logic
		);
end HSaqusition;

architecture RTL of HSaqusition is

component COUNTER_LOAD_INC_MACRO is
  generic ( 
	    DEVICE : string;
            STYLE : string := "AUTO";
            WIDTH_DATA : integer
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

type ram_machine is (idle, write_adc_a, write_adc_b, write_digital_in, write_buffer);
signal ram_machine_1 : ram_machine := idle;
type singlestrobe is (idle, strobe_triggered);
signal ram_write_strobe, ram_full_strobe  : singlestrobe := idle;
type datamachine is (idle, process_command, read_trigger, read_ram, read_status, configure);
signal data_state : datamachine := idle; 
type WRcountermachine is (idle, counting, read_data, wait_ready);
signal ram_count_state_wr, ram_count_state_rd : WRcountermachine := idle;
type ram_read_strober is (idle, send_read_command, strobe_triggered);
signal ram_read_strobe : ram_read_strober := idle;


signal ram_group_0_select, ram_group_1_select, trigger_select, trigger_select_HS  : std_logic_vector( 1 downto 0 ) := (others => '0');
signal ram_group_2_select, ram_group_3_select : std_logic_vector( 2 downto 0 ) := (others => '0');
signal ram_group_2_select_master, ram_group_3_select_master : std_logic_vector( 2 downto 0 ) := (others => '0') ;
signal digital_in_by_8_muxed : std_logic;

signal ram_write_counter, ram_address_offset, ram_trigger_address : unsigned( ram_depth-1 downto 0 ) :=(others => '0') ;
signal ram_read_counter : unsigned( ram_depth+1 downto 0 ) := (others => '0') ;
signal read_ram_stop, ram_read_size : unsigned( ram_depth+1 downto 0 ) := (others => '1');
signal ram_counter_wr_stop : std_logic_vector( ram_depth-1 downto 0 ) := (others => '0');
signal ram_data_in, ram_data_out : std_logic_vector(ram_data_width-1 downto 0 ) := (others => '0');
signal adc_clk_a_select, adc_clk_b_select, read_ready, ram_data_available, ram_read_finished, ram_ready : std_logic := '0';
signal trigger_source, trigger_source_tmp, trigger_d1, trigger_d2, trigger_val, trigger_val_d1, trigger_val_hs: std_logic_vector(7 downto 0) := (others => '0');
signal start_ram_capture, ram_full, data_capture_started, trigger_edge, triggered, manual_trigger : std_logic := '0';
signal ram_addr_adder : unsigned( ram_depth downto 0 ) := (others => '0');
signal ram_addr_adder_l, ram_address_offset_l, ram_trigger_address_l : std_logic_vector( ram_depth downto 0 ) := (others => '0');
signal combus_0, combus_1 : std_logic_vector( 7 downto 0 ) := (others => '0');
signal combus_2, combus_3 : std_logic_vector( 7 downto 0) := (others => '0');
signal combus : std_logic_vector( 2 downto 0) := (others => '0');
signal command : std_logic_vector( 2 downto 0) := (others => '0');
signal ram_wr_sig, ram_wr_sig_delayed, configdone, interruptdataread, ram_wr_en_sig, ram_cmd_en_sig : std_logic := '0';
signal ram_rd_en_sig : std_logic := '0';
signal rdcnt : unsigned(7 downto 0) := (others => '0');
signal first_ram_write : std_logic := '1';
signal clocksel : std_logic_vector(1 downto 0) := (others => '0');
signal clock_mux_con,  clock_mux_con_n : std_logic :='0';
signal hs_clock, hs_clock_n : std_logic := '0';
signal adc_clk_a_select_n, adc_clk_b_select_n : std_logic := '0';
signal gnd, vcc : std_logic;
signal adc_a_register, adc_b_register, digital_in_register : std_logic_vector(7 downto 0) := (others => '0');

signal ram_write_counter_reset, ram_write_counter_enable : std_logic :='1';
signal trig_it : std_logic := '0';
signal counter_connection : std_logic_vector( ram_depth+9 downto 0 );
signal counter_connection_m : std_logic_vector( 17 downto 0 );
signal write_counter_connection : std_logic_vector( 20 downto 0 );
signal ram_dcm_fb : std_logic;

signal adc_a_to_ram_reg, adc_b_to_ram_reg, digital_in_to_ram_reg, data_from_ram_reg : std_logic_vector( 31 downto 0 );
signal adc_a_to_ram_out, adc_b_to_ram_out, digital_in_to_ram_out, ram_data_write_sig : std_logic_vector( 31 downto 0 );

signal adc_a_enable, adc_b_enable, digital_in_enable : std_logic := '0';
signal ram_read_signal, release_ram, start_ram_read, ram_read_started, digital_in_ram_rd_sig : std_logic := '0';
signal aq_channel : std_logic_vector(1 downto 0);
signal control_signals : std_logic_vector(4 downto 0);

signal ram_write_address : std_logic_vector( 20 downto 0);
signal ram_address_counter_inc_m : std_logic_vector( 2 downto 0);
signal ram_buffer_counter : unsigned(6 downto 0) := (others => '0');

signal store_start_address : std_logic := '0';

signal ram_read_multiplyer : unsigned(1 downto 0);

signal ram_data_collected : std_logic := '0';

signal fill_write_buffer : std_logic := '0';

--Counter signals
signal counter_1 : unsigned(ram_depth-1 downto 0) := (others => '0');
signal counter_2 : unsigned(ram_depth-1 downto 0) := (others => '0');
signal counter_3 : unsigned(14 downto 0) := (others => '0');


signal counter_0_free_en : std_logic := '0';
signal counter_1_ram_address_en : std_logic := '0';
signal counter_3_sample_rate_en : std_logic := '1';

signal counter_1_ram_address_reset : std_logic := '0';
signal counter_2_trig_offset_reset : std_logic := '0';
signal counter_3_sample_rate_rst : std_logic := '0';

signal counter_1_ram_address_count_by : std_logic_vector(ram_depth-1 downto 0) := (others => '0');

signal counter_1_ram_address_load_start_en : std_logic := '0';
signal counter_1_ram_address_load_start : std_logic_vector(ram_depth-1 downto 0) := (others => '0');
signal counter_2_trig_offset_load : std_logic_vector(ram_depth-1 downto 0) := "000000000000000101010001";

signal counter_0_free_output : std_logic_vector(ram_depth-1 downto 0) := (others => '0');
signal counter_1_ram_address_output : std_logic_vector(ram_depth-1 downto 0) := (others => '0');
signal counter_2_trig_offset_output : std_logic_vector(ram_depth-1 downto 0) := (others => '0');
signal counter_3_sample_rate_output : std_logic_vector(13 downto 0) := (others => '0');

--counter compare signals
signal counter_1_ram_address_buffer_size : std_logic_vector(ram_depth-1 downto 0) := "000000000000010101000110";
signal counter_3_sample_rate_value : std_logic_vector(13 downto 0) := "00000000000000";

signal count_by_one : std_logic_vector( ram_depth-1 downto 0) := (others => '0');

signal ram_clock_en : std_logic := '0';


-- Used to 
signal capture_ram_read_start : std_logic := '0';
signal ram_read_start_address : std_logic_vector(ram_depth-1 downto 0) := (others => '0');


signal ram_read_mode : std_logic := '0';


--signal testc : unsigned( 7 downto 0) := "00000000";

begin

	hs_clock_n <= not hs_clock;
	adc_clk_a_select_n <= not adc_clk_a_select;
	adc_clk_b_select_n <= not adc_clk_b_select;
	gnd <= '0';
	vcc <= '1';
	trigger_out <= ram_full;
	
	--  High speed clock selection using two Xilinx Global Mux Buffers
	--
	--   CLK_1----|-------|
	--   CLK_2----|-------|----|------|
	--   CLK_3-----------------|------|----CLKO
	--   
	--   clocksel = 1x hs_clock = 4 x msaster clock
	--   clocksel = 00 hs_clock = master clock
	--   clocksel = 01 hs_clock = 2 x master clock
	--
	------------------------------------------------------------------------------------------
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
	---------------------------------------------------------------------------------------------
	
	
	-- ADC clock outputs since the ADCs are connected to regular in pins and not dedicated global clock pins
	-- a ddr output register is used to allow the clock singel to be passed to the io pin. The DDR output register
	-- is also able to select clock polarity, so two registers is used one for each ADC so it's possible to interleave
	-- the data from both ADCs by inverting the clock on one of the ADCs
	--
	------------------------------------------------------------------------------------------------------------------
	-- ODDR2: Output Double Data Rate Output Register with Set, Reset
	-- and Clock Enable.
	-- Spartan-6
	-- Xilinx HDL Libraries Guide, version 12.4
	ODDR2_inst_1 : ODDR2
	generic map(
		DDR_ALIGNMENT => "NONE", -- Sets output alignment to "NONE", "C0", "C1"
		INIT => '0', -- Sets initial state of the Q output to
		SRTYPE => "SYNC") -- Specifies "SYNC" or "ASYNC" set/reset
	port map (
		Q => adc_clk_a, -- 1-bit output data
		C0 => hs_clock, -- 1-bit clock input
		C1 => hs_clock_n, -- 1-bit clock input
		CE => vcc, -- 1-bit clock enable input
		D0 => adc_clk_a_select, -- 1-bit data input (associated with C0)
		D1 => adc_clk_a_select_n, -- 1-bit data input (associated with C1)
		R => gnd, -- 1-bit reset input
		S => gnd -- 1-bit set input
	);
	ODDR2_inst_2 : ODDR2
	generic map(
		DDR_ALIGNMENT => "NONE", -- Sets output alignment to "NONE", "C0", "C1"
		INIT => '0', -- Sets initial state of the Q output to
		SRTYPE => "SYNC") -- Specifies "SYNC" or "ASYNC" set/reset
	port map (
		Q => adc_clk_b, -- 1-bit output data
		C0 => hs_clock, -- 1-bit clock input
		C1 => hs_clock_n, -- 1-bit clock input
		CE => vcc, -- 1-bit clock enable input
		D0 => adc_clk_b_select, -- 1-bit data input (associated with C0)
		D1 => adc_clk_b_select_n, -- 1-bit data input (associated with C1)
		R => gnd, -- 1-bit reset input
		S => gnd -- 1-bit set input
	);
	-- End of ODDR2_inst instantiation
	--------------------------------------------------------------------------------------------------------------------
	
	--Use the high speed clock for the DDR user ram interface
	ram_clock <= hs_clock;
	---------------------------------------------------------
	
	--Communicate with master module, used to set configuration data and read back aquired data
	masterComms: process (rst, clk, datain, addr) is
	begin
		if rising_edge(clk) then
			if addr( 3 downto 0 ) = address( 3 downto 0 ) then
				case data_state is
					when idle =>
						if wr = '1' then
							command <= datain( 2 downto 0);
							data_state <= process_command;
							control_signals <= datain( 7 downto 3);
						end if;
						interruptdataread  <= '0';
					when process_command =>
						case command is
							when "000" =>
								data_state <= read_trigger;
							when "001" =>
								data_state <= read_ram;
								read_ready <= '0';
								aq_channel <= control_signals(1 downto 0);
								release_ram <= '0';
								start_ram_read <= '1';
							when "010" =>
								data_state <= configure;
							when "011" =>
								data_state <= read_status;
							when "100" =>
								data_state <= idle;
								release_ram <= control_signals(0);
							when others =>
								data_state <= idle;
						end case;
					when read_trigger  =>
						if rd = '1' then
							case combus is
								when "000" =>
									dataout <= std_logic_vector(ram_trigger_address( 7 downto 0));
									combus <= "001";
								when "001" =>
									dataout <= std_logic_vector(ram_trigger_address( 15 downto 8));
									combus <= "010";
								when "010" =>
									dataout(2 downto 0) <= std_logic_vector(ram_trigger_address( ram_depth-1 downto 16));
									dataout(7 downto 3) <= (others => '0');
									combus <= "011";
								when "011" =>
									dataout <= ram_counter_wr_stop( 7 downto 0 );
									combus <= "100";
								when "100" =>
									dataout <= ram_counter_wr_stop( 15 downto 8 );
									combus <= "101";
								when "101" =>
									dataout(2 downto 0) <= ram_counter_wr_stop( ram_depth-1 downto 16 );
									dataout(7 downto 3) <= (others => '0');
									combus <= "000";
									data_state <= idle;
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
							dataout(5) <= manual_trigger;
							dataout(7 downto 6) <= "11"; 
							data_state <= idle;
						end if;
					when read_ram =>
						if rd = '1' then
							if ram_data_available = '1'  then
								
								case combus is
									when "000" =>
										dataout <= combus_0;
										combus <= "001";
										read_ready <= '0';
									when "001" =>
										dataout <= combus_1;
										combus <= "010";
									when "010" =>
										dataout <= combus_2;
										combus <= "011";
									when "011" =>
										dataout <= combus_3;
										--dataout <= std_logic_vector(rdcnt);
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
								--dataout <= "00001010";
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
									adc_a_enable <= datain(0);
									adc_b_enable <= datain(1);
									digital_in_enable <= datain(2);
									combus <= "001";
									configdone <= '0';
								when "001" =>
									adc_clk_a_select <= datain(3);
									adc_clk_b_select <= datain(4);
									adc_pwd_d <= datain(5);
									clocksel <= datain(7 downto 6);
									combus <= "010";
								when "010" =>
									trigger_select <= datain( 1 downto 0);
									trigger_edge <= datain(2);
									manual_trigger <= datain(3);
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
									start_ram_capture <= datain(3);  ---Starts the data capture if datain(3)=1
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
			
			if ram_read_started = '1' then 
				start_ram_read <= '0';
			end if;
		end if;
		trigger_val_d1 <= trigger_val;
	end process masterComms;
	
	
	-- Counters used for oscilloscope action, implimented using DSP blocks
	--

	
	counter_1_proc : process(hs_clock, counter_1_ram_address_en, counter_1_ram_address_reset, ram_cmd_en_sig)
	begin
		if rising_edge(hs_clock) then
			if counter_1_ram_address_reset = '1' then
				counter_1 <= (others => '0');
			elsif ram_cmd_en_sig = '1' and counter_1_ram_address_en = '1' then
				if counter_1_ram_address_load_start_en = '1' then
					counter_1 <= unsigned(counter_1_ram_address_load_start);
				else
					if counter_1 = unsigned(counter_1_ram_address_buffer_size) then
						counter_1 <= (others => '0');
					else	
						counter_1 <= counter_1 + unsigned(counter_1_ram_address_count_by);
					end if;		
				end if;
			end if;
			ram_addr(ram_depth-1 downto 0) <= std_logic_vector(counter_1);
			ram_addr(ram_addr_width-1 downto ram_depth) <= (others => '0');
		end if;	
	end process counter_1_proc;
	--
	counter_2_proc : process(hs_clock, counter_2_trig_offset_reset, ram_cmd_en_sig)
	begin
		if rising_edge(hs_clock) then
			if counter_2_trig_offset_reset = '1' then
				ram_full <= '0';
				counter_2 <= unsigned(counter_2_trig_offset_load);
			elsif ram_cmd_en_sig = '1' and triggered = '1' then
					if counter_2 = 0 then
						counter_2 <= (others => '0'); --finish ram write or read
						if data_capture_started = '1' then
							ram_full <= '1';
						end if;
					else	
						counter_2 <= counter_2 - 1;
					end if;		
			end if;
		end if;	
	end process counter_2_proc;
	
	counter_3_proc : process(hs_clock, counter_3_sample_rate_en, counter_3_sample_rate_rst)
	begin
		if rising_edge(hs_clock) then
			if counter_3_sample_rate_rst = '1' then
				counter_3 <= (others => '0');
			elsif counter_3_sample_rate_en = '1' then
				if counter_3 = unsigned(counter_3_sample_rate_value) then
					counter_3 <= (others => '0');
					ram_clock_en <= '1';
				else	
					ram_clock_en <= '0';
					counter_3 <= counter_3 + 1 ;
				end if;		
			else
				ram_clock_en <= '1';
			end if;
		end if;	
	end process counter_3_proc;
	---------------------------------------------------------------------------------------------------------
	
	ram_address_counter_inc_m(0) <= ((digital_in_enable and adc_a_enable) and adc_b_enable) or (( not digital_in_enable and adc_a_enable) and not adc_b_enable) or 
					((adc_b_enable xor digital_in_enable) and not adc_a_enable);
	ram_address_counter_inc_m(1) <= (adc_a_enable and adc_b_enable) or ((adc_a_enable xor adc_b_enable) and digital_in_enable);
	ram_address_counter_inc_m(2) <= '0';
	
	---debug signal
	trigger_out <= ram_full;
	--.finished debug signal
	
	--Counter 0, continous at hs_clock, capture at trigger and first counter 1 after trigger. free running
	--counter 1, ram address counter count by buffer size, return to 0 at wanted ram size
	--Counter 2, Start at trigger, load time offset value, count down buffer, capture Counter 1
	--           and Counter 0 at 0.
	SpeedDevil : process( hs_clock, rst )
	begin
		if rising_edge(hs_clock) then
			
			--Store adc and digital input data in registers
			-----------------------------------------------
			adc_a_register <= hs_adc_a;
			adc_b_register <= hs_adc_b;
			digital_in_register <= digital_in;
			-----------------------------------------------
			
			--Create 32bit words to store in RAM
			--------------------------------------------------------------------------------
			--ADC A
			adc_a_to_ram_reg( 7 downto 0 ) <= adc_a_register;
			adc_a_to_ram_reg( 15 downto 8 ) <= adc_a_to_ram_reg( 7 downto 0 );
			adc_a_to_ram_reg( 23 downto 16 ) <= adc_a_to_ram_reg( 15 downto 8 );
			adc_a_to_ram_reg( 31 downto 24 ) <= adc_a_to_ram_reg( 23 downto 16 );
			--ADC B
			adc_b_to_ram_reg( 7 downto 0 ) <= adc_b_register;
			adc_b_to_ram_reg( 15 downto 8 ) <= adc_b_to_ram_reg( 7 downto 0 );
			adc_b_to_ram_reg( 23 downto 16 ) <= adc_b_to_ram_reg( 15 downto 8 );
			adc_b_to_ram_reg( 31 downto 24 ) <= adc_b_to_ram_reg( 23 downto 16 );
			--Digital input
			digital_in_to_ram_reg( 7 downto 0 ) <= digital_in_register;
			digital_in_to_ram_reg( 15 downto 8 ) <=  digital_in_to_ram_reg( 7 downto 0 );
			digital_in_to_ram_reg( 23 downto 16 ) <= digital_in_to_ram_reg( 15 downto 8 );
			digital_in_to_ram_reg( 31 downto 24 ) <= digital_in_to_ram_reg( 23 downto 16 );
			--------------------------------------------------------------------------------
			
			
		
			--Register data to store in RAM. data_to_ram should be strobed every fourth clock cycle.
			-----------------------------------------------------------------------------------------
			if (ram_clock_en = '1') then 
			
				case ram_machine_1 is
					when idle =>
						if start_ram_capture = '1' then
							data_capture_started <= '1';
							ram_machine_1 <= write_adc_a;
							counter_0_free_en <= '1';
							counter_1_ram_address_en <= '1';
							counter_1_ram_address_reset <= '1';
							counter_2_trig_offset_reset <= '1';
							counter_1_ram_address_count_by <= "000000000000000000010010";
						end if;
						
						if ram_full = '1' then
							counter_0_free_en <= '0';
							counter_1_ram_address_en <= '0';
							data_capture_started <= '0';
						end if;
					when write_adc_a =>
						counter_1_ram_address_reset <= '0';
						counter_2_trig_offset_reset <= '0';
						adc_b_to_ram_out <= adc_b_to_ram_reg;
						digital_in_to_ram_out <= digital_in_to_ram_reg;
						ram_data_write_sig <= adc_a_to_ram_reg;
						if adc_a_enable = '1' then
							ram_wr_en_sig <= '1';	
						else
							ram_wr_en_sig <= '0';
						end if;
						ram_machine_1 <= write_adc_b;
						
					when write_adc_b =>
						
						if adc_b_enable = '1' then
							ram_wr_en_sig <= '1';
							ram_data_write_sig <= adc_b_to_ram_out;
						else
							ram_wr_en_sig <= '0';
						end if;
						ram_machine_1 <= write_digital_in;
					when write_digital_in =>
						
						if digital_in_enable = '1' then
							ram_wr_en_sig <= '1';
							ram_data_write_sig <= digital_in_to_ram_out;
						else
							ram_wr_en_sig <= '0';
						end if;
						ram_machine_1 <= write_buffer;
					when write_buffer =>
						if ram_buffer_counter >= 15 then	
							ram_command <= "000";
							ram_cmd_en_sig <= '1'; -- also used to increment ram counter
							ram_buffer_counter <= (others => '0');
						else
							ram_buffer_counter <= ram_buffer_counter + unsigned(ram_address_counter_inc_m);
						end if;
						
						if ram_full = '1' then
							ram_machine_1 <= idle;
						else
							ram_machine_1 <= write_adc_a;
						end if;
						ram_wr_en_sig <= '0';
				end case;
				--3 byte = 18
				--2 byte = 
				if ram_address_counter_inc_m = "01" then
					ram_bl <= "001111"; --fill half of the ram buffer
				else
					ram_bl <= "010001"; --fill half of the ram buffer
				end if;
                            
                            if ram_full = '1' then
                                ram_read_mode <= '1';
                                counter_2_trig_offset_reset <= '1';
                            end if;
                            
                            if ram_read_mode = '1' then
                                    counter_2_trig_offset_reset <= '0';
                                    ram_wr_en_sig <= '0';
                                    ram_write_strobe <= idle;
                                    first_ram_write <= '1';
                                    store_start_address <= '0';
                                    ram_buffer_counter <= (others => '0');
                                    --We use digital_in channel to read back data.
                                    if ram_read_signal = '1' then
                                            case ram_read_strobe is
                                                    when idle =>
                                                            ram_read_strobe <= send_read_command;
                                                            ram_command <= "001"; --read ram data
                                                            ram_bl <= "000000"; --read one word at a time
                                                            counter_1_ram_address_count_by <= "000000000000000000000001";
                                                    when send_read_command =>
                                                            ram_cmd_en_sig <= '1';
                                                            ram_read_strobe <= strobe_triggered;
                                                    when strobe_triggered =>
                                                            
                                                            if ram_rd_empty = '0'  and ram_data_collected = '0' then
                                                                    ram_rd_en_sig <= '1';
                                                                    data_from_ram_reg <= ram_data_read;
                                                                    ram_data_collected <= '1';
                                                                    counter_1_ram_address_en <= '1';
                                                            end if;	
                                            end case;
                                    else
                                            ram_read_strobe <= idle;
                                            if ram_data_available = '1' or ram_read_finished = '1' then
                                                    ram_data_collected <= '0';
                                            end if;
                                    
                                    end if;
                                    if ram_read_finished = '1' then
                                        counter_1_ram_address_en <= '0';
                                    end if;
                            end if;
				
			end if;
			
			ram_data_write <= ram_data_write_sig;
			ram_wr_en <= ram_wr_en_sig;
			
			
			
			if ram_rd_en_sig = '1' then
				ram_rd_en_sig <= '0';
			end if;
			
			if ram_cmd_en_sig = '1' then
				ram_cmd_en_sig <= '0';
				
			end if;
			
			
			trigger_select_HS <= trigger_select;
			trigger_source <= trigger_source_tmp;
			trigger_val_hs <= trigger_val_d1; 
		end if;
	end process SpeedDevil;
	ram_cmd_en <= ram_cmd_en_sig;
	ram_rd_en <= ram_rd_en_sig;
	
	
	
	--select trigger input
	trigger_source_tmp <=  adc_a_register when trigger_select_HS = "00" else
			   adc_b_register when trigger_select_HS = "01" else
			   digital_in_register when trigger_select_HS = "10" else
			   "XXXXXXXX";

	--		   

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
				ram_trigger_address <= counter_1;
				trig_it <= '0';
			end if;
			
			if manual_trigger = '1' and triggered = '0' then
				triggered <= '1';
				ram_trigger_address <= counter_1;
			end if;
			
			if start_ram_capture = '1' then
				triggered <= '0';
			end if;
			
			if interruptdataread = '1' or ram_read_finished = '1' then
				triggered <= '0';
			end if;
		end if;
	end process procTrigger;
	
	


	

	
	RamReadCounter: process ( rst, clk ) is
	begin	
		
		if rising_edge(clk) then
			if start_ram_read = '0' then 
				ram_read_started <= '0';
			end if;
			case ram_count_state_rd is
				when idle =>
					if ram_read_mode = '1' then
                                                ram_count_state_rd <= read_data;
                                                ram_read_signal <= '1';
                                                ram_read_started <= '1';
					end if;
					if read_ready = '1' then
						ram_data_available <= '0';
					end if;
					ram_read_finished <= '0';

					
				when read_data =>
					if ram_data_available = '0' then
						if ram_read_counter(ram_depth+1 downto 2) =  read_ram_stop(ram_depth+1 downto 2)  then
							ram_count_state_rd <= idle;
							if release_ram = '1' then --if release ram then ram_full will become '0' otherwise read ram can be redone.
								ram_read_finished <= '1';
							end if;
						else	
							if ram_data_collected = '1' then
								combus_0 <= data_from_ram_reg(7 downto 0);
								combus_1 <= data_from_ram_reg(15 downto 8);
								combus_2 <= data_from_ram_reg(23 downto 16);
								combus_3 <= data_from_ram_reg(31 downto 24);
								ram_data_available <= '1';
								ram_read_finished <= '0';
								ram_count_state_rd <= counting;
								ram_read_signal <= '0';
							end if;
						end if;
					end if;
				when counting =>		
					if read_ready = '0' then
                                           ram_count_state_rd <= wait_ready;
						
					end if;
				when wait_ready =>
					if read_ready = '1' then
						ram_data_available <= '0';
						ram_count_state_rd <= read_data;
					else
						ram_read_signal <= '1';
					end if;					
					
					
			end case;
			
			if interruptdataread = '1' then
				ram_count_state_rd <= idle;
				ram_data_available <= '0';
			end if;
			
			
		end if;
	end process RamReadCounter;
	

end RTL;
