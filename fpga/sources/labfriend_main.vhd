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
    generic(
		 ram_addr_width : natural := 30; --Number of bits in SRAM addr bus
		 ram_data_width : natural := 32;
		 ram_depth : natural := 19;
	    C3_P0_MASK_SIZE           : integer := 4;
            C3_P0_DATA_PORT_SIZE      : integer := 32;
            C3_P1_MASK_SIZE           : integer := 4;
            C3_P1_DATA_PORT_SIZE      : integer := 32;
            C3_MEMCLK_PERIOD          : integer := 3000;
            C3_RST_ACT_LOW            : integer := 0;
            C3_INPUT_CLK_TYPE         : string := "DIFFERENTIAL";
            C3_CALIB_SOFT_IP          : string := "TRUE";
            C3_SIMULATION             : string := "FALSE";
            DEBUG_EN                  : integer := 0;
            C3_MEM_ADDR_ORDER         : string := "ROW_BANK_COLUMN";
            C3_NUM_DQ_PINS            : integer := 8;
            C3_MEM_ADDR_WIDTH         : integer := 14;
            C3_MEM_BANKADDR_WIDTH     : integer := 3
          );
    Port ( LAD07 : in  STD_LOGIC_VECTOR (7 downto 0);
           LAD815 : out  STD_LOGIC_VECTOR (7 downto 0);
           I2SSCLK : out  STD_LOGIC;
           I2SDATAIN : out  STD_LOGIC;
           I2SDATAOUT : in  STD_LOGIC;
           I2SBCK : out  STD_LOGIC;
           I2SLRCK : out  STD_LOGIC;
           MSTCLK : in  STD_LOGIC;
           GPSPICS : out  STD_LOGIC;
           GPSPIDATA : out  STD_LOGIC;
           GPSPICLK : out  STD_LOGIC;
           USBGPIO0 : out  STD_LOGIC;
           USBGPIO1 : in  STD_LOGIC;
           USBCS : in  STD_LOGIC;
           USBSK : in  STD_LOGIC;
           USBDO : in  STD_LOGIC;
           USBDI : out  STD_LOGIC;
           ADA : in  STD_LOGIC_VECTOR (7 downto 0);
           ADB : in  STD_LOGIC_VECTOR (7 downto 0);
           ADAC : out  STD_LOGIC;
           ADBC : out  STD_LOGIC;
           ADAP : out  STD_LOGIC;
	   CMP_MEAS_SEL : out STD_LOGIC;
	   CMPMEAS_EN : out STD_LOGIC;
	   CMPMEAS_A : out STD_LOGIC;
	   CMPMEAS_B : out STD_LOGIC;
	   HFDAC_DI : out STD_LOGIC;
	   HFDAC_CS : out STD_LOGIC;
	   HFDAC_CLK : out STD_LOGIC;
	   AU_CSN : out STD_LOGIC;
	   AU_CCLK : out STD_LOGIC;
	   AU_CDTI : out STD_LOGIC;
	   DC_CS : OUT STD_LOGIC;
	   DC_DOUT : in STD_LOGIC;
	   AUPDN : out STD_LOGIC;
	   AU_OVFL : in STD_LOGIC;
	   AU_OVFR : in STD_LOGIC;
	   PWMOFFS0 : out std_logic;
	   PWMOFFS1 : out std_logic;
	   PWMEXVO : out std_logic;
	   PWMLAVIO : out std_logic;
	   PWMLA : out std_logic;
	   LADVREF : out std_logic; 
	   mcb3_dram_dq                            : inout  std_logic_vector(C3_NUM_DQ_PINS-1 downto 0);
	   mcb3_dram_a                             : out std_logic_vector(C3_MEM_ADDR_WIDTH-1 downto 0);
	   mcb3_dram_ba                            : out std_logic_vector(C3_MEM_BANKADDR_WIDTH-1 downto 0);
	   mcb3_dram_ras_n                         : out std_logic;
	   mcb3_dram_cas_n                         : out std_logic;
	   mcb3_dram_we_n                          : out std_logic;
	   mcb3_dram_odt                           : out std_logic;
	   mcb3_dram_reset_n                       : out std_logic;
	   mcb3_dram_cke                           : out std_logic;
	   mcb3_dram_dm                            : out std_logic;
	   mcb3_rzq                                : inout  std_logic;
	   mcb3_dram_dqs                           : inout  std_logic;
	   mcb3_dram_dqs_n                         : inout  std_logic;
	   mcb3_dram_ck                            : out std_logic;
	   mcb3_dram_ck_n                          : out std_logic
	   );
