


library ieee;
use ieee.std_logic_1164.all, ieee.numeric_std.all;


entity pwm_tb is
	generic( nr_of_bits : natural := 16 ;
	         address : std_logic_vector( 7 downto 0) := "00000000");
end pwm_tb;

architecture testbench of pwm_tb is

component pwm is
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
end component pwm;
signal clk, wr, rst, pwmlavio, pwmla, pwmexvo, pwmoffs0, pwmoffs1, ladvref : std_logic;
signal datain, addr : std_logic_vector( 7 downto 0);
begin
-- 1 3 4 // 0 2 5 6 7

pwm_1 : pwm port map (	clk => clk,
				datain => datain,
				addr => addr,
				wr  => wr,
				pwmlavio => pwmlavio,
				pwmla   => pwmla,
				pwmexvo => pwmexvo,
				pwmoffs0 => pwmoffs0,
				pwmoffs1 => pwmoffs1,
				ladvref => ladvref
				); 
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
	addr <= "00000000";
	datain <= "00000000";
	wait until falling_edge(clk);
	wr <= '1';
	wait until falling_edge(clk);
	wr <= '0';
	----------------------------------
	wait until rising_edge(clk);
	wait until rising_edge(clk);
	wait until rising_edge(clk);
	wait until rising_edge(clk);
	datain <= "00000000";
	wait until falling_edge(clk);
	wr <= '1';
	wait until falling_edge(clk);
	wr <= '0';
	------------------------------------
	wait until rising_edge(clk);
	wait until rising_edge(clk);
	wait until rising_edge(clk);
	wait until rising_edge(clk);
	datain <= "00100000";
	wait until falling_edge(clk);
	wr <= '1';
	wait until falling_edge(clk);
	wr <= '0';
	-----------------------------------
	---ch2
	wait until rising_edge(clk);
	wait until rising_edge(clk);
	wait until rising_edge(clk);
	wait until rising_edge(clk);
	addr <= "00000000";
	datain <= "00000001";
	wait until falling_edge(clk);
	wr <= '1';
	wait until falling_edge(clk);
	wr <= '0';
	----------------------------------
	wait until rising_edge(clk);
	wait until rising_edge(clk);
	wait until rising_edge(clk);
	wait until rising_edge(clk);
	datain <= "00000000";
	wait until falling_edge(clk);
	wr <= '1';
	wait until falling_edge(clk);
	wr <= '0';
	------------------------------------
	wait until rising_edge(clk);
	wait until rising_edge(clk);
	wait until rising_edge(clk);
	wait until rising_edge(clk);
	datain <= "00100110";
	wait until falling_edge(clk);
	wr <= '1';
	wait until falling_edge(clk);
	wr <= '0';
	-----------------------------------
	--ch 3
	wait until rising_edge(clk);
	wait until rising_edge(clk);
	wait until rising_edge(clk);
	wait until rising_edge(clk);
	addr <= "00000000";
	datain <= "00000010";
	wait until falling_edge(clk);
	wr <= '1';
	wait until falling_edge(clk);
	wr <= '0';
	----------------------------------
	wait until rising_edge(clk);
	wait until rising_edge(clk);
	wait until rising_edge(clk);
	wait until rising_edge(clk);
	datain <= "00000001";
	wait until falling_edge(clk);
	wr <= '1';
	wait until falling_edge(clk);
	wr <= '0';
	------------------------------------
	wait until rising_edge(clk);
	wait until rising_edge(clk);
	wait until rising_edge(clk);
	wait until rising_edge(clk);
	datain <= "00100000";
	wait until falling_edge(clk);
	wr <= '1';
	wait until falling_edge(clk);
	wr <= '0';
	-----------------------------------
	--ch4
	wait until rising_edge(clk);
	wait until rising_edge(clk);
	wait until rising_edge(clk);
	wait until rising_edge(clk);
	addr <= "00000000";
	datain <= "00000011";
	wait until falling_edge(clk);
	wr <= '1';
	wait until falling_edge(clk);
	wr <= '0';
	----------------------------------
	wait until rising_edge(clk);
	wait until rising_edge(clk);
	wait until rising_edge(clk);
	wait until rising_edge(clk);
	datain <= "00100000";
	wait until falling_edge(clk);
	wr <= '1';
	wait until falling_edge(clk);
	wr <= '0';
	------------------------------------
	wait until rising_edge(clk);
	wait until rising_edge(clk);
	wait until rising_edge(clk);
	wait until rising_edge(clk);
	datain <= "00100000";
	wait until falling_edge(clk);
	wr <= '1';
	wait until falling_edge(clk);
	wr <= '0';
	-----------------------------------
	--ch5
	wait until rising_edge(clk);
	wait until rising_edge(clk);
	wait until rising_edge(clk);
	wait until rising_edge(clk);
	addr <= "00000000";
	datain <= "00000100";
	wait until falling_edge(clk);
	wr <= '1';
	wait until falling_edge(clk);
	wr <= '0';
	----------------------------------
	wait until rising_edge(clk);
	wait until rising_edge(clk);
	wait until rising_edge(clk);
	wait until rising_edge(clk);
	datain <= "00001000";
	wait until falling_edge(clk);
	wr <= '1';
	wait until falling_edge(clk);
	wr <= '0';
	------------------------------------
	wait until rising_edge(clk);
	wait until rising_edge(clk);
	wait until rising_edge(clk);
	wait until rising_edge(clk);
	datain <= "00100000";
	wait until falling_edge(clk);
	wr <= '1';
	wait until falling_edge(clk);
	wr <= '0';
	-----------------------------------
	--ch6
	wait until rising_edge(clk);
	wait until rising_edge(clk);
	wait until rising_edge(clk);
	wait until rising_edge(clk);
	addr <= "00000000";
	datain <= "00000101";
	wait until falling_edge(clk);
	wr <= '1';
	wait until falling_edge(clk);
	wr <= '0';
	----------------------------------
	wait until rising_edge(clk);
	wait until rising_edge(clk);
	wait until rising_edge(clk);
	wait until rising_edge(clk);
	datain <= "11110000";
	wait until falling_edge(clk);
	wr <= '1';
	wait until falling_edge(clk);
	wr <= '0';
	------------------------------------
	wait until rising_edge(clk);
	wait until rising_edge(clk);
	wait until rising_edge(clk);
	wait until rising_edge(clk);
	datain <= "00100000";
	wait until falling_edge(clk);
	wr <= '1';
	wait until falling_edge(clk);
	wr <= '0';
	-----------------------------------
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