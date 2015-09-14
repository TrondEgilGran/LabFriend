library ieee;
use ieee.std_logic_1164.all, ieee.numeric_std.all;

entity i2s_tb is
	generic( 
	         address : std_ulogic_vector( 7 downto 0) := "00000011");
	
end i2s_tb;


architecture testbench of i2s_tb is

component i2s is
	generic( 
	         address : std_ulogic_vector( 7 downto 0) := "00000011");
	
	port (
		clk : in std_ulogic;
		rst : in std_ulogic;
		datain : in std_ulogic_vector( 7 downto 0);
		dataout : out std_ulogic_vector( 7 downto 0);
		addr : in std_ulogic_vector( 7 downto 0);
		wr : in std_ulogic;
		rd : in std_ulogic;
		busy : out std_ulogic;
		sclk : out std_ulogic;
		i2sdout :  out std_ulogic;
		i2sdin : in std_ulogic;
		bck :  out std_ulogic;
		lrck : out std_ulogic;
		conf0 : out std_ulogic;
		conf1 : out std_ulogic);
end component i2s;

signal	clk :  std_ulogic;
signal	rst :  std_ulogic;
signal	datain :  std_ulogic_vector( 7 downto 0);
signal	dataout :  std_ulogic_vector( 7 downto 0);
signal	addr :  std_ulogic_vector( 7 downto 0);
signal	wr,rd :  std_ulogic;
signal	busy :  std_ulogic;
signal	sclk :  std_ulogic;
signal	i2sdout :   std_ulogic;
signal	i2sdin :  std_ulogic;
signal	bck :   std_ulogic;
signal	lrck :  std_ulogic;
signal	conf0 : std_ulogic;
signal	conf1 : std_ulogic;

begin

i2s1: i2s port map ( 	clk  	=>    clk, 
			rst     =>    rst,    
			datain  =>    datain, 
			dataout =>    dataout,
			addr    =>    addr,   
			wr      =>    wr, 
			rd	=>    rd,
			busy    =>    busy,   
			sclk    =>    sclk,     
			i2sdout =>    i2sdout,
			i2sdin  =>    i2sdin, 
			bck     =>    bck,    
			lrck    =>    lrck,
			conf0	=>    conf0,
			conf1	=>    conf1);
mclk : process is
 variable t1: time := 0.1 ns;
begin
	clk <= '0';
	wait for t1;
	clk <= '1';
	wait for t1;
end process mclk;

  -- Reset
WaveGen_Proc: process
  begin
    -- insert signal assignments here
    rst <= '1';
    wait for 0.4 ns;
    rst <= '0';
    wait for 800000 ns;
    rst  <= '1';
    
    --wait until Clk = '1';
end process WaveGen_Proc;

sdin: process is

begin

i2sdin <= '0';
wait until rising_edge(bck);
i2sdin<= '1';
wait until rising_edge(bck);
i2sdin<= '1';
wait until rising_edge(bck);
i2sdin<= '0';
wait until rising_edge(bck);
i2sdin<= '0';
wait until rising_edge(bck);
i2sdin<= '1';
wait until rising_edge(bck);
i2sdin<= '1';
wait until rising_edge(bck);



end process sdin;

test : process is
	variable i : integer range 0 to 512;
	variable data_cnt : unsigned(23 downto 0);