end LabFriend;





architecture Behavioral of LabFriend is
component SPIMASTER is
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
end component SPIMASTER;

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

component i2s is
	generic( 	DATA    : integer := 48;
			RADDR    : integer := 12;
			address : std_logic_vector( 7 downto 0) := "00000011");
	
	Port (	clk : in std_logic;
		rst : in std_logic;
		datain : in std_logic_vector( 7 downto 0);
		dataout : out std_logic_vector( 7 downto 0);
		addr : in std_logic_vector( 7 downto 0);
		wr : in std_logic;
		rd : in std_logic;
		busy : out std_logic;
		sclk : out std_logic;
		i2sdout :  out std_logic;
		i2sdin : in std_logic;
		bck :  out std_logic;
		lrck : out std_logic;
		conf0 : out std_logic;
		conf1 : out std_logic);
end component i2s;

component s74595 is
	generic( nr_of_bits : natural := 16 ;
	         frequency_div : natural := 5000;
	         frequency_div_half : natural := 2500;
	         address : std_logic_vector( 7 downto 0) := "00000100");
	
	port (
		clk : in std_logic;
		rst : in std_logic;
		datain : in std_logic_vector( 7 downto 0);
		addr : in std_logic_vector( 7 downto 0);
		wr : in std_logic;
		busy : out std_logic;
		ser : out std_logic;
		rck :  out std_logic;
		sck : out std_logic);
end component s74595;

component HSaqusition is
	generic( ram_addr_width : natural := 30; --Number of bits in SRAM addr bus
		 ram_data_width : natural := 32;
		 ram_depth : natural := 19;
		 address : std_logic_vector( 7 downto 0 ) := "00000001"
		 );

	port (
		clk : in std_logic;
		rst : in std_logic;
		datain : in std_logic_vector( 7 downto 0);
		addr : in std_logic_vector( 7 downto 0);
		wr : in std_logic;
		rd : in std_logic;
		dataout : out std_logic_vector( 7 downto 0);
		ram_addr : out std_logic_vector( ram_addr_width-1 downto 0);
		ram_data_write : out std_logic_vector( ram_data_width-1 downto 0);
		ram_wr_en : out std_logic;
		ram_rd_en : out std_logic;
		ram_rd_empty : in std_logic;
		ram_cmd_en : out std_logic;
		ram_data_read : in std_logic_vector( ram_data_width-1 downto 0);
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
		hs_clock_4 : in std_logic;
		debug_out1 : out std_logic
		);
end component HSaqusition;

