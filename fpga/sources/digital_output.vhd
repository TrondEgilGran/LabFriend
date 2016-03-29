-- 74595 Communicator
-- Module Name: 74595
-- File Name: 74595.vhd
-- Author: Trond Egil Gran
-- Date: 20/09 2013
-- Operation:  Input two bytes + Adress

library ieee;
use ieee.std_logic_1164.all, ieee.numeric_std.all;

library UNISIM;
use UNISIM.vcomponents.all;

library UNIMACRO;  
use UNIMACRO.Vcomponents.all;


entity digital_output is
	generic( address : std_logic_vector( 7 downto 0) := "00011000");
	
	port (  hs_clk : in std_logic;
		clk : in std_logic;
		rst : in std_logic;
		datain : in std_logic_vector( 7 downto 0);
		addr : in std_logic_vector( 7 downto 0);
		wr : in std_logic;
		digiout : out std_logic_vector(7 downto 0));
end digital_output;

architecture rtl of digital_output is
	--constant
	--
	--type machine is (idle, 
type datamachine is (config, buffersize_data, samplerate_high, samplerate_low, fill_ram );
signal data_state : datamachine := config; 

type singleshot is (wait_for_trigger, wait_for_reset);
signal data_stop_state : singleshot := wait_for_trigger;

signal recieved_data : std_logic_vector( 7 downto 0 ) := "00000000";
signal enable : std_logic := '0';
signal hs_clk_n : std_logic;

signal read_counter, write_counter, count_stop, samplerate, sample_counter : unsigned(10 downto 0) := (others => '0');
signal direct_buffer, single_burst : std_logic;

signal ram_input_data : std_logic_vector(7 downto 0);
signal ram_output_data : std_logic_vector(7 downto 0);
signal ram_write_adddress : std_logic_vector(10 downto 0);
signal ram_read_address : std_logic_vector(10 downto 0);
signal ram_write_en : std_logic;
signal ram_read_en : std_logic;

signal ram_write_en_vec : std_logic_vector(0 downto 0);

signal stop_data_hs, stop_data, rck_reg : std_logic := '0';

begin

	getData: process (rst, clk, datain, addr) is
	
	begin
		if rst = '1' then
			data_state <= config;
			recieved_data <= (others => '0');
		elsif rising_edge(clk) then
			if wr = '1' and addr = address then
				case data_state is
					when config =>
						enable <= datain(0);
						direct_buffer <= datain(1);
						single_burst <= datain(2);
						count_stop(10 downto 8) <= unsigned(datain(7 downto 5));
						data_state <= buffersize_data;
						stop_data <= '1';
					when buffersize_data =>
						if direct_buffer = '1' then
							recieved_data <= datain;
							data_state <= config;
						else
							data_state <= samplerate_high;
							count_stop(7 downto 0) <= unsigned(datain); 
						end if;
					when samplerate_high =>
						samplerate(10 downto 8) <= unsigned(datain(2 downto 0));
						data_state <= samplerate_low;
					when samplerate_low => 
						samplerate(7 downto 0) <= unsigned(datain);
						data_state <= fill_ram;
						
					when fill_ram =>
						if write_counter = count_stop then
							write_counter <= (others => '0');
							data_state <= config;
							stop_data <= '0';
						else	
							write_counter <= write_counter +1;
						end if;
						ram_write_adddress <= std_logic_vector(write_counter);
						ram_input_data <=  datain;
						ram_write_en <= '1';
						
				end case;
			end if;
			
			if ram_write_en = '1' then
				ram_write_en <= '0';
			end if;
			
		end if;
	end process getData;
	
	ram_write_en_vec(0) <= ram_write_en;
	BRAM_SDP_MACRO_inst : BRAM_SDP_MACRO
	generic map (
		BRAM_SIZE => "18Kb", -- Target BRAM, "9Kb" or "18Kb"
		DEVICE => "SPARTAN6", -- Target device: "VIRTEX5", "VIRTEX6", "SPARTAN6"
		WRITE_WIDTH => 8, -- Valid values are 1-36
		READ_WIDTH => 8, -- Valid values are 1-36
		DO_REG => 0, -- Optional output register (0 or 1)
		INIT_FILE => "NONE",
		SIM_COLLISION_CHECK => "ALL")  -- Collision check enable "ALL", "WARNING_ONLY",
	port map (
		DO => ram_output_data, -- Output read data port, width defined by READ_WIDTH parameter
		DI => ram_input_data, -- Input write data port, width defined by WRITE_WIDTH parameter
		RDADDR => ram_read_address, -- Input read address, width defined by read port depth
		RDCLK => hs_clk, -- 1-bit input read clock
		RDEN => ram_read_en, -- 1-bit input read port enable
		REGCE => '1', -- 1-bit input read output register enable
		RST => rst, -- 1-bit input reset
		WE => ram_write_en_vec, -- Input write enable, width defined by write port depth
		WRADDR => ram_write_adddress, -- Input write address, width defined by write port depth 
		WRCLK => clk, -- 1-bit input write clock
		WREN => ram_write_en -- 1-bit input write port enable
	);	
	-- End of BRAM_SDP_MACRO_inst instantiation

	
	ramReader : process(hs_clk, enable) is
	begin
		if rising_edge(hs_clk) and enable = '1' then
			if direct_buffer = '1' then
				digiout <= recieved_data;
			else	
				if enable = '1' and stop_data_hs = '0' then
					if sample_counter = samplerate then
						
						if read_counter = count_stop then
							read_counter <= (others =>'0');
							if single_burst = '1' then
								stop_data_hs <= '1';
								ram_read_en <= '0';
							end if;
						else
							read_counter <= read_counter + 1;
						end if;
						
						ram_read_address <= std_logic_vector(read_counter);
						ram_read_en <= '1';
						
						sample_counter <= (others => '0');
					else
						sample_counter <= sample_counter + 1;
						ram_read_en <= '0';
					end if;
				end if;
				digiout <= ram_output_data;
			end if;
			
			if stop_data = '1' then --reset read counter when new data arrives
				read_counter <= (others =>'0');
			end if;
			
			if stop_data = '0' then
				case data_stop_state is 
					when wait_for_trigger =>
						stop_data_hs <= '0';
						data_stop_state <= wait_for_reset;
					when wait_for_reset =>
				end case;
			else
				data_stop_state <= wait_for_trigger;
			end if;
			
		end if;
	end process ramReader;

end rtl;