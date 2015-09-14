--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   22:28:20 10/05/2013
-- Design Name:   
-- Module Name:   /home/teg/Server/TEG/Projects/SuperScopePro/FPGACODE/oscopeSram/HSaqusition_tb.vhd
-- Project Name:  oscopeSram
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: HSaqusition
-- 
-- Dependencies:
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
--
-- Notes: 
-- This testbench has been automatically generated using types std_ulogic and
-- std_ulogic_vector for the ports of the unit under test.  Xilinx recommends
-- that these types always be used for the top-level I/O of a design in order
-- to guarantee that the testbench will bind correctly to the post-implementation 
-- simulation model.
--------------------------------------------------------------------------------
--library ieee;
--use ieee.std_logic_1164.all, ieee.std_logic_arith.all;


library ieee;
use ieee.std_logic_1164.all, ieee.numeric_std.all;
 
ENTITY HSaqusition_tb IS
END HSaqusition_tb;
 
ARCHITECTURE behavior OF HSaqusition_tb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT HSaqusition
    PORT(
         clk : IN  std_ulogic;
         rst : IN  std_ulogic;
         datain : IN  std_ulogic_vector(7 downto 0);
         addr : IN  std_ulogic_vector(7 downto 0);
         wr : IN  std_ulogic;
         rd : IN  std_ulogic;
         dataout : OUT  std_ulogic_vector(7 downto 0);
         sram_addr : OUT  std_ulogic_vector(18 downto 0);
         sram_data : INOUT  std_ulogic_vector(17 downto 0);
         sram_wr : OUT  std_ulogic;
         sram_ce : OUT  std_ulogic;
         sram_oe : OUT  std_ulogic;
         digital_in : IN  std_ulogic_vector(7 downto 0);
         hs_adc_a : IN  std_ulogic_vector(7 downto 0);
         hs_adc_b : IN  std_ulogic_vector(7 downto 0);
         adc_clk_a : OUT  std_ulogic;
         adc_clk_b : OUT  std_ulogic;
         adc_pwd_d : OUT  std_ulogic;
         hs_clock : IN  std_ulogic
        );
    END COMPONENT;
    

   --Inputs
   signal clk : std_ulogic := '0';
   signal rst : std_ulogic := '0';
   signal datain : std_ulogic_vector(7 downto 0) := (others => '0');
   signal addr : std_ulogic_vector(7 downto 0) := (others => '0');
   signal wr : std_ulogic := '0';
   signal rd : std_ulogic := '0';
   signal digital_in : std_ulogic_vector(7 downto 0) := (others => '0');
   signal hs_adc_a : std_ulogic_vector(7 downto 0) := (others => '0');
   signal hs_adc_b : std_ulogic_vector(7 downto 0) := (others => '0');
   signal hs_clock : std_ulogic := '0';

	--BiDirs
   signal sram_data : std_ulogic_vector(17 downto 0);


 	--Outputs
   signal dataout : std_ulogic_vector(7 downto 0);
   signal sram_addr : std_ulogic_vector(18 downto 0);
   signal sram_wr : std_ulogic;
   signal sram_ce : std_ulogic;
   signal sram_oe : std_ulogic;
   signal adc_clk_a : std_ulogic;
   signal adc_clk_b : std_ulogic;
   signal adc_pwd_d : std_ulogic;


   -- Clock period definitions
   constant clk_period : time := 2 ps;
   constant hs_clock_period : time := 2 ps;
   
   --type ram_array is array ( 0 to 524287 ) of std_ulogic_vector( 17 downto 0 );
   --signal sram : ram_array;
   --signal ram_data : std_ulogic_vector(17 downto 0);
   
   signal adc1signal, adc2signal, digitalsignal : unsigned(7 downto 0) := "00000000";
   
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: HSaqusition PORT MAP (
          clk => clk,
          rst => rst,
          datain => datain,
          addr => addr,
          wr => wr,
          rd => rd,
          dataout => dataout,
          sram_addr => sram_addr,
          sram_data => sram_data,
          sram_wr => sram_wr,
          sram_ce => sram_ce,
          sram_oe => sram_oe,
          digital_in => digital_in,
          hs_adc_a => hs_adc_a,
          hs_adc_b => hs_adc_b,
          adc_clk_a => adc_clk_a,
          adc_clk_b => adc_clk_b,
          adc_pwd_d => adc_pwd_d,
          hs_clock => hs_clock
        );
        
        
	--sram(to_integer(unsigned(sram_addr))) <= ram_data when sram_wr = '1' else (others => 'Z');
	--ram_data <= sram(to_integer(unsigned(sram_addr)));


   -- Clock process definitions
   clk_process :process
   begin
		clk <= '0';
		wait for clk_period/2;
		clk <= '1';
		wait for clk_period/2;
   end process;
 
   hs_clock_process :process
   begin
		hs_clock <= '0';
		wait for hs_clock_period/2;
		hs_clock <= '1';
		wait for hs_clock_period/2;
   end process;
   
   
   hs_data : process
   begin
	wait until rising_edge(clk);
	adc1signal <= adc1signal +1;
	adc2signal <= adc2signal -1;
	digitalsignal <= digitalsignal +3;
		
	hs_adc_a <= std_ulogic_vector( adc1signal );
	hs_adc_b <= std_ulogic_vector( adc2signal ) ;
	digital_in <= std_ulogic_vector( digitalsignal ) ;
   end process hs_data;
   
   
   test : process is
	variable i : integer range 0 to 524289;
   begin

	--rst <= '1';
	--datain <= "00000000";
	--addr <= "00000000";
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
	addr <= "00000001";
	datain <= "00000010";
	wait until falling_edge(clk);
	wr <= '1';
	wait until falling_edge(clk);
	wr <= '0';
	wait until rising_edge(clk);
	wait until rising_edge(clk);
	wait until rising_edge(clk);
	wait until rising_edge(clk);
	datain <= "00000100";  --combus 0
	wait until falling_edge(clk);
	wr <= '1';
	wait until falling_edge(clk);
	wr <= '0';
	wait until rising_edge(clk);
	wait until rising_edge(clk);
	wait until rising_edge(clk);
	wait until rising_edge(clk);
	datain <= "00000001"; --combus 1
	wait until falling_edge(clk);
	wr <= '1';
	wait until falling_edge(clk);
	wr <= '0';
	wait until rising_edge(clk);
	wait until rising_edge(clk);
	wait until rising_edge(clk);
	wait until rising_edge(clk);
	datain <= "00000100"; --copmbus 2
	wait until falling_edge(clk);
	wr <= '1';
	wait until falling_edge(clk);
	wr <= '0';
	wait until rising_edge(clk);
	wait until rising_edge(clk);
	wait until rising_edge(clk);
	wait until rising_edge(clk);
	datain <= "10000000"; --copmbus 3
	wait until falling_edge(clk);
	wr <= '1';
	wait until falling_edge(clk);
	wr <= '0';
	wait until rising_edge(clk);
	wait until rising_edge(clk);
	wait until rising_edge(clk);
	wait until rising_edge(clk);
	datain <= "00000000"; --copmbus 4
	wait until falling_edge(clk);
	wr <= '1';
	wait until falling_edge(clk);
	wr <= '0';
	wait until rising_edge(clk);
	wait until rising_edge(clk);
	wait until rising_edge(clk);
	wait until rising_edge(clk);
	datain <= "00000000"; --copmbus 5
	wait until falling_edge(clk);
	wr <= '1';
	wait until falling_edge(clk);
	wr <= '0';
	wait until rising_edge(clk);
	wait until rising_edge(clk);
	wait until rising_edge(clk);
	wait until rising_edge(clk);
	datain <= "00001100"; --copmbus 6
	wait until falling_edge(clk);
	wr <= '1';
	wait until falling_edge(clk);
	wr <= '0';
	
	---------------------------------------
	wait until sram_wr = '1';
	wait until sram_wr = '0';
	
	--------------------------------------

	
	wait until rising_edge(clk);
	wait until rising_edge(clk);
	wait until rising_edge(clk);
	addr <= "00000001";
	datain <= "00000001";  ----------------read Ram
	wait until falling_edge(clk);
	wr <= '1';
	wait until falling_edge(clk);
	wr <= '0';
	wait until rising_edge(clk);
	wait until rising_edge(clk);
	wait until rising_edge(clk);
	wait until rising_edge(clk);
	
	while (i <= 524288) loop
		
		wait until rising_edge(clk);
		wait until falling_edge(clk);
		rd <= '1';
		wait until falling_edge(clk);
		rd <= '0';
		wait until rising_edge(clk);
		wait until rising_edge(clk);
		wait until rising_edge(clk);
		wait until falling_edge(clk);
		rd <= '1';
		wait until falling_edge(clk);
		rd <= '0';
		wait until rising_edge(clk);
		wait until rising_edge(clk);
		wait until rising_edge(clk);
		wait until falling_edge(clk);
		rd <= '1';
		wait until falling_edge(clk);
		rd <= '0';
		wait until rising_edge(clk);
		wait until rising_edge(clk);
		i := i + 1;
	end loop;
	
	wait until rst = '1';
end process test;
 

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 10 ns.
	rst <= '1';
	-- for 1 ns;	
	wait for clk_period*3;
	rst  <= '0';

	wait for clk_period*10;
      -- insert stimulus here 

   wait for 15000 ns;
    rst  <= '1';
   end process;

END;