component ddr3memory
 generic(
    C3_P0_MASK_SIZE           : integer := 4;
    C3_P0_DATA_PORT_SIZE      : integer := 32;
    C3_P1_MASK_SIZE           : integer := 4;
    C3_P1_DATA_PORT_SIZE      : integer := 32;
    C3_MEMCLK_PERIOD          : integer := 3000;
    C3_RST_ACT_LOW            : integer := 0;
    C3_INPUT_CLK_TYPE         : string := "DIFFERENTIAL";
    C3_CALIB_SOFT_IP          : string := "TRUE";
    C3_SIMULATION             : string := "FALSE";
    DEBUG_EN                  : integer := 0;
    C3_MEM_ADDR_ORDER         : string := "ROW_BANK_COLUMN";
    C3_NUM_DQ_PINS            : integer := 8;
    C3_MEM_ADDR_WIDTH         : integer := 14;
    C3_MEM_BANKADDR_WIDTH     : integer := 3
);
   port (
   mcb3_dram_dq                            : inout  std_logic_vector(C3_NUM_DQ_PINS-1 downto 0);
   mcb3_dram_a                             : out std_logic_vector(C3_MEM_ADDR_WIDTH-1 downto 0);
   mcb3_dram_ba                            : out std_logic_vector(C3_MEM_BANKADDR_WIDTH-1 downto 0);
   mcb3_dram_ras_n                         : out std_logic;
   mcb3_dram_cas_n                         : out std_logic;
   mcb3_dram_we_n                          : out std_logic;
   mcb3_dram_odt                           : out std_logic;
   mcb3_dram_reset_n                       : out std_logic;
   mcb3_dram_cke                           : out std_logic;
   mcb3_dram_dm                            : out std_logic;
   mcb3_rzq                                : inout  std_logic;
   c3_sys_clk_p                            : in  std_logic;
   c3_sys_clk_n                            : in  std_logic;
   c3_sys_rst_i                            : in  std_logic;
   c3_calib_done                           : out std_logic;
   c3_clk0                                 : out std_logic;
   c3_rst0                                 : out std_logic;
   mcb3_dram_dqs                           : inout  std_logic;
   mcb3_dram_dqs_n                         : inout  std_logic;
   mcb3_dram_ck                            : out std_logic;
   mcb3_dram_ck_n                          : out std_logic;
   c3_p0_cmd_clk                           : in std_logic;
   c3_p0_cmd_en                            : in std_logic;
   c3_p0_cmd_instr                         : in std_logic_vector(2 downto 0);
   c3_p0_cmd_bl                            : in std_logic_vector(5 downto 0);
   c3_p0_cmd_byte_addr                     : in std_logic_vector(29 downto 0);
   c3_p0_cmd_empty                         : out std_logic;
   c3_p0_cmd_full                          : out std_logic;
   c3_p0_wr_clk                            : in std_logic;
   c3_p0_wr_en                             : in std_logic;
   c3_p0_wr_mask                           : in std_logic_vector(C3_P0_MASK_SIZE - 1 downto 0);
   c3_p0_wr_data                           : in std_logic_vector(C3_P0_DATA_PORT_SIZE - 1 downto 0);
   c3_p0_wr_full                           : out std_logic;
   c3_p0_wr_empty                          : out std_logic;
   c3_p0_wr_count                          : out std_logic_vector(6 downto 0);
   c3_p0_wr_underrun                       : out std_logic;
   c3_p0_wr_error                          : out std_logic;
   c3_p0_rd_clk                            : in std_logic;
   c3_p0_rd_en                             : in std_logic;
   c3_p0_rd_data                           : out std_logic_vector(C3_P0_DATA_PORT_SIZE - 1 downto 0);
   c3_p0_rd_full                           : out std_logic;
   c3_p0_rd_empty                          : out std_logic;
   c3_p0_rd_count                          : out std_logic_vector(6 downto 0);
   c3_p0_rd_overflow                       : out std_logic;
   c3_p0_rd_error                          : out std_logic;
   c3_p1_cmd_clk                           : in std_logic;
   c3_p1_cmd_en                            : in std_logic;
   c3_p1_cmd_instr                         : in std_logic_vector(2 downto 0);
   c3_p1_cmd_bl                            : in std_logic_vector(5 downto 0);
   c3_p1_cmd_byte_addr                     : in std_logic_vector(29 downto 0);
   c3_p1_cmd_empty                         : out std_logic;
   c3_p1_cmd_full                          : out std_logic;
   c3_p1_wr_clk                            : in std_logic;
   c3_p1_wr_en                             : in std_logic;
   c3_p1_wr_mask                           : in std_logic_vector(C3_P1_MASK_SIZE - 1 downto 0);
   c3_p1_wr_data                           : in std_logic_vector(C3_P1_DATA_PORT_SIZE - 1 downto 0);
   c3_p1_wr_full                           : out std_logic;
   c3_p1_wr_empty                          : out std_logic;
   c3_p1_wr_count                          : out std_logic_vector(6 downto 0);
   c3_p1_wr_underrun                       : out std_logic;
   c3_p1_wr_error                          : out std_logic;
   c3_p1_rd_clk                            : in std_logic;
   c3_p1_rd_en                             : in std_logic;
   c3_p1_rd_data                           : out std_logic_vector(C3_P1_DATA_PORT_SIZE - 1 downto 0);
   c3_p1_rd_full                           : out std_logic;
   c3_p1_rd_empty                          : out std_logic;
   c3_p1_rd_count                          : out std_logic_vector(6 downto 0);
   c3_p1_rd_overflow                       : out std_logic;
   c3_p1_rd_error                          : out std_logic;
   c3_p2_cmd_clk                           : in std_logic;
   c3_p2_cmd_en                            : in std_logic;
   c3_p2_cmd_instr                         : in std_logic_vector(2 downto 0);
   c3_p2_cmd_bl                            : in std_logic_vector(5 downto 0);
   c3_p2_cmd_byte_addr                     : in std_logic_vector(29 downto 0);
   c3_p2_cmd_empty                         : out std_logic;
   c3_p2_cmd_full                          : out std_logic;
   c3_p2_wr_clk                            : in std_logic;
   c3_p2_wr_en                             : in std_logic;
   c3_p2_wr_mask                           : in std_logic_vector(3 downto 0);
   c3_p2_wr_data                           : in std_logic_vector(31 downto 0);
   c3_p2_wr_full                           : out std_logic;
   c3_p2_wr_empty                          : out std_logic;
   c3_p2_wr_count                          : out std_logic_vector(6 downto 0);
   c3_p2_wr_underrun                       : out std_logic;
   c3_p2_wr_error                          : out std_logic;
   c3_p2_rd_clk                            : in std_logic;
   c3_p2_rd_en                             : in std_logic;
   c3_p2_rd_data                           : out std_logic_vector(31 downto 0);
   c3_p2_rd_full                           : out std_logic;
   c3_p2_rd_empty                          : out std_logic;
   c3_p2_rd_count                          : out std_logic_vector(6 downto 0);
   c3_p2_rd_overflow                       : out std_logic;
   c3_p2_rd_error                          : out std_logic;
   c3_p3_cmd_clk                           : in std_logic;
   c3_p3_cmd_en                            : in std_logic;
   c3_p3_cmd_instr                         : in std_logic_vector(2 downto 0);
   c3_p3_cmd_bl                            : in std_logic_vector(5 downto 0);
   c3_p3_cmd_byte_addr                     : in std_logic_vector(29 downto 0);
   c3_p3_cmd_empty                         : out std_logic;
   c3_p3_cmd_full                          : out std_logic;
   c3_p3_wr_clk                            : in std_logic;
   c3_p3_wr_en                             : in std_logic;
   c3_p3_wr_mask                           : in std_logic_vector(3 downto 0);
   c3_p3_wr_data                           : in std_logic_vector(31 downto 0);
   c3_p3_wr_full                           : out std_logic;
   c3_p3_wr_empty                          : out std_logic;
   c3_p3_wr_count                          : out std_logic_vector(6 downto 0);
   c3_p3_wr_underrun                       : out std_logic;
   c3_p3_wr_error                          : out std_logic;
   c3_p3_rd_clk                            : in std_logic;
   c3_p3_rd_en                             : in std_logic;
   c3_p3_rd_data                           : out std_logic_vector(31 downto 0);
   c3_p3_rd_full                           : out std_logic;
   c3_p3_rd_empty                          : out std_logic;
   c3_p3_rd_count                          : out std_logic_vector(6 downto 0);
   c3_p3_rd_overflow                       : out std_logic;
   c3_p3_rd_error                          : out std_logic
);
end component;

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
end component;



