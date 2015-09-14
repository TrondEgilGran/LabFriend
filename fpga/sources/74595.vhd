-- 74595 Communicator
-- Module Name: 74595
-- File Name: 74595.vhd
-- Author: Trond Egil Gran
-- Date: 20/09 2013
-- Operation:  Input two bytes + Adress

library ieee;
use ieee.std_logic_1164.all, ieee.numeric_std.all;


entity s74595 is
	generic( nr_of_bits : natural := 16 ;
	         frequency_div : natural := 5000;
	         frequency_div_half : natural := 2500;
	         address : std_ulogic_vector( 7 downto 0) := "00000100");
	
	port (
		clk : in std_ulogic;
		rst : in std_ulogic;
		datain : in std_ulogic_vector( 7 downto 0);
		addr : in std_ulogic_vector( 7 downto 0);
		wr : in std_ulogic;
		busy : out std_ulogic;
		ser : out std_ulogic;
		rck :  out std_ulogic;
		sck : out std_ulogic);
end s74595;

architecture rtl of s74595 is
	--constant
	--
	--type machine is (idle, 
type datamachine is (first_byte, second_byte);
type serialmachine is ( wait_for_trigger, start_transfer, wait_delay, shift_data, finish_transfer );
signal data_state : datamachine := first_byte; 
signal serial_state : serialmachine;
signal trigger_serial_transfer, serial_transfer_triggered : std_ulogic := '0';

signal recieved_data, shift_reg : std_ulogic_vector( nr_of_bits-1 downto 0 );
signal boot, boot_2 : std_ulogic := '1'; 
signal serial_busy : std_ulogic;

begin

	getData: process (rst, clk, datain, addr) is
	
	begin
		if rst = '1' then
			data_state <= first_byte;
			recieved_data <= (others => '0');
			trigger_serial_transfer <= '0';
			boot <= '1';
		elsif rising_edge(clk) then
			if wr = '1' and addr = address and boot = '0' then
				case data_state is
					when first_byte =>
						recieved_data( nr_of_bits-1 downto nr_of_bits-8 ) <= datain;
						data_state <= second_byte;
					when second_byte =>
						recieved_data( nr_of_bits/2 -1 downto 0) <= datain;
						data_state <= first_byte;
						trigger_serial_transfer <= '1';
				end case;
			elsif boot = '1' then -- Make sure relays don't start with voltage 
				case data_state is
					when first_byte =>
						recieved_data( nr_of_bits-1 downto nr_of_bits-8 ) <= "00000000";
						data_state <= second_byte;
					when second_byte =>
						recieved_data( nr_of_bits/2 -1 downto 0) <= "00000000";
						data_state <= first_byte;
						trigger_serial_transfer <= '1';
				end case;
				if boot_2 = '0' and serial_busy = '0' then
					boot <= '0';
				end if;
				boot_2 <= '0';
			end if;
			
			if serial_transfer_triggered = '1' then
				trigger_serial_transfer <= '0';
			end if;
		end if;
	end process getData;
	
	-- CS ____
	--        |______________________
	-- CLK       __    __    __
	--    ______|  |__|  |__|  |___
	-- DATA
	--        |XXXX|XXXXX|XXXXX|
	busy <= serial_busy;
	serialTransfer: process(rst, clk, trigger_serial_transfer, recieved_data) is
		variable count : integer range 0 to frequency_div;
		variable bitcount : integer range 0 to nr_of_bits;
	begin
		if rst = '1' then
			serial_transfer_triggered <= '0';
			rck <= '1';
			sck <= '0';
			count := 0;
			bitcount := 0;
			serial_busy <= '0';
		elsif rising_edge(clk) then
		
			case serial_state is
				when wait_for_trigger =>
					if trigger_serial_transfer = '1' then
						serial_transfer_triggered <= '1';
						serial_busy <= '1';
						shift_reg <= recieved_data;
						serial_state <= start_transfer;
					end if;
				when start_transfer =>
					rck <= '0';
					serial_state <= wait_delay;
					
				when wait_delay =>
			
					if count = frequency_div_half then
						sck <= '1';
					end if;
					
					if count = frequency_div then
						serial_state <= shift_data;
						count := 0;
						sck <= '0';
					else
						count := count +1;
					end if;
				when shift_data =>
					if bitcount = nr_of_bits-1 then
						serial_state <= finish_transfer;
						bitcount := 0;
					else
						serial_state <= wait_delay;
						shift_reg <= shift_reg( nr_of_bits-2 downto 0) & '0';
						bitcount := bitcount + 1;
					end if;
				
				when finish_transfer =>
					rck <= '1';
					serial_busy <= '0';
					serial_state <= wait_for_trigger;
				
			end case;
			
			ser <= shift_reg(nr_of_bits -1);
			
			if serial_transfer_triggered = '1' and trigger_serial_transfer = '0' then
				serial_transfer_triggered <= '0';
			end if;
		end if;
	end process serialTransfer;

end rtl;