begin
	data_cnt := (others => '0');
	i := 0;
	rd <= '0';
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
	wr <= '0';
	wait until rising_edge(clk);
	wait until rising_edge(clk);
	wait until rising_edge(clk);
	wait until rising_edge(clk);
	addr <= "00000011";
	datain <= "00110010";
	wait until falling_edge(clk);
	wr <= '1';
	wait until rising_edge(clk);
	wr <= '0';
	wait until rising_edge(clk);
	wait until rising_edge(clk);
	wait until rising_edge(clk);
	
	while (i <= 100) loop
	
		addr <= "00010011";
		datain <= std_ulogic_vector(data_cnt(23 downto 16));
		wait until falling_edge(clk);
		wr <= '1';
		wait until rising_edge(clk);
		wr <= '0';
		wait until rising_edge(clk);
		wait until rising_edge(clk);
		wait until rising_edge(clk);
		
		datain <= std_ulogic_vector(data_cnt(15 downto 8));
		wait until falling_edge(clk);
		wr <= '1';
		wait until rising_edge(clk);
		wr <= '0';
		wait until rising_edge(clk);
		wait until rising_edge(clk);
		wait until rising_edge(clk);
		
		datain <= std_ulogic_vector(data_cnt(7 downto 0));
		wait until falling_edge(clk);
		wr <= '1';
		wait until rising_edge(clk);
		wr <= '0';
		wait until rising_edge(clk);
		wait until rising_edge(clk);
		wait until rising_edge(clk);
		
		data_cnt := data_cnt +1;
		
		datain <= std_ulogic_vector(data_cnt(23 downto 16));
		wait until falling_edge(clk);
		wr <= '1';
		wait until rising_edge(clk);
		wr <= '0';
		wait until rising_edge(clk);
		wait until rising_edge(clk);
		wait until rising_edge(clk);
		
		datain <= std_ulogic_vector(data_cnt(15 downto 8));
		wait until falling_edge(clk);
		wr <= '1';
		wait until rising_edge(clk);
		wr <= '0';
		wait until rising_edge(clk);
		wait until rising_edge(clk);
		wait until rising_edge(clk);
		
		datain <= std_ulogic_vector(data_cnt(7 downto 0));
		wait until falling_edge(clk);
		wr <= '1';
		wait until rising_edge(clk);
		wr <= '0';
		wait until rising_edge(clk);
		wait until rising_edge(clk);
		wait until rising_edge(clk);
		
		data_cnt := data_cnt +1;
		i := i +1;
	end loop;
	
	wait until rising_edge(lrck);
	wait until rising_edge(lrck);
	wait until rising_edge(lrck);
	wait until rising_edge(lrck);
	wait until rising_edge(lrck);
	wait until rising_edge(lrck);
	wait until rising_edge(lrck);
	wait until rising_edge(lrck);
	wait until rising_edge(lrck);
	wait until rising_edge(lrck);
	wait until rising_edge(lrck);
	wait until rising_edge(lrck);
	wait until rising_edge(lrck);
	
	i := 0;
	while (i <= 10) loop
	
		addr <= "00001011";
		wait until falling_edge(clk);
		rd <= '1';
		wait until rising_edge(clk);
		rd <= '0';
		wait until rising_edge(clk);
		wait until rising_edge(clk);
		wait until rising_edge(clk);
		
		wait until falling_edge(clk);
		rd <= '1';
		wait until rising_edge(clk);
		rd <= '0';
		wait until rising_edge(clk);
		wait until rising_edge(clk);
		wait until rising_edge(clk);
		
		
		wait until falling_edge(clk);
		rd <= '1';
		wait until rising_edge(clk);
		rd <= '0';
		wait until rising_edge(clk);
		wait until rising_edge(clk);
		wait until rising_edge(clk);
		
		data_cnt := data_cnt +1;
	
		wait until falling_edge(clk);
		rd <= '1';
		wait until rising_edge(clk);
		rd <= '0';
		wait until rising_edge(clk);
		wait until rising_edge(clk);
		wait until rising_edge(clk);
		
		wait until falling_edge(clk);
		rd <= '1';
		wait until rising_edge(clk);
		rd <= '0';
		wait until rising_edge(clk);
		wait until rising_edge(clk);
		wait until rising_edge(clk);
		
		wait until falling_edge(clk);
		rd <= '1';
		wait until rising_edge(clk);
		rd <= '0';
		wait until rising_edge(clk);
		wait until rising_edge(clk);
		wait until rising_edge(clk);
		
		data_cnt := data_cnt +1;
		i := i + 1;
	end loop;
	
	
	wait until rst = '1';

end process test;




end architecture testbench;