signal global_clk_4x, global_clk_4x_180, global_clk_4x_b, global_clk_4x_180_b, global_clk_2x, global_clk_fb, global_clk_90, gnd : std_logic;
signal memclk_0, memclk_180, memclk_0_b, memclk_180_b : std_logic;
signal spimspiclk, spimspidatain, spimspidataout, spimspics, spimRD, spimWR  : std_logic;
signal spimnrbyte : std_logic_vector(15 downto 0);
signal spimdataout, spimcommand, spimdatain0, spimdatain1, spimdatain2 : std_logic_vector(7 downto 0);
signal spimdatain3, spimdatain4, spimdatain5, spimdatain6, spimdatain7 : std_logic_vector(7 downto 0);


signal global_clk, global_rst, global_reset_n : std_logic; 


signal gpio : std_logic;
signal testo : std_logic_vector(2 downto 0);

signal hs_clock_out, ram_dcm_fb, ram_dcm_out, hs_clock_out_pol : std_logic;

signal SRAMA : std_logic_vector( 19-1 downto 0);	
signal SRAMD : std_logic_vector( 18-1 downto 0);	
signal notsramWE, SRAMCE, notsramOE, busyD, ASEL0, ASEL1 : std_logic;

signal cmd_instr_g, c3_p0_cmd_instr : std_logic_vector(2 downto 0);
signal cmd_bl_g, c3_p0_cmd_bl : std_logic_vector(5 downto 0);
signal cmd_byte_addr_g, c3_p0_cmd_byte_addr : std_logic_vector(29 downto 0);
signal wr_mask_g : std_logic_vector(C3_P1_MASK_SIZE - 1 downto 0);
signal wr_data_g, c3_p0_rd_data, c3_p0_wr_data : std_logic_vector(C3_P1_DATA_PORT_SIZE - 1 downto 0);
signal c3_p0_cmd_en, c3_p0_rd_en, c3_p0_wr_en : std_logic;
signal resetCounter : unsigned(5 downto 0) := "000000";
signal quili : unsigned(7 downto 0) := "00000000";
signal testtCounterA, testtCounterB,  testtCounterC : unsigned(7 downto 0) := "00000000";
signal c3_p0_wr_count, c3_p0_rd_count : std_logic_vector(6 downto 0);
signal c3_p0_cmd_empty, c3_p0_cmd_full, c3_p0_wr_full, c3_p0_wr_empty, c3_p0_wr_underrun, c3_p0_wr_error : std_logic;
signal c3_p0_rd_full, c3_p0_rd_empty, c3_p0_rd_overflow, c3_p0_rd_error, c3_calib_done : std_logic;
signal user_clock_ddr, ddrclk_fb : std_logic;

