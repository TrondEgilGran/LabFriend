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
    Port ( LAD07 : in  STD_ULOGIC_VECTOR (7 downto 0);
           LAD815 : out  STD_ULOGIC_VECTOR (7 downto 0);
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
	   AU_OVFR : in STD_ULOGIC;
	   PWMOFFS0 : out std_ulogic;
	   PWMOFFS1 : out std_ulogic;
	   PWMEXVO : out std_ulogic;
	   PWMLAVIO : out std_ulogic;
	   PWMLA : out std_ulogic;
	   LADVREF : out std_ulogic; 
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
	         address : std_ulogic_vector( 7 downto 0) := "00000000");
	
	port (
		clk : in std_ulogic;
		datain : in std_ulogic_vector( 7 downto 0);
		addr : in std_ulogic_vector( 7 downto 0);
		wr : in std_ulogic;
		pwmlavio : out std_ulogic;
		pwmla :  out std_ulogic;
		pwmexvo : out std_ulogic;
		pwmoffs0 : out std_ulogic;
		pwmoffs1 : out std_ulogic;
		ladvref : out std_ulogic
		);
end component;



signal global_clk_4x, global_clk_4x_180, global_clk_4x_b, global_clk_4x_180_b, global_clk_2x, global_clk_fb, global_clk_90, gnd : std_ulogic;
signal memclk_0, memclk_180, memclk_0_b, memclk_180_b : std_ulogic;
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
signal notsramWE, SRAMCE, notsramOE, busyD, ASEL0, ASEL1 : std_ulogic;

signal cmd_instr_g, c3_p0_cmd_instr : std_logic_vector(2 downto 0);
signal cmd_bl_g, c3_p0_cmd_bl : std_logic_vector(5 downto 0);
signal cmd_byte_addr_g, c3_p0_cmd_byte_addr : std_logic_vector(29 downto 0);
signal wr_mask_g : std_logic_vector(C3_P1_MASK_SIZE - 1 downto 0);
signal wr_data_g, c3_p0_rd_data, c3_p0_wr_data : std_logic_vector(C3_P1_DATA_PORT_SIZE - 1 downto 0);
signal c3_p0_cmd_en, c3_p0_rd_en, c3_p0_wr_en : std_logic;
signal resetCounter : unsigned(5 downto 0) := "000000";
signal quili : unsigned(7 downto 0) := "00000000";

signal c3_p0_wr_count, c3_p0_rd_count : std_logic_vector(6 downto 0);
signal c3_p0_cmd_empty, c3_p0_cmd_full, c3_p0_wr_full, c3_p0_wr_empty, c3_p0_wr_underrun, c3_p0_wr_error : std_ulogic;
signal c3_p0_rd_full, c3_p0_rd_empty, c3_p0_rd_overflow, c3_p0_rd_error, c3_calib_done : std_logic;
signal user_clock_ddr, ddrclk_fb : std_logic;

