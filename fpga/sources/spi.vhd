-- 74595 Communicator
-- Module Name: 74595
-- File Name: 74595.vhd
-- Author: Trond Egil Gran
-- Date: 20/09 2013
-- Operation:  Input two bytes + Adress

library ieee;
use ieee.std_logic_1164.all, ieee.numeric_std.all;


entity spi is
	generic( nr_of_bits : natural := 16 ;
	         frequency_div : natural := 20;
	         frequency_div_half : natural := 10;
	         address : std_logic_vector( 7 downto 0) := "00000010");
	
	port (
		clk : in std_logic;
		rst : in std_logic;
		datain : in std_logic_vector( 7 downto 0);
		dataout : out std_logic_vector(7 downto 0);
		addr : in std_logic_vector( 7 downto 0);
		wr : in std_logic;
		rd : in std_logic;
		busy : out std_logic;
		cs1 : out std_logic;
		cs2 : out std_logic;
		sdo : out std_logic;
		sdi : in std_logic;
		sck : out std_logic);
end spi;

architecture rtl of spi is
	--constant
	--
	--type machine is (idle, 
type datamachine is (transfertype, first_byte, second_byte);
type serialmachine is ( wait_for_trigger, start_transfer, wait_delay, first_edge, second_edge, shift_data, finish_transfer );
signal data_state, read_data_state : datamachine := transfertype;
signal serial_state, serial_state_next : serialmachine;
signal trigger_serial_transfer, serial_transfer_triggered : std_logic := '0';

signal transmitt_data, shift_reg, recieved_data, shift_in_reg : std_logic_vector( nr_of_bits-1 downto 0 );
signal serial_busy : std_logic;
signal recieve_mode, shift_pol, clock_pol :  std_logic := '0';
signal channel1en, channel2en, cs : std_logic := '0';

begin

	getData: process (rst, clk, datain, addr) is
	
	begin
		if rst = '1' then
			data_state <= transfertype;
			read_data_state <= transfertype;
			transmitt_data <= (others => '0');
			trigger_serial_transfer <= '0';
			recieve_mode <= '0';
			shift_pol <= '0';
			channel1en <= '1';
			channel2en <= '1';
			clock_pol <= '1';
		elsif rising_edge(clk) then
			if wr = '1' and addr = address then
				case data_state is
					when transfertype => 
						clock_pol <= datain(0);
						channel1en <= not datain(1);
						channel2en <= not datain(2);
						shift_pol <= datain(3);
						data_state <= first_byte;
					when first_byte =>
						transmitt_data( nr_of_bits-1 downto nr_of_bits-8 ) <= datain;
						data_state <= second_byte;
					when second_byte =>
						transmitt_data( nr_of_bits/2 -1 downto 0) <= datain;
						data_state <= transfertype;
						trigger_serial_transfer <= '1';
				end case;
			end if;
			
			if rd = '1' and addr(2 downto 0) = address(2 downto 0) then
				case read_data_state is
					when transfertype =>
						dataout(0) <= clock_pol;
						dataout(1) <= channel1en;
						dataout(2) <= channel2en;
						dataout(3) <= shift_pol;
						dataout(4) <= serial_busy;
						dataout(7 downto 5) <= (others => '1');
						read_data_state <= first_byte;
					when first_byte =>
						dataout <= recieved_data( nr_of_bits-1 downto nr_of_bits-8 );
						read_data_state <= second_byte;
					when second_byte =>
						dataout <= recieved_data( nr_of_bits/2 -1 downto 0);
						read_data_state <= transfertype;
					
				end case;
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
	cs1 <= cs or channel1en;
	cs2 <= cs or channel2en;
	serialTransfer: process(rst, clk, trigger_serial_transfer, transmitt_data) is
		variable count : integer range 0 to frequency_div;
		variable bitcount : integer range 0 to nr_of_bits;
	begin
		if rst = '1' then
			serial_transfer_triggered <= '0';
			cs <= '1';
			sck <= '0';
			count := 0;
			bitcount := 0;
			serial_busy <= '0';
		elsif rising_edge(clk) then
		
			case serial_state is
				when wait_for_trigger =>
					cs <= '1';
					if trigger_serial_transfer = '1' then
						serial_transfer_triggered <= '1';
						serial_busy <= '1';
						shift_reg <= transmitt_data;
						serial_state <= start_transfer;
						sck <= not clock_pol;
					end if;
				when start_transfer =>
					cs <= '0';
					serial_state <= wait_delay;
					serial_state_next <= first_edge; 
				when wait_delay =>	
					if count = frequency_div_half then
						serial_state <= serial_state_next;
						count := 0;
					else
						count := count +1;
					end if;
				when first_edge =>
					sck <= clock_pol;
					if shift_pol = '1' then
						serial_state <= shift_data;
					else
						serial_state <= wait_delay;
						serial_state_next <= second_edge;
					end if;
				when second_edge =>
					sck <= not clock_pol;
					if shift_pol = '1' then
						serial_state <= wait_delay;
						serial_state_next <= first_edge;
					else
						serial_state <= shift_data;
					end if;
				when shift_data =>
					if bitcount = nr_of_bits-1 then
						serial_state <= wait_delay;
						serial_state_next <= finish_transfer;
						bitcount := 0;
						
					else
						serial_state <= wait_delay;
						if shift_pol = '1' then
							serial_state_next <= second_edge;
						else
							serial_state_next <= first_edge;
						end if;
						shift_reg <= shift_reg( nr_of_bits-2 downto 0) & '0';
						bitcount := bitcount + 1;
					end if;
					shift_in_reg <= shift_in_reg(nr_of_bits-2 downto 0) & sdi;
				when finish_transfer =>
					serial_busy <= '0';
					serial_state_next <= wait_for_trigger;
					serial_state <= wait_delay;
					recieved_data <= shift_in_reg;
					sck <= not clock_pol;
				
			end case;
			
			sdo <= shift_reg(nr_of_bits -1);
			
			if serial_transfer_triggered = '1' and trigger_serial_transfer = '0' then
				serial_transfer_triggered <= '0';
			end if;
		end if;
	end process serialTransfer;

end rtl;