signal ram_addr : std_logic_vector( ram_addr_width-1 downto 0);
signal ram_data_write : std_logic_vector( ram_data_width-1 downto 0);
signal ram_wr_en : std_logic;
signal ram_rd_en : std_logic;
signal ram_rd_empty : std_logic;
signal ram_cmd_en : std_logic;
signal ram_data_read : std_logic_vector( ram_data_width-1 downto 0);
signal ram_command : std_logic_vector(2 downto 0);
signal ram_bl : std_logic_vector(5 downto 0);
signal ram_clock : std_logic;

signal tmp4bit : std_logic_vector(3 downto 0) := "0000";

signal quack, wonder : std_logic_vector(7 downto 0);
begin
	cmd_instr_g <= (others => '0');
	cmd_bl_g <= (others => '0');
	cmd_byte_addr_g <= (others  => '0');
	wr_mask_g <= (others  => '0');
	wr_data_g <= (others  => '0');
	
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
		CLKFX180 => global_clk_4x_180, -- 1-bit output 180 degree CLKFX output
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
	
	DCM_SP_inst_2 : DCM_SP
	generic map (
		CLKDV_DIVIDE => 2.0, -- CLKDV divide value
		-- (1.5,2,2.5,3,3.5,4,4.5,5,5.5,6,6.5,7,7.5,8,9,10,11,12,13,14,15,16).
		CLKFX_DIVIDE => 3, -- Divide value on CLKFX outputs - D - (1-32)
		CLKFX_MULTIPLY => 5, -- Multiply value on CLKFX outputs - M - (2-32)
		CLKIN_DIVIDE_BY_2 => FALSE, -- CLKIN divide by two (TRUE/FALSE)
		CLKIN_PERIOD => 10.0, -- Input clock period specified in nS
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
		CLK0 => ddrclk_fb, -- 1-bit output 0 degree clock output
		CLK180 => open, -- 1-bit output 180 degree clock output
		CLK270 => open, -- 1-bit output 270 degree clock output
		CLK2X => open, -- 1-bit output 2X clock frequency clock output
		CLK2X180 => open, -- 1-bit output 2X clock frequency, 180 degree clock output
		CLK90 => open, -- 1-bit output 90 degree clock output
		CLKDV => open, -- 1-bit output Divided clock output
		CLKFX => memclk_0, -- 1-bit output Digital Frequency Synthesizer output (DFS)
		CLKFX180 => memclk_180, -- 1-bit output 180 degree CLKFX output
		LOCKED => open, -- 1-bit output DCM_SP Lock Output
		PSDONE => open, -- 1-bit output Phase shift done output
		STATUS => open, -- 8-bit output DCM_SP status output
		CLKFB => ddrclk_fb, -- 1-bit input Clock feedback input
		CLKIN => global_clk_4x, -- 1-bit input Clock input
		DSSEN => gnd, -- 1-bit input Unsupported, specify to GND.
		PSCLK => gnd, -- 1-bit input Phase shift clock input
		PSEN => gnd, -- 1-bit input Phase shift enable
		PSINCDEC => open, -- 1-bit input Phase shift increment/decrement input
		RST =>  '0' -- 1-bit input Active high reset input
	);
	

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
				
	spi_1 : spi port map (	clk => global_clk,
				rst => global_rst,
				datain => spimdataout,
				dataout => spimdatain2,
				addr => spimcommand,
				wr  => spimWR,
				rd  => spimRD,
				busy => open,
				cs1 => AU_CSN,
				cs2 => DC_CS,
				sdo => AU_CDTI, 
				sdi => DC_DOUT,
				sck => AU_CCLK); 
				
	S75595_1: s74595 port map( clk => global_clk,
				  rst => global_rst,
				  datain => spimdataout,
				  addr => spimcommand,
				  wr => spimWR,
				  busy => spimdatain4(0),
				  ser => GPSPIDATA,
				  rck => GPSPICS,
				  sck => GPSPICLK);
				  
	HSaqusition1: HSaqusition port map( 	clk => global_clk,
						rst => global_rst,
						datain => spimdataout,
						addr => spimcommand,
						wr => spimWR,
						rd => spimRD,
						dataout => spimdatain1,
						ram_addr                =>  ram_addr ,     
						ram_data_write          =>  ram_data_write,
						ram_wr_en               =>  ram_wr_en,     
						ram_rd_en               =>  ram_rd_en ,    
						ram_rd_empty            =>  ram_rd_empty,  
						ram_cmd_en              =>  ram_cmd_en,    
						ram_data_read           =>  ram_data_read, 
						ram_command             =>  ram_command ,              
						ram_bl                  =>  ram_bl   ,
						ram_clock =>     ram_clock ,
						digital_in => LAD07,
						hs_adc_a => ADA,
						hs_adc_b => ADB,
						adc_clk_a => ADAC,
						adc_clk_b => ADBC,
						adc_pwd_d => ADAP,
						hs_clock_2 => global_clk_2x,
						hs_clock_4 => global_clk_4x_b,
						debug_out1 => open
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
				conf0	=> AUPDN,
				conf1	=> CMP_MEAS_SEL);
				
	PWM1: pwm port map(	
				clk  	 =>  global_clk, 
				datain   =>  spimdataout,
				addr     =>  spimcommand,
				wr       =>  spimWR,
				pwmlavio =>  PWMLAVIO,
				pwmla    =>  PWMLA,
				pwmexvo  =>  PWMEXVO,
				pwmoffs0 =>  PWMOFFS0,
				pwmoffs1 =>  PWMOFFS1, 
				ladvref  =>  LADVREF
				);
			
				
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
u_ddr3memory : ddr3memory
    generic map (
    C3_P0_MASK_SIZE => C3_P0_MASK_SIZE,
    C3_P0_DATA_PORT_SIZE => C3_P0_DATA_PORT_SIZE,
    C3_P1_MASK_SIZE => C3_P1_MASK_SIZE,
    C3_P1_DATA_PORT_SIZE => C3_P1_DATA_PORT_SIZE,
    C3_MEMCLK_PERIOD => C3_MEMCLK_PERIOD,
    C3_RST_ACT_LOW => C3_RST_ACT_LOW,
    C3_INPUT_CLK_TYPE => C3_INPUT_CLK_TYPE,
    C3_CALIB_SOFT_IP => C3_CALIB_SOFT_IP,
    C3_SIMULATION => C3_SIMULATION,
    DEBUG_EN => DEBUG_EN,
    C3_MEM_ADDR_ORDER => C3_MEM_ADDR_ORDER,
    C3_NUM_DQ_PINS => C3_NUM_DQ_PINS,
    C3_MEM_ADDR_WIDTH => C3_MEM_ADDR_WIDTH,
    C3_MEM_BANKADDR_WIDTH => C3_MEM_BANKADDR_WIDTH
)
port map (
   c3_sys_clk_p  =>         memclk_0_b,
   c3_sys_clk_n    =>       memclk_180,
   c3_sys_rst_i    =>       global_rst,                        
   mcb3_dram_dq       =>    mcb3_dram_dq,  
   mcb3_dram_a        =>    mcb3_dram_a,  
   mcb3_dram_ba       =>    mcb3_dram_ba,
   mcb3_dram_ras_n    =>    mcb3_dram_ras_n,                        
   mcb3_dram_cas_n    =>    mcb3_dram_cas_n,                        
   mcb3_dram_we_n     =>    mcb3_dram_we_n,                          
   mcb3_dram_odt    =>      mcb3_dram_odt,
   mcb3_dram_cke      =>    mcb3_dram_cke,                          
   mcb3_dram_ck       =>    mcb3_dram_ck,                          
   mcb3_dram_ck_n     =>    mcb3_dram_ck_n,       
   mcb3_dram_dqs      =>    mcb3_dram_dqs,                          
   mcb3_dram_dqs_n    =>    mcb3_dram_dqs_n,
   mcb3_dram_reset_n =>     mcb3_dram_reset_n, 
   mcb3_dram_dm  =>       mcb3_dram_dm,
   c3_clk0	=>	        user_clock_ddr,
   c3_rst0		=>        open,	
   c3_calib_done      =>    c3_calib_done,
   mcb3_rzq         =>            mcb3_rzq,       
   c3_p0_cmd_clk                           =>  ram_clock,
   c3_p0_cmd_en                            =>  ram_cmd_en,
   c3_p0_cmd_instr                         =>  ram_command,
   c3_p0_cmd_bl                            =>  ram_bl,
   c3_p0_cmd_byte_addr                     =>  ram_addr,
   c3_p0_cmd_empty                         =>  c3_p0_cmd_empty,
   c3_p0_cmd_full                          =>  open,
   c3_p0_wr_clk                            =>  ram_clock,
   c3_p0_wr_en                             =>  ram_wr_en,
   c3_p0_wr_mask                           =>  wr_mask_g,
   c3_p0_wr_data                           =>  ram_data_write,
   c3_p0_wr_full                           =>  c3_p0_wr_full,
   c3_p0_wr_empty                          =>  c3_p0_wr_empty ,
   c3_p0_wr_count                          =>  c3_p0_wr_count,
   c3_p0_wr_underrun                       =>  c3_p0_wr_underrun,
   c3_p0_wr_error                          =>  c3_p0_wr_error,
   c3_p0_rd_clk                            =>  ram_clock,
   c3_p0_rd_en                             =>  ram_rd_en,
   c3_p0_rd_data                           =>  ram_data_read,
   c3_p0_rd_full                           =>  c3_p0_rd_full,
   c3_p0_rd_empty                          =>  ram_rd_empty,
   c3_p0_rd_count       		   =>  c3_p0_rd_count ,
   c3_p0_rd_overflow                       =>  c3_p0_rd_overflow,
   c3_p0_rd_error                          =>  c3_p0_rd_error,
   c3_p1_cmd_clk                           =>  ram_clock,
   c3_p1_cmd_en                            =>  gnd,
   c3_p1_cmd_instr                         =>  cmd_instr_g,
   c3_p1_cmd_bl                            =>  cmd_bl_g,
   c3_p1_cmd_byte_addr                     =>  cmd_byte_addr_g,
   c3_p1_cmd_empty                         =>  open,
   c3_p1_cmd_full                          =>  open,
   c3_p1_wr_clk                            =>  ram_clock,
   c3_p1_wr_en                             =>  gnd,
   c3_p1_wr_mask                           =>  wr_mask_g,
   c3_p1_wr_data                           =>  wr_data_g,
   c3_p1_wr_full                           =>  open,
   c3_p1_wr_empty                          =>  open,
   c3_p1_wr_count                          =>  open,
   c3_p1_wr_underrun                       =>  open,
   c3_p1_wr_error                          =>  open,
   c3_p1_rd_clk                            =>  ram_clock,
   c3_p1_rd_en                             =>  gnd,
   c3_p1_rd_data                           =>  open,
   c3_p1_rd_full                           =>  open,
   c3_p1_rd_empty                          =>  open,
   c3_p1_rd_count                          =>  open,
   c3_p1_rd_overflow                       =>  open,
   c3_p1_rd_error                          =>  open,
   c3_p2_cmd_clk                           =>  ram_clock,
   c3_p2_cmd_en                            =>  gnd,
   c3_p2_cmd_instr                         =>  cmd_instr_g,
   c3_p2_cmd_bl                            =>  cmd_bl_g,
   c3_p2_cmd_byte_addr                     =>  cmd_byte_addr_g,
   c3_p2_cmd_empty                         =>  open,
   c3_p2_cmd_full                          =>  open,
   c3_p2_wr_clk                            =>  ram_clock,
   c3_p2_wr_en                             =>  gnd,
   c3_p2_wr_mask                           =>  wr_mask_g,
   c3_p2_wr_data                           =>  wr_data_g,
   c3_p2_wr_full                           =>  open,
   c3_p2_wr_empty                          =>  open,
   c3_p2_wr_count                          =>  open,
   c3_p2_wr_underrun                       =>  open,
   c3_p2_wr_error                          =>  open,
   c3_p2_rd_clk                            =>  ram_clock,
   c3_p2_rd_en                             =>  gnd,
   c3_p2_rd_data                           =>  open,
   c3_p2_rd_full                           =>  open,
   c3_p2_rd_empty                          =>  open,
   c3_p2_rd_count                          =>  open,
   c3_p2_rd_overflow                       =>  open,
   c3_p2_rd_error                          =>  open,
   c3_p3_cmd_clk                           =>  global_clk,
   c3_p3_cmd_en                            =>  gnd,
   c3_p3_cmd_instr                         =>  cmd_instr_g,
   c3_p3_cmd_bl                            =>  cmd_bl_g,
   c3_p3_cmd_byte_addr                     =>  cmd_byte_addr_g,
   c3_p3_cmd_empty                         =>  open,
   c3_p3_cmd_full                          =>  open,
   c3_p3_wr_clk                            =>  global_clk,
   c3_p3_wr_en                             =>  gnd,
   c3_p3_wr_mask                           =>  wr_mask_g,
   c3_p3_wr_data                           =>  wr_data_g,
   c3_p3_wr_full                           =>  open,
   c3_p3_wr_empty                          =>  open,
   c3_p3_wr_count                          =>  open,
   c3_p3_wr_underrun                       =>  open,
   c3_p3_wr_error                          =>  open,
   c3_p3_rd_clk                            =>  global_clk,
   c3_p3_rd_en                             =>  gnd,
   c3_p3_rd_data                           =>  open,
   c3_p3_rd_full                           =>  open,
   c3_p3_rd_empty                          =>  open,
   c3_p3_rd_count                          =>  open,
   c3_p3_rd_overflow                       =>  open,
   c3_p3_rd_error                          =>  open
);
	
	--spimdatain6 <= "01011010";

	
	gnd <= '0';

	--Global Signal Assignments	
	
	
	CMPMEAS_EN <= '0';
	CMPMEAS_A <= '1';
	CMPMEAS_B <= '0';
	HFDAC_DI <=  '0';
	HFDAC_CS <= '0';
	HFDAC_CLK <= '0';

		
	
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
	
	por : process(global_clk)
	begin
		if rising_edge(global_clk) then
			if resetCounter < 63 then
				global_rst <= '1';
				resetCounter <= resetCounter + 1;
				--LAD815(6) <= '0';
			else
				global_rst <= '0';
			end if;
			
			--if spimRD = '1' and spimcommand(2 downto 0) = "001" then
			--	LAD815(6) <= '1';
			--end if;
		end if;
	end process por;
	

	testc : process(ram_clock)
	begin
		if rising_edge(ram_clock) then
			testtCounterA <= testtCounterA + 1;
			testtCounterB <= testtCounterB + 2;
			--testtCounterC <= testtCounterC + 3;
			if ram_rd_en = '1' then
				tmp4bit(1) <= not tmp4bit(1);
				tmp4bit(0) <= '1';
			end if;
			if ram_wr_en = '1' then
				tmp4bit(3) <= not tmp4bit(3);
				tmp4bit(2) <= '1';
			end if;
			
		end if;
	end process testc;
	LAD815(7) <= tmp4bit(1);
	LAD815(5) <= tmp4bit(3);
	LAD815(4) <= tmp4bit(2);
	LAD815(6) <= tmp4bit(0);
	
	global_reset_n <= not global_rst;
	

	
	--LAD815 <= "01010101"
	
	
	
	
	LAD815(0) <= ram_rd_empty;
	LAD815(1) <= c3_p0_wr_full;
	LAD815(2) <= c3_p0_wr_empty;
	LAD815(3) <= c3_p0_wr_underrun;
	--LAD815(7 downto 4) <= "1111";
	
	
	
	
	
	
	--LAD815(7 downto 1) <= std_logic_vector(ddrclktestcounter(7 downto 1));
	
	
	DigiOut: process (global_clk, global_rst) is

	begin
	if global_rst = '1' then
--		LAD815 <= "11101010";
		wonder <= "00000000";
	elsif rising_edge(global_clk) then
		if spimWR = '1'  and spimcommand(2 downto 0) = "101" then
--			LAD815 <= spimdataout;
			wonder <= spimdataout;
		end if;
	end if;
	end process DigiOut;

	--LAD815 <= "10101100";
	--spimdatain5 <= "10100001";
	--spimdatain7 <= "01010010";
	



	
	BUFG_inst_2 : BUFG
	port map (
		O => global_clk_4x_b, -- 1-bit output Clock buffer output
		I => global_clk_4x -- 1-bit input Clock buffer input
	);
	
	buffer1 : BUFG
	port map (
		O => memclk_0_b,
		I => memclk_0
	);
	




	
	
end Behavioral;

