--74595_tb.vhd


library ieee;
use ieee.std_logic_1164.all, ieee.numeric_std.all;


entity s74595_tb is
	generic( nr_of_bits : natural := 16 ;
	         frequency_div : natural := 5000;
	         frequency_div_half : natural := 2500;
	         address : std_ulogic_vector( 7 downto 0) := "00000100");
end s74595_tb;

architecture testbench of s74595_tb is

component s74595 is
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
end component s74595;
signal clk, rst, wr, busy, ser, rck, sck : std_ulogic;
signal datain, addr : std_ulogic_vector( 7 downto 0);
begin


s74595_1 : s74595 port map (	clk => clk,
				rst => rst,
				datain => datain,
				addr => addr,
				wr  => wr,
				busy => busy,
				ser => ser,
				rck => rck, 
				sck => sck); 
mclk : process is
 variable t1: time := 0.1 ns;
begin
	clk <= '0';
	wait for t1;
	clk <= '1';
	wait for t1;
end process mclk;


test : process is

begin

	--rst <= '1';
	--datain <= "00000000";
	--addr <= "00000000";
	wr <= '0';
	wait until rising_edge(clk);
	wait until rising_edge(clk);
	wait until rising_edge(clk);
	wait until rising_edge(clk);
	addr <= "00000100";
	datain <= "11110000";
	wait until falling_edge(clk);
	wr <= '1';
	wait until falling_edge(clk);
	wr <= '0';
	wait until rising_edge(clk);
	wait until rising_edge(clk);
	wait until rising_edge(clk);
	wait until rising_edge(clk);
	datain <= "10101010";
	wait until falling_edge(clk);
	wr <= '1';
	wait until falling_edge(clk);
	wr <= '0';
	wait until rst = '1';
end process test;

  -- waveform generation
WaveGen_Proc: process
  begin
    -- insert signal assignments here
    rst <= '1';
    wait for 0.4 ns;
    rst <= '0';
    wait for 80000 ns;
    rst  <= '1';
    
    --wait until Clk = '1';
end process WaveGen_Proc;


end architecture testbench;