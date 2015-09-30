--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   11:21:57 07/21/2013
-- Design Name:   
-- Module Name:   /home/teg/Server/TEG/Projects/SuperScopePro/FPGACODE/oscopeSram/spimaster_tb.vhd
-- Project Name:  oscopeSram
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: SPIMASTER
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
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--USE ieee.numeric_std.ALL;
 
ENTITY spimaster_tb IS
END spimaster_tb;
 
ARCHITECTURE behavior OF spimaster_tb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT SPIMASTER
    PORT(
         spiclk : IN  std_logic;
         clk : IN  std_logic;
         rst : IN  std_logic;
         spidatain : IN  std_logic;
         spidataout : OUT  std_logic;
         spics : IN  std_logic;
         nrbyte : OUT  std_logic_vector(15 downto 0);
         dataout : OUT  std_logic_vector(7 downto 0);
         datain0 : IN  std_logic_vector(7 downto 0);
         datain1 : IN  std_logic_vector(7 downto 0);
         datain2 : IN  std_logic_vector(7 downto 0);
         datain3 : IN  std_logic_vector(7 downto 0);
         datain4 : IN  std_logic_vector(7 downto 0);
         datain5 : IN  std_logic_vector(7 downto 0);
         datain6 : IN  std_logic_vector(7 downto 0);
         datain7 : IN  std_logic_vector(7 downto 0);
         command : OUT  std_logic_vector(7 downto 0);
         RD : OUT  std_logic;
         WR : OUT  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal spiclk : std_logic := '0';
   signal clk : std_logic := '0';
   signal rst : std_logic := '0';
   signal spidatain : std_logic := '0';
   signal spics : std_logic := '0';
   signal datain0 : std_logic_vector(7 downto 0) := (others => '0');
   signal datain1 : std_logic_vector(7 downto 0) := (others => '0');
   signal datain2 : std_logic_vector(7 downto 0) := (others => '0');
   signal datain3 : std_logic_vector(7 downto 0) := (others => '0');
   signal datain4 : std_logic_vector(7 downto 0) := (others => '0');
   signal datain5 : std_logic_vector(7 downto 0) := (others => '0');
   signal datain6 : std_logic_vector(7 downto 0) := (others => '0');
   signal datain7 : std_logic_vector(7 downto 0) := (others => '0');

 	--Outputs
   signal spidataout : std_logic;
   signal nrbyte : std_logic_vector(15 downto 0);
   signal dataout : std_logic_vector(7 downto 0);
   signal command : std_logic_vector(7 downto 0);
   signal RD : std_logic;
   signal WR : std_logic;

   -- Clock period definitions
   constant spiclk_period : time := 33.3 ns;
   constant clk_period : time := 20 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: SPIMASTER PORT MAP (
          spiclk => spiclk,
          clk => clk,
          rst => rst,
          spidatain => spidatain,
          spidataout => spidataout,
          spics => spics,
          nrbyte => nrbyte,
          dataout => dataout,
          datain0 => datain0,
          datain1 => datain1,
          datain2 => datain2,
          datain3 => datain3,
          datain4 => datain4,
          datain5 => datain5,
          datain6 => datain6,
          datain7 => datain7,
          command => command,
          RD => RD,
          WR => WR
        );

   -- Clock process definitions
 
   clk_process :process
   begin
		clk <= '0';
		wait for clk_period/2;
		clk <= '1';
		wait for clk_period/2;
   end process;
 

   -- Stimulus process
   stim_proc: process
	variable i : integer range 0 to 500;
   begin		
      -- hold reset state for 100 ns.
		rst <= '1';
		spics <= '1';
		spiclk <= '0';
		spidatain <= '0';
      wait for 100 ns;	
		rst <= '0';
      wait for spiclk_period*10;
		
		spics <= '0';
		
		------------Command----------------
		--Byte 2
		--Bit 0
		spiclk <= '0';
		spidatain <= '0'; --Data
		wait for spiclk_period/2;
		spiclk <= '1';
		wait for spiclk_period/2;
		--Bit 1
		spidatain <= '0'; --Data
		spiclk <= '0';
		wait for spiclk_period/2;
		spiclk <= '1';
		wait for spiclk_period/2;
		--Bit 2
		spidatain <= '0'; --Data
		spiclk <= '0';
		wait for spiclk_period/2;
		spiclk <= '1';
		wait for spiclk_period/2;    
		--Bit 3
		spidatain <= '0';  --Data
		spiclk <= '0';
		wait for spiclk_period/2;
		spiclk <= '1';
		wait for spiclk_period/2; 
		--Bit 4
		spidatain <= '0'; --Data
		spiclk <= '0';
		wait for spiclk_period/2;
		spiclk <= '1';
		wait for spiclk_period/2; 
		--Bit 5
		spidatain <= '1'; --Data
		spiclk <= '0';
		wait for spiclk_period/2;
		spiclk <= '1';
		wait for spiclk_period/2; 
		--Biti 6
		spidatain <= '1'; --Data
		spiclk <= '0';
		wait for spiclk_period/2;
		spiclk <= '1';
		wait for spiclk_period/2; 
		--Bit 7
		spidatain <= '0';  --Data
		spiclk <= '0';
		wait for spiclk_period/2;
		spiclk <= '1';
		wait for spiclk_period/2; 	
		
		--Byte 1
		--Bit 0
		spidatain <= '0'; --Data
		spiclk <= '0';
		wait for spiclk_period/2;
		spiclk <= '1';
		wait for spiclk_period/2;
		--Bit 1
		spidatain <= '0'; --Data
		spiclk <= '0';
		wait for spiclk_period/2;
		spiclk <= '1';
		wait for spiclk_period/2;
		--Bit 2
		spidatain <= '0'; --Data
		spiclk <= '0';
		wait for spiclk_period/2;
		spiclk <= '1';
		wait for spiclk_period/2;    
		--Bit 3
		spidatain <= '0';  --Data
		spiclk <= '0';
		wait for spiclk_period/2;
		spiclk <= '1';
		wait for spiclk_period/2; 
		--Bit 4
		spidatain <= '0'; --Data
		spiclk <= '0';
		wait for spiclk_period/2;
		spiclk <= '1';
		wait for spiclk_period/2; 
		--Bit 5
		spidatain <= '0'; --Data
		spiclk <= '0';
		wait for spiclk_period/2;
		spiclk <= '1';
		wait for spiclk_period/2; 
		--Biti 6
		spidatain <= '0'; --Data
		spiclk <= '0';
		wait for spiclk_period/2;
		spiclk <= '1';
		wait for spiclk_period/2; 
		--Bit 7
		spidatain <= '0';  --Data
		spiclk <= '0';
		wait for spiclk_period/2;
		spiclk <= '1';
		wait for spiclk_period/2;
 
		--Byte 0
		--Bit 0
		spidatain <= '0'; --Data
		spiclk <= '0';
		wait for spiclk_period/2;
		spiclk <= '1';
		wait for spiclk_period/2;
		--Bit 1
		spidatain <= '0'; --Data
		spiclk <= '0';
		wait for spiclk_period/2;
		spiclk <= '1';
		wait for spiclk_period/2;
		--Bit 2
		spidatain <= '0'; --Data
		spiclk <= '0';
		wait for spiclk_period/2;
		spiclk <= '1';
		wait for spiclk_period/2;    
		--Bit 3
		spidatain <= '0';  --Data
		spiclk <= '0';
		wait for spiclk_period/2;
		spiclk <= '1';
		wait for spiclk_period/2; 
		--Bit 4
		spidatain <= '0'; --Data
		spiclk <= '0';
		wait for spiclk_period/2;
		spiclk <= '1';
		wait for spiclk_period/2; 
		--Bit 5
		spidatain <= '0'; --Data
		spiclk <= '0';
		wait for spiclk_period/2;
		spiclk <= '1';
		wait for spiclk_period/2; 
		--Biti 6
		spidatain <= '0'; --Data
		spiclk <= '0';
		wait for spiclk_period/2;
		spiclk <= '1';
		wait for spiclk_period/2; 
		--Bit 7
		spidatain <= '1';  --Data
		spiclk <= '0';
		wait for spiclk_period/2;
		spiclk <= '1';
		wait for spiclk_period/2;

		--Data--------------------------------
		--Byte 0
		--Bit 0
		spidatain <= '0'; --Data
		spiclk <= '0';
		wait for spiclk_period/2;
		spiclk <= '1';
		wait for spiclk_period/2;
		--Bit 1
		spidatain <= '0'; --Data
		spiclk <= '0';
		wait for spiclk_period/2;
		spiclk <= '1';
		wait for spiclk_period/2;
		--Bit 2
		spidatain <= '0'; --Data
		spiclk <= '0';
		wait for spiclk_period/2;
		spiclk <= '1';
		wait for spiclk_period/2;    
		--Bit 3
		spidatain <= '0';  --Data
		spiclk <= '0';
		wait for spiclk_period/2;
		spiclk <= '1';
		wait for spiclk_period/2; 
		--Bit 4
		spidatain <= '1'; --Data
		spiclk <= '0';
		wait for spiclk_period/2;
		spiclk <= '1';
		wait for spiclk_period/2; 
		--Bit 5
		spidatain <= '0'; --Data
		spiclk <= '0';
		wait for spiclk_period/2;
		spiclk <= '1';
		wait for spiclk_period/2; 
		--Biti 6
		spidatain <= '0'; --Data
		spiclk <= '0';
		wait for spiclk_period/2;
		spiclk <= '1';
		wait for spiclk_period/2; 
		--Bit 7
		spidatain <= '1';  --Data
		spiclk <= '0';
		wait for spiclk_period/2;
		spiclk <= '1';
		wait for spiclk_period/2;

		


		------------Command----------------
		--Byte 2
		--Bit 0
		spiclk <= '0';
		spidatain <= '1'; --Data
		wait for spiclk_period/2;
		spiclk <= '1';
		wait for spiclk_period/2;
		--Bit 1
		spidatain <= '0'; --Data
		spiclk <= '0';
		wait for spiclk_period/2;
		spiclk <= '1';
		wait for spiclk_period/2;
		--Bit 2
		spidatain <= '0'; --Data
		spiclk <= '0';
		wait for spiclk_period/2;
		spiclk <= '1';
		wait for spiclk_period/2;    
		--Bit 3
		spidatain <= '0';  --Data
		spiclk <= '0';
		wait for spiclk_period/2;
		spiclk <= '1';
		wait for spiclk_period/2; 
		--Bit 4
		spidatain <= '0'; --Data
		spiclk <= '0';
		wait for spiclk_period/2;
		spiclk <= '1';
		wait for spiclk_period/2; 
		--Bit 5
		spidatain <= '0'; --Data
		spiclk <= '0';
		wait for spiclk_period/2;
		spiclk <= '1';
		wait for spiclk_period/2; 
		--Biti 6
		spidatain <= '0'; --Data
		spiclk <= '0';
		wait for spiclk_period/2;
		spiclk <= '1';
		wait for spiclk_period/2; 
		--Bit 7
		spidatain <= '1';  --Data
		spiclk <= '0';
		wait for spiclk_period/2;
		spiclk <= '1';
		wait for spiclk_period/2; 	
	-----------------------------------------------cmd finish	
		--Byte 1
		--Bit 0
		spidatain <= '0'; --Data
		spiclk <= '0';
		wait for spiclk_period/2;
		spiclk <= '1';
		wait for spiclk_period/2;
		--Bit 1
		spidatain <= '0'; --Data
		spiclk <= '0';
		wait for spiclk_period/2;
		spiclk <= '1';
		wait for spiclk_period/2;
		--Bit 2
		spidatain <= '0'; --Data
		spiclk <= '0';
		wait for spiclk_period/2;
		spiclk <= '1';
		wait for spiclk_period/2;    
		--Bit 3
		spidatain <= '0';  --Data
		spiclk <= '0';
		wait for spiclk_period/2;
		spiclk <= '1';
		wait for spiclk_period/2; 
		--Bit 4
		spidatain <= '0'; --Data
		spiclk <= '0';
		wait for spiclk_period/2;
		spiclk <= '1';
		wait for spiclk_period/2; 
		--Bit 5
		spidatain <= '0'; --Data
		spiclk <= '0';
		wait for spiclk_period/2;
		spiclk <= '1';
		wait for spiclk_period/2; 
		--Biti 6
		spidatain <= '0'; --Data
		spiclk <= '0';
		wait for spiclk_period/2;
		spiclk <= '1';
		wait for spiclk_period/2; 
		--Bit 7
		spidatain <= '1';  --Data
		spiclk <= '0';
		wait for spiclk_period/2;
		spiclk <= '1';
		wait for spiclk_period/2;
		
		------------------size 1
		--Data IN
		datain1 <= "01010011";
		--Byte 0
		--Bit 0
		spidatain <= '1'; --Data
		spiclk <= '0';
		wait for spiclk_period/2;
		spiclk <= '1';
		wait for spiclk_period/2;
		--Bit 1
		spidatain <= '0'; --Data
		spiclk <= '0';
		wait for spiclk_period/2;
		spiclk <= '1';
		wait for spiclk_period/2;
		--Bit 2
		spidatain <= '0'; --Data
		spiclk <= '0';
		wait for spiclk_period/2;
		spiclk <= '1';
		wait for spiclk_period/2;    
		--Bit 3
		spidatain <= '0';  --Data
		spiclk <= '0';
		wait for spiclk_period/2;
		spiclk <= '1';
		wait for spiclk_period/2; 
		--Bit 4
		spidatain <= '0'; --Data
		spiclk <= '0';
		wait for spiclk_period/2;
		spiclk <= '1';
		wait for spiclk_period/2; 
		--Bit 5
		spidatain <= '0'; --Data
		spiclk <= '0';
		wait for spiclk_period/2;
		spiclk <= '1';
		wait for spiclk_period/2; 
		--Biti 6
		spidatain <= '0'; --Data
		spiclk <= '0';
		wait for spiclk_period/2;
		spiclk <= '1';
		wait for spiclk_period/2; 
		--Bit 7
		spidatain <= '0';  --Data
		spiclk <= '0';
		wait for spiclk_period/2;
		spiclk <= '1';
		wait for spiclk_period/2;
		-----------------------------size
		--Data IN
		datain1 <= "00001111";
		--Byte 0
		--Bit 0
		spiclk <= '0';
		wait for spiclk_period/2;
		spiclk <= '1';
		wait for spiclk_period/2;
		--Bit 1
		spiclk <= '0';
		wait for spiclk_period/2;
		spiclk <= '1';
		wait for spiclk_period/2;
		--Bit 2
		spiclk <= '0';
		wait for spiclk_period/2;
		spiclk <= '1';
		wait for spiclk_period/2;    
		--Bit 3
		spiclk <= '0';
		wait for spiclk_period/2;
		spiclk <= '1';
		wait for spiclk_period/2; 
		--Bit 4
		spiclk <= '0';
		wait for spiclk_period/2;
		spiclk <= '1';
		wait for spiclk_period/2; 
		--Bit 5
		spiclk <= '0';
		wait for spiclk_period/2;
		spiclk <= '1';
		wait for spiclk_period/2; 
		--Biti 6
		spiclk <= '0';
		wait for spiclk_period/2;
		spiclk <= '1';
		wait for spiclk_period/2; 
		--Bit 7
		spiclk <= '0';
		wait for spiclk_period/2;
		spiclk <= '1';
		wait for spiclk_period/2;
		--Data IN
		datain1 <= "11110010";
		--Byte 0
		--Bit 0
		spiclk <= '0';
		wait for spiclk_period/2;
		spiclk <= '1';
		wait for spiclk_period/2;
		--Bit 1
		spiclk <= '0';
		wait for spiclk_period/2;
		spiclk <= '1';
		wait for spiclk_period/2;
		--Bit 2
		spiclk <= '0';
		wait for spiclk_period/2;
		spiclk <= '1';
		wait for spiclk_period/2;    
		--Bit 3
		spiclk <= '0';
		wait for spiclk_period/2;
		spiclk <= '1';
		wait for spiclk_period/2; 
		--Bit 4
		spiclk <= '0';
		wait for spiclk_period/2;
		spiclk <= '1';
		wait for spiclk_period/2; 
		--Bit 5
		spiclk <= '0';
		wait for spiclk_period/2;
		spiclk <= '1';
		wait for spiclk_period/2; 
		--Biti 6
		spiclk <= '0';
		wait for spiclk_period/2;
		spiclk <= '1';
		wait for spiclk_period/2; 
		--Bit 7
		spiclk <= '0';
		wait for spiclk_period/2;
		spiclk <= '1';
		wait for spiclk_period/2;
	--Data IN
		
		while (i <= 300) loop
			--Byte 0
			--Bit 0
			spiclk <= '0';
			wait for spiclk_period/2;
			spiclk <= '1';
			wait for spiclk_period/2;
			--Bit 1
			spiclk <= '0';
			wait for spiclk_period/2;
			spiclk <= '1';
			wait for spiclk_period/2;
			--Bit 2
			spiclk <= '0';
			wait for spiclk_period/2;
			spiclk <= '1';
			wait for spiclk_period/2;    
			--Bit 3
			spiclk <= '0';
			wait for spiclk_period/2;
			spiclk <= '1';
			wait for spiclk_period/2; 
			--Bit 4
			spiclk <= '0';
			wait for spiclk_period/2;
			spiclk <= '1';
			wait for spiclk_period/2; 
			--Bit 5
			spiclk <= '0';
			wait for spiclk_period/2;
			spiclk <= '1';
			wait for spiclk_period/2; 
			--Biti 6
			spiclk <= '0';
			wait for spiclk_period/2;
			spiclk <= '1';
			wait for spiclk_period/2; 
			--Bit 7
			spiclk <= '0';
			wait for spiclk_period/2;
			spiclk <= '1';
			wait for spiclk_period/2;
		end loop;
		-- insert stimulus here 

      wait;
   end process;

END;
