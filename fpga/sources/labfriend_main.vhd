----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    10:29:34 07/20/2013 
-- Design Name: 
-- Module Name:    LabFriend - Behavioral 
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

library UNISIM;
use UNISIM.vcomponents.all;


-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity LabFriend is
    Port ( LAD07 : in  STD_ULOGIC_VECTOR (7 downto 0);
           LAD815 : out  STD_ULOGIC_VECTOR (7 downto 0);
           ASEL1 : out  STD_ULOGIC;
           I2SSCLK : out  STD_ULOGIC;
           I2SDATAIN : out  STD_ULOGIC;
           I2SDATAOUT : in  STD_ULOGIC;
           I2SBCK : out  STD_ULOGIC;
           I2SLRCK : out  STD_ULOGIC;
           MSTCLK : in  STD_ULOGIC;
           GPSPICS : out  STD_ULOGIC;
           GPSPIDATA : out  STD_ULOGIC;
           GPSPICLK : out  STD_ULOGIC;
           USBGPIO0 : out  STD_ULOGIC;
           USBGPIO1 : in  STD_ULOGIC;
           USBCS : in  STD_ULOGIC;
           USBSK : in  STD_ULOGIC;
           USBDO : in  STD_ULOGIC;
           USBDI : out  STD_ULOGIC;
           ADA : in  STD_ULOGIC_VECTOR (7 downto 0);
           ADB : in  STD_ULOGIC_VECTOR (7 downto 0);
           ADAC : out  STD_ULOGIC;
           ADBC : out  STD_ULOGIC;
           ADAP : out  STD_ULOGIC;
	   CMP_MEAS_SEL : out STD_ULOGIC;
	   CMPMEAS_EN : out STD_ULOGIC;
	   CMPMEAS_A : out STD_ULOGIC;
	   CMPMEAS_B : out STD_ULOGIC;
	   HFDAC_DI : out STD_ULOGIC;
	   HFDAC_CS : out STD_ULOGIC;
	   HFDAC_CLK : out STD_ULOGIC;
	   AU_CSN : out STD_ULOGIC;
	   AU_CCLK : out STD_ULOGIC;
	   AU_CDTI : out STD_ULOGIC;
	   DC_CS : OUT STD_ULOGIC;
	   DC_DOUT : in STD_ULOGIC;
	   AUPDN : out STD_ULOGIC;
	   AU_OVFL : in STD_ULOGIC;
	   AU_OVFR : in STD_ULOGIC);
end LabFriend;





architecture Behavioral of LabFriend is
component SPIMASTER is
    Port ( spiclk : in  STD_ULOGIC;
           clk : in  STD_ULOGIC;
	   rst : in STD_ULOGIC;
           spidatain : in  STD_ULOGIC;
           spidataout : out  STD_ULOGIC;
           spics : in  STD_ULOGIC;
           nrbyte : out  STD_ULOGIC_VECTOR (15 downto 0);
           dataout : out  STD_ULOGIC_VECTOR (7 downto 0);
           datain0 : in  STD_ULOGIC_VECTOR (7 downto 0);
           datain1 : in  STD_ULOGIC_VECTOR (7 downto 0);
           datain2 : in  STD_ULOGIC_VECTOR (7 downto 0);
           datain3 : in  STD_ULOGIC_VECTOR (7 downto 0);
           datain4 : in  STD_ULOGIC_VECTOR (7 downto 0);
           datain5 : in  STD_ULOGIC_VECTOR (7 downto 0);
           datain6 : in  STD_ULOGIC_VECTOR (7 downto 0);
           datain7 : in  STD_ULOGIC_VECTOR (7 downto 0);
           command : out  STD_ULOGIC_VECTOR (7 downto 0);
			  --Device Sel Format:
			  --Bit7: Read/Write 1= read, 0=write
			  --Bit6: Command/data mode
			  --Bit5: Reserved
			  --Bit4: Reserved
			  --Bit3: Reserved
			  --Bit2-0: Device data selector
           RD : out  STD_ULOGIC;
           WR : out  STD_ULOGIC);