signal quack : std_ulogic_vector(7 downto 0);
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
   c3_p0_cmd_clk                           =>  global_clk,
   c3_p0_cmd_en                            =>  c3_p0_cmd_en,
   c3_p0_cmd_instr                         =>  c3_p0_cmd_instr,
   c3_p0_cmd_bl                            =>  c3_p0_cmd_bl,
   c3_p0_cmd_byte_addr                     =>  c3_p0_cmd_byte_addr,
   c3_p0_cmd_empty                         =>  c3_p0_cmd_empty,
   c3_p0_cmd_full                          =>  open,
   c3_p0_wr_clk                            =>  global_clk,
   c3_p0_wr_en                             =>  c3_p0_wr_en,
   c3_p0_wr_mask                           =>  wr_mask_g,
   c3_p0_wr_data                           =>  c3_p0_wr_data,
   c3_p0_wr_full                           =>  c3_p0_wr_full,
   c3_p0_wr_empty                          =>  c3_p0_wr_empty ,
   c3_p0_wr_count                          =>  c3_p0_wr_count,
   c3_p0_wr_underrun                       =>  c3_p0_wr_underrun,
   c3_p0_wr_error                          =>  c3_p0_wr_error,
   c3_p0_rd_clk                            =>  global_clk,
   c3_p0_rd_en                             =>  c3_p0_rd_en,
   c3_p0_rd_data                           =>  c3_p0_rd_data,
   c3_p0_rd_full                           =>  c3_p0_rd_full,
   c3_p0_rd_empty                          =>  c3_p0_rd_empty,
   c3_p0_rd_count       		   =>  c3_p0_rd_count ,
   c3_p0_rd_overflow                       =>  c3_p0_rd_overflow,
   c3_p0_rd_error                          =>  c3_p0_rd_error,
   c3_p1_cmd_clk                           =>  global_clk,
   c3_p1_cmd_en                            =>  gnd,
   c3_p1_cmd_instr                         =>  cmd_instr_g,
   c3_p1_cmd_bl                            =>  cmd_bl_g,
   c3_p1_cmd_byte_addr                     =>  cmd_byte_addr_g,
   c3_p1_cmd_empty                         =>  open,
   c3_p1_cmd_full                          =>  open,
   c3_p1_wr_clk                            =>  global_clk,
   c3_p1_wr_en                             =>  gnd,
   c3_p1_wr_mask                           =>  wr_mask_g,
   c3_p1_wr_data                           =>  wr_data_g,
   c3_p1_wr_full                           =>  open,
   c3_p1_wr_empty                          =>  open,
   c3_p1_wr_count                          =>  open,
   c3_p1_wr_underrun                       =>  open,
   c3_p1_wr_error                          =>  open,
   c3_p1_rd_clk                            =>  global_clk,
   c3_p1_rd_en                             =>  gnd,
   c3_p1_rd_data                           =>  open,
   c3_p1_rd_full                           =>  open,
   c3_p1_rd_empty                          =>  open,
   c3_p1_rd_count                          =>  open,
   c3_p1_rd_overflow                       =>  open,
   c3_p1_rd_error                          =>  open,
   c3_p2_cmd_clk                           =>  global_clk,
   c3_p2_cmd_en                            =>  gnd,
   c3_p2_cmd_instr                         =>  cmd_instr_g,
   c3_p2_cmd_bl                            =>  cmd_bl_g,
   c3_p2_cmd_byte_addr                     =>  cmd_byte_addr_g,
   c3_p2_cmd_empty                         =>  open,
   c3_p2_cmd_full                          =>  open,
   c3_p2_wr_clk                            =>  global_clk,
   c3_p2_wr_en                             =>  gnd,
   c3_p2_wr_mask                           =>  wr_mask_g,
   c3_p2_wr_data                           =>  wr_data_g,
   c3_p2_wr_full                           =>  open,
   c3_p2_wr_empty                          =>  open,
   c3_p2_wr_count                          =>  open,
   c3_p2_wr_underrun                       =>  open,
   c3_p2_wr_error                          =>  open,
   c3_p2_rd_clk                            =>  global_clk,
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
	readddr : process(global_clk)
	begin
		if rising_edge(global_clk) then
			if spimWR = '1' and spimcommand(3 downto 0) = "1111" then
				c3_p0_rd_en <= '1';
			elsif spimWR = '0' and spimRD = '0' and c3_p0_rd_empty = '0' then
				c3_p0_rd_en <= '0';
			end if;
			
			if spimRD = '1' and spimcommand(3 downto 0) = "1111" then
				if c3_p0_rd_empty = '0' then
					c3_p0_rd_en <= '1';
				end if;
				spimdatain7 <= std_ulogic_vector(c3_p0_rd_data(7 downto 0));
			else
				if  spimWR = '0'  then
					c3_p0_rd_en <= '0';
				end if;
			end if;
			
			if spimWR = '1' and spimcommand(2 downto 0) = "110" then
				c3_p0_cmd_en <= '1';
				c3_p0_cmd_instr(2) <= '0';
				c3_p0_cmd_instr(1 downto 0) <= std_logic_vector(spimdataout(1 downto 0));
				c3_p0_cmd_bl(5 downto 3) <= "000";
				c3_p0_cmd_bl(2 downto 0) <= std_logic_vector(spimdataout( 4 downto 2));
				c3_p0_cmd_byte_addr(29 downto 7) <= (others => '0');
				c3_p0_cmd_byte_addr(6 downto 4) <= std_logic_vector(spimdataout(7 downto 5));
				c3_p0_cmd_byte_addr(3 downto 0) <= "0000";
				quack <= spimdataout;
				LAD815 <= spimdataout; --std_ulogic_vector(quili);
				--quili <= quili +1;
			else
				c3_p0_cmd_en <= '0';
			end if;
			
			if spimWR = '1' and spimcommand(3 downto 0) = "0111" then
				c3_p0_wr_en <= '1';
				c3_p0_wr_data(7 downto 0) <= std_logic_vector(spimdataout);
				c3_p0_wr_data(31 downto 8) <= "101010101010101010101010";
			else
				c3_p0_wr_en <= '0';
			end if;
			
			if global_rst = '1' then
				LAD815(0) <= '0';
				quili <= "00000000";
			end if;
			
			
		end if;
	end process readddr;
	
	gnd <= '0';

	--Global Signal Assignments	
	
	
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
	
	por : process(global_clk)
	begin
		if rising_edge(global_clk) then
			if resetCounter < 63 then
				global_rst <= '1';
				resetCounter <= resetCounter + 1;
			else
				global_rst <= '0';
			end if;
		end if;
	end process por;
	
	global_reset_n <= not global_rst;
	
	-- Test connections
	testL: process (global_clk, global_rst) is

	begin
	if global_rst = '1' then
		testo <= "000";
	elsif rising_edge(global_clk) then
		if spimRD = '1' and spimcommand(2 downto 0) = "010" then
			if testo = "000" then
				testo <= "001";
				spimdatain2 <= "00001111";
			elsif testo = "001" then
				testo <= "010";
				spimdatain2( 6 downto 0) <= std_ulogic_vector(c3_p0_wr_count);
				spimdatain2(7) <= c3_p0_wr_full;
			elsif testo = "010" then
				testo <= "011";
				spimdatain2(0) <= c3_p0_wr_empty;
				spimdatain2(1) <= c3_p0_wr_underrun;
				spimdatain2(2) <= c3_p0_wr_error;
				spimdatain2(3) <= c3_p0_rd_empty;
				spimdatain2(4) <= c3_p0_rd_full;
				spimdatain2(5) <= c3_p0_rd_error;
				spimdatain2(6) <= c3_p0_rd_overflow;
				spimdatain2(7) <= c3_p0_rd_en;
			elsif testo = "011" then
				testo <= "100";
				spimdatain2( 6 downto 0) <= std_ulogic_vector(c3_p0_rd_count);
				spimdatain2( 7 ) <= c3_calib_done;
			elsif testo = "100" then
				testo <= "101";
				spimdatain2(5 downto 0) <= std_ulogic_vector(c3_p0_cmd_bl);
				spimdatain2(7 downto 6) <= "00";
			elsif testo = "101" then
				testo <= "110";
				spimdatain2(2 downto 0) <= std_ulogic_vector( c3_p0_cmd_instr);
				spimdatain2(7 downto 3) <= "10000";
			elsif testo = "110" then
				testo <= "111";
				spimdatain2 <= std_ulogic_vector(c3_p0_cmd_byte_addr(7 downto 0));
			elsif testo = "111" then
				testo <= "000";
				--spimdatain2 <= std_ulogic_vector(c3_p0_cmd_byte_addr(15 downto 8));
				spimdatain2 <= quack;
			end if;
		end if;
	end if;
	end process testL;
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	--LAD815(7 downto 1) <= std_ulogic_vector(ddrclktestcounter(7 downto 1));
	
	
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

