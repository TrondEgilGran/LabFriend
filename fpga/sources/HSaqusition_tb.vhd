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
-- This testbench has been automatically generated using types std_logic and
-- std_logic_vector for the ports of the unit under test.  Xilinx recommends
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
    generic( ram_addr_width : natural := 29; --Number of bits in SRAM addr bus
		 ram_data_width : natural := 32;
		 ram_depth : natural := 19;
		 address : std_logic_vector( 7 downto 0 ) := "00000001"
	);
    PORT(
		clk : in std_logic;
		rst : in std_logic;
		datain : in std_logic_vector( 7 downto 0);
		addr : in std_logic_vector( 7 downto 0);
		wr : in std_logic;
		rd : in std_logic;
		dataout : out std_logic_vector( 7 downto 0);
		adc_a_ram_addr : out std_logic_vector( ram_addr_width-1 downto 0);
		adc_a_ram_data : inout std_logic_vector( ram_data_width-1 downto 0);
		adc_a_ram_wr : out std_logic;
		adc_a_cmd_en : out std_logic;
		adc_b_ram_addr : out std_logic_vector( ram_addr_width-1 downto 0);
		adc_b_ram_data : inout std_logic_vector( ram_data_width-1 downto 0);
		adc_b_ram_wr : out std_logic;
		adc_b_cmd_en : out std_logic;
		digital_in_ram_addr : out std_logic_vector( ram_addr_width-1 downto 0);
		digital_in_ram_data : inout std_logic_vector( ram_data_width-1 downto 0);
		digital_in_ram_wr : out std_logic;
		digital_in_ram_rd : out std_logic;
		digital_in_ram_rd_empty : in std_logic;
		digital_in_cmd_en : out std_logic;
		digital_in_ram_data_read : in std_logic_vector( ram_data_width-1 downto 0);
		ram_command : out std_logic_vector(2 downto 0);
		ram_bl : out std_logic_vector(5 downto 0);
		ram_clock : out std_logic;
		digital_in : in std_logic_vector( 7 downto 0);
		hs_adc_a : in std_logic_vector( 7 downto 0);
		hs_adc_b : in std_logic_vector( 7 downto 0);
		adc_clk_a : out std_logic;
		adc_clk_b : out std_logic;
		adc_pwd_d : out std_logic;
		hs_clock_2 : in std_logic;
		hs_clock_4 : in std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal clk : std_logic := '0';
   signal rst : std_logic := '0';
   signal datain : std_logic_vector(7 downto 0) := (others => '0');
   signal addr : std_logic_vector(7 downto 0) := (others => '0');
   signal wr : std_logic := '0';
   signal rd : std_logic := '0';
   signal digital_in : std_logic_vector(7 downto 0) := (others => '0');
   signal hs_adc_a : std_logic_vector(7 downto 0) := (others => '0');
   signal hs_adc_b : std_logic_vector(7 downto 0) := (others => '0');
   signal hs_clock : std_logic := '0';

	--BiDirs
   signal sram_data : std_logic_vector(17 downto 0);


 	--Outputs
   signal dataout : std_logic_vector(7 downto 0);




   signal adc_clk_a : std_logic;
   signal adc_clk_b : std_logic;
   signal adc_pwd_d : std_logic;
   
   signal adc_a_ram_addr   : std_logic_vector( 29-1 downto 0);	
   signal adc_a_ram_data   : std_logic_vector( 32-1 downto 0); 
   signal adc_a_ram_wr     : std_logic;   
   signal adc_a_cmd_en     : std_logic;     
   signal adc_b_ram_addr   : std_logic_vector( 29-1 downto 0);	     
   signal adc_b_ram_data   : std_logic_vector( 32-1 downto 0);      
   signal adc_b_ram_wr     : std_logic;     
   signal adc_b_cmd_en      : std_logic;    
   signal digital_in_ram_addr  : std_logic_vector( 29-1 downto 0);	 
   signal digital_in_ram_data, digital_in_ram_data_read  : std_logic_vector( 32-1 downto 0);  
   signal digital_in_ram_wr,  digital_in_ram_rd, digital_in_ram_rd_empty : std_logic;
   signal digital_in_cmd_en     : std_logic;
   signal ram_command           : std_logic_vector(2 downto 0);
   signal ram_bl                :  std_logic_vector(5 downto 0);
   signal ram_clock : std_logic;
   signal finished_write : std_logic;

   -- Clock period definitions
   constant clk_period : time := 20 ns;
   constant hs_clock_period : time := 10 ns;
   
   --type ram_array is array ( 0 to 524287 ) of std_logic_vector( 17 downto 0 );
   --signal sram : ram_array;
   --signal ram_data : std_logic_vector(17 downto 0);
   
   signal adc1signal, adc2signal, digitalsignal : unsigned(7 downto 0) := "00000000";
   signal xabc, xaa, xbb, xcc : unsigned(7 downto 0) := "00000000";
   signal loopcounter  : integer :=0 ;
   
 
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
	  adc_a_ram_addr   	=>   adc_a_ram_addr,   	
	  adc_a_ram_data        =>   adc_a_ram_data,        
	  adc_a_ram_wr          =>   adc_a_ram_wr,          
	  adc_a_cmd_en          =>   adc_a_cmd_en,          
	  adc_b_ram_addr        =>   adc_b_ram_addr,        
	  adc_b_ram_data        =>   adc_b_ram_data,        
	  adc_b_ram_wr          =>   adc_b_ram_wr,          
	  adc_b_cmd_en          =>   adc_b_cmd_en ,         
	  digital_in_ram_addr   =>   digital_in_ram_addr ,  
	  digital_in_ram_data   =>   digital_in_ram_data ,  
	  digital_in_ram_wr     =>   digital_in_ram_wr ,   
	  digital_in_ram_rd     =>   digital_in_ram_rd,
	  digital_in_ram_rd_empty => digital_in_ram_rd_empty,
	  digital_in_cmd_en     =>   digital_in_cmd_en , 
	  digital_in_ram_data_read => digital_in_ram_data_read ,
	  ram_command           =>   ram_command ,          
	  ram_bl                =>   ram_bl,  
	  ram_clock => ram_clock,
          digital_in => digital_in,
          hs_adc_a => hs_adc_a,
          hs_adc_b => hs_adc_b,
          adc_clk_a => adc_clk_a,
          adc_clk_b => adc_clk_b,
          adc_pwd_d => adc_pwd_d,
          hs_clock_2 => hs_clock,
          hs_clock_4 => hs_clock
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
		
	hs_adc_a <= std_logic_vector( adc1signal );
	hs_adc_b <= std_logic_vector( adc2signal ) ;
	digital_in <= std_logic_vector( digitalsignal ) ;
   end process hs_data;
   
   
   test : process is
	variable i : integer range 0 to 524289;
   begin

	--rst <= '1';
	--datain <= "00000000";
	--addr <= "00000000";
	i := 0;
	rd <= '0';
	digital_in_ram_rd_empty <= '1';
	finished_write <= '0';
	
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
	while (i <= 65555) loop
		wait until adc_a_ram_wr = '1';
		--wait until adc_a_ram_wr  = '0';
		loopcounter <= loopcounter + 1;
		i := i + 1;
	end loop;
	
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
	
	--------------------------------------
	finished_write <= '1';
	
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
	digital_in_ram_rd_empty <= '0';
	wait until rising_edge(clk);
	wait until rising_edge(clk);
	wait until rising_edge(clk);
	wait until rising_edge(clk);
	wait until rising_edge(clk);
	wait until rising_edge(clk);
	
	i := 0;
	while (i <= 65555) loop
		--if digital_in_ram_rd = '1' then
			xabc <= xabc +1;
			xaa <= xaa +2;
			xbb <= xbb -1;
			xcc <= xcc -2;
			digital_in_ram_data_read(7 downto 0) <= std_logic_vector(xabc);
			digital_in_ram_data_read(15 downto 8) <= std_logic_vector(xaa);
			digital_in_ram_data_read(23 downto 16) <= std_logic_vector(xbb);
			digital_in_ram_data_read(31 downto 24) <= std_logic_vector(xcc);
		--end if;
		wait until rising_edge(clk);
		wait until falling_edge(clk);
		rd <= '1';
		wait until falling_edge(clk);
		rd <= '0';
		wait until rising_edge(clk);
		wait until rising_edge(clk);
		wait until rising_edge(clk);
		wait until falling_edge(clk);
		wait until falling_edge(clk);
		rd <= '1';
		wait until falling_edge(clk);
		rd <= '0';
		wait until rising_edge(clk);
		wait until rising_edge(clk);
		wait until rising_edge(clk);
		wait until falling_edge(clk);
		wait until falling_edge(clk);
		rd <= '1';
		wait until falling_edge(clk);
		rd <= '0';
		wait until rising_edge(clk);
		wait until rising_edge(clk);
		wait until rising_edge(clk);
		wait until falling_edge(clk);
		wait until falling_edge(clk);
		rd <= '1';
		wait until falling_edge(clk);
		rd <= '0';
		wait until rising_edge(clk);
		wait until rising_edge(clk);
		wait until falling_edge(clk);
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

   wait for 5500000 ns;
    rst  <= '1';
   end process;

END;
