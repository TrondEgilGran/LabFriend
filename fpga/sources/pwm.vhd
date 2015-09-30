-- Multichannel PWM Controller
-- Module Name: pwm
-- File Name: pwm.vhd
-- Author: Trond Egil Gran
-- Date: 20/09 2013
-- Operation:  Input three bytes + Adress

library ieee;
use ieee.std_logic_1164.all, ieee.numeric_std.all;


entity pwm is
	generic( nr_of_bits : natural := 16 ;
	         address : std_logic_vector( 7 downto 0) := "00000000");
	
	port (
		clk : in std_logic;
		datain : in std_logic_vector( 7 downto 0);
		addr : in std_logic_vector( 7 downto 0);
		wr : in std_logic;
		pwmlavio : out std_logic;
		pwmla :  out std_logic;
		pwmexvo : out std_logic;
		pwmoffs0 : out std_logic;
		pwmoffs1 : out std_logic;
		ladvref : out std_logic
		);
end pwm;

architecture rtl of pwm is

type datamachine is (channel_select, first_byte, second_byte);
signal data_state : datamachine := channel_select; 

type type_channel_select is ( channel_lavio, channel_la, channel_exvo, channel_offs0, channel_offs1, channel_ladvref);
signal channel : type_channel_select := channel_lavio;

signal lavio_level, la_level, exvo_level, offs0_level, offs1_level, ladvref_level : std_logic_vector( nr_of_bits-1 downto 0);
signal counter_pwm : unsigned(nr_of_bits-1 downto 0) := (others => '0');


begin

	getData: process (clk, datain, addr) is
	
	begin
		if rising_edge(clk) then
			if wr = '1' and addr = address then
				case data_state is
					when channel_select =>
					
						case datain is
							when "00000000" =>
								channel <= channel_lavio;
							when "00000001" =>
								channel <= channel_la;
							when "00000010" =>
								channel <= channel_exvo;
							when "00000011" =>
								channel <= channel_offs0;
							when "00000100" =>
								channel <= channel_offs1;
							when "00000101" =>
								channel <= channel_ladvref;
							when others =>
								channel <= channel_lavio;
						end case;
						
						data_state <= first_byte;
						
					when first_byte =>
					
						case channel is
							when channel_lavio =>
								lavio_level( nr_of_bits-1 downto 8 ) <= datain;
							when channel_la =>
								la_level( nr_of_bits-1 downto 8 ) <= datain;
							when channel_exvo =>
								exvo_level( nr_of_bits-1 downto 8 ) <= datain;
							when channel_offs0 =>
								offs0_level( nr_of_bits-1 downto 8 ) <= datain;
							when channel_offs1 =>
								offs1_level( nr_of_bits-1 downto 8 ) <= datain;
							when channel_ladvref =>
								ladvref_level( nr_of_bits-1 downto 8 ) <= datain;
						end case;
						
						data_state <= second_byte;
						
					when second_byte =>
					
						case channel is
							when channel_lavio =>
								lavio_level( 7 downto 0 ) <= datain;
							when channel_la =>
								la_level( 7 downto 0 ) <= datain;
							when channel_exvo =>
								exvo_level( 7 downto 0 ) <= datain;
							when channel_offs0 =>
								offs0_level( 7 downto 0 ) <= datain;
							when channel_offs1 =>
								offs1_level( 7 downto 0 ) <= datain;
							when channel_ladvref =>
								ladvref_level( 7 downto 0 ) <= datain;
						end case;
						
						data_state <= channel_select;
				end case;

			end if;
			
		end if;
	end process getData;
	
	pwmCounter: process ( clk ) is
	begin
		if rising_edge(clk) then
			counter_pwm <= counter_pwm + 1;
		end if;
	end process pwmCounter; 
	
	pwmComparator: process( clk ) is
	begin
		if rising_edge(clk) then
			if counter_pwm = 0 then
				pwmlavio <= '0';
				pwmexvo <= '0';
				pwmla <= '0';
				pwmoffs0 <= '0';
				pwmoffs1 <= '0';
				ladvref <= '0';
			end if;
			
			if counter_pwm = unsigned( lavio_level ) then
				pwmlavio <= '1';
			end if;
			
			if counter_pwm = unsigned( la_level ) then
				pwmla <= '1';
			end if;
			
			if counter_pwm = unsigned( offs0_level ) then
				pwmoffs0 <= '1';
			end if;
			
			if counter_pwm = unsigned( offs1_level ) then
				pwmoffs1<= '1';
			end if;
			
			if counter_pwm = unsigned( ladvref_level ) then
				ladvref <= '1';
			end if;
			
			if counter_pwm = unsigned( exvo_level ) then
				pwmexvo <= '1';
			end if;
			
		end if;
	end process pwmComparator;
	
	
end rtl;