end component SPIMASTER;

component i2s is
	generic( 	DATA    : integer := 48;
			RADDR    : integer := 12;
			address : std_ulogic_vector( 7 downto 0) := "00000011");
	
	Port (	clk : in std_ulogic;
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

component HSaqusition is
	generic( sram_addr_width : natural := 19; --Number of bits in SRAM addr bus
		 sram_data_width : natural := 18;
		 address : std_ulogic_vector( 7 downto 0 ) := "00000001"
		 );

	port (
		clk : in std_ulogic;
		rst : in std_ulogic;
		datain : in std_ulogic_vector( 7 downto 0);
		addr : in std_ulogic_vector( 7 downto 0);
		wr : in std_ulogic;
		rd : in std_ulogic;
		dataout : out std_ulogic_vector( 7 downto 0);
		sram_addr : out std_ulogic_vector( sram_addr_width-1 downto 0);
		sram_data : inout std_ulogic_vector( sram_data_width-1 downto 0);
		sram_wr : out std_ulogic;
		sram_ce : out std_ulogic;
		sram_oe : out std_ulogic;
		digital_in : in std_ulogic_vector( 7 downto 0);
		hs_adc_a : in std_ulogic_vector( 7 downto 0);
		hs_adc_b : in std_ulogic_vector( 7 downto 0);
		adc_clk_a : out std_ulogic;
		adc_clk_b : out std_ulogic;
		adc_pwd_d : out std_ulogic;
		hs_clock_2 : in std_ulogic;
		hs_clock_4 : in std_ulogic
		);
end component HSaqusition;



signal global_clk_4x, global_clk_4x_b, global_clk_2x, global_clk_fb, global_clk_90, gnd : std_ulogic;
signal spimspiclk, spimspidatain, spimspidataout, spimspics, spimRD, spimWR  : std_ulogic;
signal spimnrbyte : std_ulogic_vector(15 downto 0);
signal spimdataout, spimcommand, spimdatain0, spimdatain1, spimdatain2 : std_ulogic_vector(7 downto 0);
signal spimdatain3, spimdatain4, spimdatain5, spimdatain6, spimdatain7 : std_ulogic_vector(7 downto 0);


signal global_clk, global_rst, global_reset_n : std_ulogic; 


signal gpio : std_ulogic;
signal testo : std_ulogic_vector(2 downto 0);

signal hs_clock_out, ram_dcm_fb, ram_dcm_out, hs_clock_out_pol : std_ulogic;

signal SRAMA : std_ulogic_vector( 19-1 downto 0);	
signal SRAMD : std_ulogic_vector( 18-1 downto 0);	
signal notsramWE, SRAMCE, notsramOE, busyD, ASEL0 : std_ulogic;


begin

	-- DCM_SP: Digital Clock Manager
	-- Spartan-6
	-- Xilinx HDL Libraries Guide, version 12.4
	DCM_SP_inst_1 : DCM_SP
	generic map (
		CLKDV_DIVIDE => 2.0, -- CLKDV divide value
		-- (1.5,2,2.5,3,3.5,4,4.5,5,5.5,6,6.5,7,7.5,8,9,10,11,12,13,14,15,16).
		CLKFX_DIVIDE => 1, -- Divide value on CLKFX outputs - D - (1-32)
		CLKFX_MULTIPLY => 4, -- Multiply value on CLKFX outputs - M - (2-32)
		CLKIN_DIVIDE_BY_2 => FALSE, -- CLKIN divide by two (TRUE/FALSE)
		CLKIN_PERIOD => 20.0, -- Input clock period specified in nS
		CLKOUT_PHASE_SHIFT => "NONE", -- Output phase shift (NONE, FIXED, VARIABLE)
		CLK_FEEDBACK => "1X", -- Feedback source (NONE, 1X, 2X)
		DESKEW_ADJUST => "SYSTEM_SYNCHRONOUS", -- SYSTEM_SYNCHRNOUS or SOURCE_SYNCHRONOUS
		DFS_FREQUENCY_MODE => "LOW", -- Unsupported - Do not change value
		DLL_FREQUENCY_MODE => "LOW", -- Unsupported - Do not change value
		DSS_MODE => "NONE", -- Unsupported - Do not change value
		DUTY_CYCLE_CORRECTION => TRUE, -- Unsupported - Do not change value
		FACTORY_JF => X"c080", -- Unsupported - Do not change value
		PHASE_SHIFT => 0, -- Amount of fixed phase shift (-255 to 255)
		STARTUP_WAIT => FALSE -- Delay config DONE until DCM_SP LOCKED (TRUE/FALSE)
	)
	port map (
		CLK0 => global_clk_fb, -- 1-bit output 0 degree clock output
		CLK180 => open, -- 1-bit output 180 degree clock output
		CLK270 => open, -- 1-bit output 270 degree clock output
		CLK2X => global_clk_2x, -- 1-bit output 2X clock frequency clock output
		CLK2X180 => open, -- 1-bit output 2X clock frequency, 180 degree clock output
		CLK90 => global_clk_90, -- 1-bit output 90 degree clock output
		CLKDV => open, -- 1-bit output Divided clock output
		CLKFX => global_clk_4x, -- 1-bit output Digital Frequency Synthesizer output (DFS)
		CLKFX180 => open, -- 1-bit output 180 degree CLKFX output
		LOCKED => open, -- 1-bit output DCM_SP Lock Output
		PSDONE => open, -- 1-bit output Phase shift done output
		STATUS => open, -- 8-bit output DCM_SP status output
		CLKFB => global_clk_fb, -- 1-bit input Clock feedback input
		CLKIN => MSTCLK, -- 1-bit input Clock input
		DSSEN => gnd, -- 1-bit input Unsupported, specify to GND.
		PSCLK => gnd, -- 1-bit input Phase shift clock input
		PSEN => gnd, -- 1-bit input Phase shift enable
		PSINCDEC => open, -- 1-bit input Phase shift increment/decrement input
		RST =>  '0' -- 1-bit input Active high reset input
	);
	-- End of DCM_SP_inst instantiation
	

	SPIMASTER1: SPIMASTER port map(	spiclk => spimspiclk,
				clk => global_clk,
				rst => global_rst,
				spidatain => spimspidatain,
				spidataout => spimspidataout,
				spics => spimspics,
				nrbyte  => spimnrbyte,
				dataout => spimdataout,
				datain0 => spimdatain0,
				datain1 => spimdatain1,
				datain2 => spimdatain2,
				datain3 => spimdatain3,
				datain4 => spimdatain4,
				datain5 => spimdatain5,
				datain6 => spimdatain6,
				datain7 => spimdatain7,
				command => spimcommand,
				RD  => spimRD,
				WR   => spimWR );
				
			   
	S75595_1: s74595 port map( clk => global_clk,
				  rst => global_rst,
				  datain => spimdataout,
				  addr => spimcommand,
				  wr => spimWR,
				  busy => spimdatain4(0),
				  ser => GPSPIDATA,
				  rck => GPSPICS,
				  sck => GPSPICLK);
				  
	HSaqusition1: HSaqusition port map( clk => global_clk,
						rst => global_rst,
						datain => spimdataout,
						addr => spimcommand,
						wr => spimWR,
						rd => spimRD,
						dataout => spimdatain1,
						sram_addr => SRAMA,
						sram_data => SRAMD,
						sram_wr => notsramWE,
						sram_ce => SRAMCE,
						sram_oe => notsramOE,
						digital_in => LAD07,
						hs_adc_a => ADA,
						hs_adc_b => ADB,
						adc_clk_a => ADAC,
						adc_clk_b => ADBC,
						adc_pwd_d => ADAP,
						hs_clock_2 => global_clk_2x,
						hs_clock_4 => global_clk_4x_b
						);
	I2S1: i2s port map( 	clk	=> global_clk, 
				rst     => global_rst,
				datain  => spimdataout,
				dataout	=> spimdatain3, 
				addr	=> spimcommand, 
				wr      => spimWR,
				rd      => spimRD,
				busy    => busyD,
				sclk    => I2SSCLK,
				i2sdout => I2SDATAIN,
				i2sdin  => I2SDATAOUT,
				bck     => I2SBCK,
				lrck  	=> I2SLRCK,
				conf0	=> ASEL0,
				conf1	=> ASEL1);
				
	BUFG_inst_1 : BUFG
	port map (
		O => global_clk, -- 1-bit output Clock buffer output
		I => global_clk_fb -- 1-bit input Clock buffer input
	);
	--BUFG_inst_2 : BUFG
	--port map (
	--	O => global_rst, -- 1-bit output Clock buffer output
	--	I => USBGPIO1 -- 1-bit input Clock buffer input
	--);


	
	gnd <= '0';

	--Global Signal Assignments	
	global_rst <= USBGPIO1;
	global_reset_n <= not USBGPIO1;
	
	
	CMP_MEAS_SEL <= '0';
	CMPMEAS_EN <= '0';
	CMPMEAS_A <= '1';
	CMPMEAS_B <= '0';
	HFDAC_DI <=  '0';
	HFDAC_CS <= '0';
	HFDAC_CLK <= '0';
	AU_CSN <= '1';
	AU_CCLK <= '0';
	AU_CDTI <= '0';
	DC_CS <= '1';
	AUPDN <= '0';
		
	
	--global_clk <= MSTCLK;
	--SPI Signal assignments
	spimspiclk <= USBSK;
	spimspics <= USBCS;
	spimspidatain <= USBDO;
	USBDI <= spimspidataout;
	
	
	-- I 2 C data frame
	--|---------|--------|-------|
	--| CNT     | ADDR   | DATA  |
	--|---------|--------|-------|
	
	-- CNT format, bit, 0x01=STATUS, 0x02=START, 0x04=STOP

	
	USBGPIO0 <= gpio;
	
	
	
	
	-- Test connections
	testL: process (global_clk, global_rst) is

	begin
	if global_rst = '1' then
		testo <= "000";
	elsif rising_edge(global_clk) then
		if spimRD = '1' then
			if testo = "000" then
				testo <= "001";
				spimdatain2 <= "01001111";
			elsif testo = "001" then
				testo <= "010";
				spimdatain2 <= "00001111";
			elsif testo = "010" then
				testo <= "011";
				spimdatain2 <= "10001111";
			elsif testo = "011" then
				testo <= "100";
				spimdatain2 <= "00001110";
			elsif testo = "100" then
				testo <= "101";
				spimdatain2 <= "00001111";
			elsif testo = "101" then
				testo <= "110";
				spimdatain2 <= "00001101";
			elsif testo = "110" then
				testo <= "111";
				spimdatain2 <= "00011111";
			elsif testo = "111" then
				testo <= "000";
				spimdatain2 <= "01001011";
			end if;
		end if;
	end if;
	end process testL;
	
	
	--DigiOut: process (global_clk, global_rst) is

	--begin
	--if global_rst = '1' then
	--	LAD815(7 downto 1) <= "1110101";
	--elsif rising_edge(global_clk) then
	--	if spimWR = '1'  and spimcommand(2 downto 0) = "101" then
	--		LAD815( 7 downto 1) <= spimdataout( 6 downto 0);
	--	end if;
	--end if;
	--end process DigiOut;

	LAD815 <= "10101100";
	spimdatain5 <= "10100001";
	spimdatain7 <= "01010010";
	



	
	BUFG_inst_2 : BUFG
	port map (
		O => global_clk_4x_b, -- 1-bit output Clock buffer output
		I => global_clk_4x -- 1-bit input Clock buffer input
	);


	
	
end Behavioral;

