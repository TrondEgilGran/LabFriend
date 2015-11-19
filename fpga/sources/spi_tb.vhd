--74595_tb.vhd


library ieee;
use ieee.std_logic_1164.all, ieee.numeric_std.all;


entity spi_tb is
	generic( nr_of_bits : natural := 16 ;
	         frequency_div : natural := 20;
	         frequency_div_half : natural := 10;
	         address : std_logic_vector( 7 downto 0) := "00000010");
end spi_tb;

architecture testbench of spi_tb is

component spi is
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
end component spi;
signal clk, rst, wr, busy, sdi, sdo, sck, cs1, cs2, rd : std_logic;
signal datain, addr, dataout : std_logic_vector( 7 downto 0);
begin


spi_1 : spi port map (	clk => clk,
				rst => rst,
				datain => datain,
				dataout => dataout,
				addr => addr,
				wr  => wr,
				rd  => rd,
				busy => busy,
				cs1 => cs1,
				cs2 => cs2,
				sdo => sdo, 
				sdi => sdi,
				sck => sck); 
mclk : process is
 variable t1: time := 20 ns;
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
	rd <= '0';
	wr <= '0';
	wait until rising_edge(clk);
	wait until rising_edge(clk);
	wait until rising_edge(clk);
	wait until rising_edge(clk);
	addr <= "00000010";
	datain <= "00000011";  --Config
	wait until falling_edge(clk);
	wr <= '1';
	wait until falling_edge(clk);
	wr <= '0';
	wait until rising_edge(clk);
	wait until rising_edge(clk);
	wait until rising_edge(clk);
	wait until rising_edge(clk);
	datain <= "10101010";	--data high
	wait until falling_edge(clk);
	wr <= '1';
	wait until falling_edge(clk);
	wr <= '0';
	wait until rising_edge(clk);
	wait until rising_edge(clk);
	wait until rising_edge(clk);
	wait until rising_edge(clk);
	datain <= "11110000";  --data low
	wait until falling_edge(clk);
	wr <= '1';
	wait until falling_edge(clk);
	wr <= '0';
	wait until rising_edge(clk);
	wait until rising_edge(clk);
	wait until rising_edge(clk);
	wait until rising_edge(clk);
	
	--new test
	wait until cs1 = '1';
	
	wait until rising_edge(clk);
	wait until rising_edge(clk);
	wait until rising_edge(clk);
	wait until rising_edge(clk);
	
	wait until rising_edge(clk);
	wait until rising_edge(clk);
	wait until rising_edge(clk);
	wait until rising_edge(clk);
	addr <= "00000010";
	datain <= "00000101";  --Config
	wait until falling_edge(clk);
	wr <= '1';
	wait until falling_edge(clk);
	wr <= '0';
	wait until rising_edge(clk);
	wait until rising_edge(clk);
	wait until rising_edge(clk);
	wait until rising_edge(clk);
	datain <= "10101010";	--data high
	wait until falling_edge(clk);
	wr <= '1';
	wait until falling_edge(clk);
	wr <= '0';
	wait until rising_edge(clk);
	wait until rising_edge(clk);
	wait until rising_edge(clk);
	wait until rising_edge(clk);
	datain <= "11110000";  --data low
	wait until falling_edge(clk);
	wr <= '1';
	wait until falling_edge(clk);
	wr <= '0';
	
	
	wait until rising_edge(sck);
	sdi <= '1';
	wait until rising_edge(sck);
	sdi <= '0';
	wait until rising_edge(sck);
	sdi <= '1';
	wait until rising_edge(sck);
	sdi <= '0';
	wait until rising_edge(sck);
	sdi <= '1';
	wait until rising_edge(sck);
	sdi <= '1';
	wait until rising_edge(sck);
	sdi <= '0';
	wait until rising_edge(sck);
	sdi <= '0';
	wait until rising_edge(sck);
	sdi <= '0';
	wait until rising_edge(sck);
	sdi <= '1';
	wait until rising_edge(sck);
	sdi <= '0';
	wait until rising_edge(sck);
	sdi <= '1';
	wait until rising_edge(sck);
	sdi <= '0';
	wait until rising_edge(sck);
	sdi <= '0';
	wait until rising_edge(sck);
	sdi <= '1';
	wait until rising_edge(sck);
	sdi <= '1';
	
	wait until rising_edge(clk);
	wait until rising_edge(clk);
	wait until rising_edge(clk);
	wait until rising_edge(clk);
	
	wait until rising_edge(cs2);
	wait until rising_edge(clk);
	wait until rising_edge(clk);
	wait until rising_edge(clk);
	wait until rising_edge(clk);
	
	rd <= '1';
	wait until rising_edge(clk);
	rd <= '0';
	wait until rising_edge(clk);
	wait until rising_edge(clk);
	wait until rising_edge(clk);
	rd <= '1';
	wait until rising_edge(clk);
	rd <= '0';
	wait until rising_edge(clk);
	wait until rising_edge(clk);
	wait until rising_edge(clk);
	rd <= '1';
	wait until rising_edge(clk);
	rd <= '0';
	
	
	--new test

	wait until rising_edge(clk);
	wait until rising_edge(clk);
	wait until rising_edge(clk);
	wait until rising_edge(clk);
	wait until rising_edge(clk);
	wait until rising_edge(clk);
	wait until rising_edge(clk);
	wait until rising_edge(clk);
	
	wait until rising_edge(clk);
	wait until rising_edge(clk);
	wait until rising_edge(clk);
	wait until rising_edge(clk);
	
	wait until rising_edge(clk);
	wait until rising_edge(clk);
	wait until rising_edge(clk);
	wait until rising_edge(clk);
	addr <= "00000010";
	datain <= "00001101";  --Config
	wait until falling_edge(clk);
	wr <= '1';
	wait until falling_edge(clk);
	wr <= '0';
	wait until rising_edge(clk);
	wait until rising_edge(clk);
	wait until rising_edge(clk);
	wait until rising_edge(clk);
	datain <= "10101010";	--data high
	wait until falling_edge(clk);
	wr <= '1';
	wait until falling_edge(clk);
	wr <= '0';
	wait until rising_edge(clk);
	wait until rising_edge(clk);
	wait until rising_edge(clk);
	wait until rising_edge(clk);
	datain <= "11110000";  --data low
	wait until falling_edge(clk);
	wr <= '1';
	wait until falling_edge(clk);
	wr <= '0';
	
	
	wait until falling_edge(sck);
	sdi <= '1';
	wait until falling_edge(sck);
	sdi <= '0';
	wait until falling_edge(sck);
	sdi <= '1';
	wait until falling_edge(sck);
	sdi <= '0';
	wait until falling_edge(sck);
	sdi <= '1';
	wait until falling_edge(sck);
	sdi <= '1';
	wait until falling_edge(sck);
	sdi <= '0';
	wait until falling_edge(sck);
	sdi <= '0';
	wait until falling_edge(sck);
	sdi <= '0';
	wait until falling_edge(sck);
	sdi <= '1';
	wait until falling_edge(sck);
	sdi <= '0';
	wait until falling_edge(sck);
	sdi <= '1';
	wait until falling_edge(sck);
	sdi <= '0';
	wait until falling_edge(sck);
	sdi <= '0';
	wait until falling_edge(sck);
	sdi <= '1';
	wait until falling_edge(sck);
	sdi <= '1';
	
	wait until rising_edge(clk);
	wait until rising_edge(clk);
	wait until rising_edge(clk);
	wait until rising_edge(clk);
	
	wait until rising_edge(cs2);
	wait until rising_edge(clk);
	wait until rising_edge(clk);
	wait until rising_edge(clk);
	wait until rising_edge(clk);
	
	rd <= '1';
	wait until rising_edge(clk);
	rd <= '0';
	wait until rising_edge(clk);
	wait until rising_edge(clk);
	wait until rising_edge(clk);
	rd <= '1';
	wait until rising_edge(clk);
	rd <= '0';
	wait until rising_edge(clk);
	wait until rising_edge(clk);
	wait until rising_edge(clk);
	rd <= '1';
	wait until rising_edge(clk);
	rd <= '0';
	
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