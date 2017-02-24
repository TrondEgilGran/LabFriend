----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    11:13:06 07/20/2013 
-- Design Name: 
-- Module Name:    SPIMASTER - Behavioral 
-- Project Name: 
-- Target Devices: 
-- Tool versions: 
-- Description: 
--
-- Dependencies: 
--
-- Revision: 
-- Revision 0.01 - File Created
-- Additional Comments: 
--
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
library UNISIM;
use UNISIM.VComponents.all;




entity SPIMASTER is
    Port ( spiclk : in  STD_LOGIC;
           clk : in  STD_LOGIC;
	   rst : in STD_LOGIC;
           spidatain : in  STD_LOGIC;
           spidataout : out  STD_LOGIC;
           spics : in  STD_LOGIC;
           nrbyte : out  STD_LOGIC_VECTOR (15 downto 0);
           dataout : out  STD_LOGIC_VECTOR (7 downto 0);
           datain0 : in  STD_LOGIC_VECTOR (7 downto 0);
           datain1 : in  STD_LOGIC_VECTOR (7 downto 0);
           datain2 : in  STD_LOGIC_VECTOR (7 downto 0);
           datain3 : in  STD_LOGIC_VECTOR (7 downto 0);
           datain4 : in  STD_LOGIC_VECTOR (7 downto 0);
           datain5 : in  STD_LOGIC_VECTOR (7 downto 0);
           datain6 : in  STD_LOGIC_VECTOR (7 downto 0);
           datain7 : in  STD_LOGIC_VECTOR (7 downto 0);
           command : out  STD_LOGIC_VECTOR (7 downto 0);
			  --Device Sel Format:
			  --Bit7: Read/Write 1= read, 0=write
			  --Bit6: Command/data mode
			  --Bit5: Reserved
			  --Bit4: Reserved
			  --Bit3: Reserved
			  --Bit2-0: Device data selector
           RD : out  STD_LOGIC;
           WR : out  STD_LOGIC);
end SPIMASTER;


architecture Behavioral of SPIMASTER is

	signal spiClkRisingEdge : std_logic;
	signal spiClkFallingEdge : std_logic;
	signal spiregin : std_logic_vector(7 downto 0);
	signal spiregout : std_logic_vector(7 downto 0);
	signal spibitcounter : unsigned(3 downto 0);
	signal spiregload, spiregloadD1 : std_logic;
	signal datainreg, dataindl : std_logic_vector(7 downto 0);
	signal dataoutreg, dataoutregM1, dataoutregM1D1, dataoutregM1D2, dataoutregM1D3, dataoutregM1D4 : std_logic_vector( 7 downto 0);
	signal newdataflag, newdataflagM1, newdataflagM1D1, newdataflagM1D2, newdataflagM1D3, newdataflagM1D4 : std_logic;
	signal newRDdataflag, newRDdataflagM1, newRDdataflagM1D1, newRDdataflagM1D2, newRDdataflagM1D3, newRDdataflagM1D4 : std_logic;
	signal commandReg: std_logic_vector(7 downto 0);
	signal spicommandCounter: unsigned(2 downto 0);
	signal spidataByteCounter, nrbytedelay: unsigned(15 downto 0);
	signal wrdelay, rddelay, spiregloaded, rdzeero : std_logic;
begin


pSPIR: process(spiclk, rst, spics) is
begin
	if (rst = '1') then
		spibitcounter <= (others => '0');
		spiregin <= (others => '0');
		newdataflagM1 <= '0';
		newRDdataflagM1 <= '0';
	elsif rising_edge(spiclk) then
		if spics = '0' then
			if spibitcounter = 7 then
				spibitcounter <= (others => '0');
				dataoutregM1 <= spiregin(6 downto 0) & spidatain;
				newdataflagM1 <= '1';
				if commandReg(7) = '1' then
					spiregout <= datainreg;
				end if;
				
			else
				spibitcounter <= spibitcounter + 1;
				spiregin <= spiregin(6 downto 0) & spidatain;
				spiregout <= spiregout(6 downto 0) & '0';
			end if;
			
			if spibitcounter = 4 then
				if commandReg(7) = '1' then
					newRDdataflagM1 <= '0';
				end if;
			end if;
			
			if spibitcounter = 2 then
			newdataflagM1 <= '0';
			newRDdataflagM1 <= '1';
			end if;
		else
			spibitcounter <= (others => '0');
		end if;
		
	end if;
