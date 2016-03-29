--74595_tb.vhd


library ieee;
use ieee.std_logic_1164.all, ieee.numeric_std.all;


entity digital_output_tb is
	
end digital_output_tb;

architecture testbench of digital_output_tb is

component digital_output is
	generic( address : std_logic_vector( 7 downto 0) );
	
	port (
		clk : in std_logic;
		hs_clk : in std_logic;
		rst : in std_logic;
		datain : in std_logic_vector( 7 downto 0);
		addr : in std_logic_vector( 7 downto 0);
		wr : in std_logic;
		digiout : out std_logic_vector(7 downto 0));
end component digital_output;
signal clk, rst, wr, hs_clk : std_logic;
signal datain, addr, digiout : std_logic_vector( 7 downto 0);
signal testsignal : unsigned(7 downto 0) := (others => '0') ;
begin


dwg_1 : digital_output generic map( address => "00011000") 
			 port map (	hs_clk => hs_clk,
					clk => clk,
					rst => rst,
					datain => datain,
					addr => addr,
					wr  => wr,
					digiout => digiout); 
mclk : process is
 variable t1: time := 10 ns;
begin
	clk <= '0';
	wait for t1;
	clk <= '1';
	wait for t1;
end process mclk;

hmclk : process is
 variable t1: time := 5 ns;
begin
	hs_clk <= '0';
	wait for t1;
	hs_clk <= '1';
	wait for t1;
end process hmclk;


test : process is
 variable i : integer range 0 to 256;
begin

	--rst <= '1';
	--datain <= "00000000";
	--addr <= "00000000";
	wr <= '0';
	wait until rising_edge(clk);
	wait until rising_edge(clk);
	wait until rising_edge(clk);
	wait until rising_edge(clk);
	addr <= "00011000";
	datain <= "00000101"; --config
	wait until falling_edge(clk);
	wr <= '1';
	wait until falling_edge(clk);
	wr <= '0';
	wait until rising_edge(clk);
	wait until rising_edge(clk);
	wait until rising_edge(clk);
	wait until rising_edge(clk);
	datain <= "00001111"; --buffsize
	wait until falling_edge(clk);
	wr <= '1';
	wait until falling_edge(clk);
	wr <= '0';
	wait until rising_edge(clk);
	wait until rising_edge(clk);
	wait until rising_edge(clk);
	wait until rising_edge(clk);
	datain <= "00000000"; --samp_high
	wait until falling_edge(clk);
	wr <= '1';
	wait until falling_edge(clk);
	wr <= '0';
	wait until rising_edge(clk);
	wait until rising_edge(clk);
	wait until rising_edge(clk);
	wait until rising_edge(clk);
	datain <= "00000011"; --samp_low
	wait until falling_edge(clk);
	wr <= '1';
	wait until falling_edge(clk);
	wr <= '0';
	testsignal <= "00000000";
	i := 0;
	while (i <= 15) loop
		wait until falling_edge(clk);
		wait until rising_edge(clk);
		wait until rising_edge(clk);
		wait until rising_edge(clk);
		testsignal <= testsignal + 1;
		datain <= std_logic_vector(testsignal);
		wait until falling_edge(clk);
		wr <= '1';
		wait until falling_edge(clk);
		wr <= '0';
		i := i+1;
	end loop;
	
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