end process pSPIR;


spidataout <= spiregout(7);

pReclocker : process(clk, rst)

begin
	if rising_edge(clk) then
		newdataflagM1D1 <= newdataflagM1;
		newdataflagM1D2 <= newdataflagM1D1;
		newdataflagM1D3 <= newdataflagM1D2;
		newdataflagM1D4 <= newdataflagM1D3;
		newRDdataflagM1D1 <= newRDdataflagM1;
		newRDdataflagM1D2 <= newRDdataflagM1D1;
		newRDdataflagM1D3 <= newRDdataflagM1D2;
		newRDdataflagM1D4 <= newRDdataflagM1D3;
		dataoutregM1D1 <= dataoutregM1;
		dataoutregM1D2 <= dataoutregM1D1;
		dataoutregM1D3 <= dataoutregM1D2;
		dataoutregM1D4 <= dataoutregM1D3;
		dataoutreg <= dataoutregM1;
	end if;
end process pReclocker;
newdataflag <= (not newdataflagM1D4) and newdataflagM1D3;
newRDdataflag <= (not newRDdataflagM1D3) and newRDdataflagM1D2;



with commandReg(2 downto 0) select
datainreg <= 	datain0 when "000",
				 	datain1 when "001",
					datain2 when "010",
					datain3 when "011",
					datain4 when "100",
					datain5 when "101",
					datain6 when "110",
					datain7 when "111",
					"00000000" when others;
			

pDataSorter: process (clk, rst) is

begin
	if rst = '1' then
		spicommandCounter <= (others => '0');
		wrdelay <= '0'; 
		rddelay <= '0';
		spidataByteCounter <= (others => '0');
	elsif rising_edge(clk) then
		if newdataflag = '1' then
			if spidataByteCounter = 0 or spicommandCounter /= 0 then
				if spicommandCounter = 0 then
					commandReg <= dataoutreg;
					spicommandCounter <= spicommandCounter + 1;
				elsif spicommandCounter = 1 then
					spidataByteCounter(15 downto 8) <= unsigned(dataoutreg);
					spicommandCounter <= spicommandCounter + 1;
				elsif spicommandCounter = 2 then
					spidataByteCounter( 7 downto 0) <= unsigned(dataoutreg);
					spicommandCounter <= (others => '0');
				end if;
			else
				if commandReg(7) = '0' then
					wrdelay <= '1';
					dataout <= dataoutreg;
				end if;
				spidataByteCounter <= spidataByteCounter - 1;
				
			end if;
		else
			wrdelay <= '0';
		end if;
		
		if newRDdataflag = '1' then
			if spidataByteCounter = 0 then
				if spicommandCounter = 2 then
					if commandReg(7) = '1' then 
						rddelay <= '1';
					end if;
				end if;
			else
				if commandReg(7) = '1' then
					if spidataByteCounter /= 1 then
						rddelay <= '1';
					end if;
				end if;
				
			end if;
		else
			rddelay <= '0';
		end if;

		command <= commandReg;
		nrbytedelay <= spidataByteCounter;
		nrbyte <= std_logic_vector(nrbytedelay);
		RD <= rddelay;
	end if;

end process pDataSorter;


wrrdedge: process (clk, rst) is

begin
	if rst = '1' then
		WR <= '0';
	elsif rising_edge(clk) then
		WR <= wrdelay;
	end if;
end process wrrdedge;

end Behavioral;

