-- i2s Communicator
-- Module Name: i2s
-- File Name: i2s.vhd
-- Author: Trond Egil Gran
-- Date: 20/09 2013
-- Operation:  

library ieee;
use ieee.std_logic_1164.all, ieee.numeric_std.all;


entity i2s is
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
end i2s;



architecture rtl of i2s is

component bram_tdp is
generic (
    DATA    : integer := 48;
    RADDR    : integer := 12
);
port (
    -- Port A
    a_clk   : in  std_logic;
    a_en    : in  std_logic;
    a_wr    : in  std_logic;
    a_addr  : in  std_logic_vector(RADDR-1 downto 0);
    a_din   : in  std_logic_vector(DATA-1 downto 0);
    a_dout  : out std_logic_vector(DATA-1 downto 0);
     
    -- Port B
    b_clk   : in  std_logic;
    b_en    : in  std_logic;
    b_wr    : in  std_logic;
    b_addr  : in  std_logic_vector(RADDR-1 downto 0);
    b_din   : in  std_logic_vector(DATA-1 downto 0);
    b_dout  : out std_logic_vector(DATA-1 downto 0)
);
end component bram_tdp;

signal    ram_adc_a_clk   :  std_logic;
signal    ram_adc_a_en    :  std_logic;
signal    ram_adc_a_wr    :  std_logic;
signal    ram_adc_a_addr  :  std_logic_vector(RADDR-1 downto 0);
signal    ram_adc_a_din   :  std_logic_vector(DATA-1 downto 0);
signal    ram_adc_a_dout  :  std_logic_vector(DATA-1 downto 0);
     
    -- Port B
signal    ram_adc_b_clk   :  std_logic;
signal    ram_adc_b_en    :  std_logic;
signal    ram_adc_b_wr    :  std_logic;
signal    ram_adc_b_addr  :  std_logic_vector(RADDR-1 downto 0);
signal    ram_adc_b_din   :  std_logic_vector(DATA-1 downto 0);
signal    ram_adc_b_dout  :  std_logic_vector(DATA-1 downto 0);

signal    ram_dac_a_clk   :  std_logic;
signal    ram_dac_a_en    :  std_logic;
signal    ram_dac_a_wr    :  std_logic;
signal    ram_dac_a_addr  :  std_logic_vector(RADDR-1 downto 0);
signal    ram_dac_a_din   :  std_logic_vector(DATA-1 downto 0);
signal    ram_dac_a_dout  :  std_logic_vector(DATA-1 downto 0);
     
    -- Port B
signal    ram_dac_b_clk   :  std_logic;
signal    ram_dac_b_en    :  std_logic;
signal    ram_dac_b_wr    :  std_logic;
signal    ram_dac_b_addr  :  std_logic_vector(RADDR-1 downto 0);
signal    ram_dac_b_din   :  std_logic_vector(DATA-1 downto 0);
signal    ram_dac_b_dout  :  std_logic_vector(DATA-1 downto 0);

signal	  freq_div_factor : std_logic_vector( 3 downto 0);

signal  lrckreg, bckreg, sysclkreg  : std_logic;
signal negedge, posedge, lrposedge, lrnegedge : std_logic;

signal freq_counter_sysck : unsigned(3 downto 0);
signal freq_counter_bck : unsigned(1 downto 0);
signal freq_counter_lrck : unsigned(5 downto 0);

signal adc_I2S_data, dac_I2S_data, dac_ram_reg, adc_ram_reg : std_logic_vector( 47 downto 0 );
signal adc_fifolevel, adc_a_addr_counter, adc_b_addr_counter : unsigned( RADDR-1 downto 0 );
signal dac_fifolevel, dac_a_addr_counter, dac_b_addr_counter : unsigned( RADDR-1 downto 0 );
signal dacBufferSize : unsigned( RADDR-1 downto 0 );
type datamachine is (idle, config, read_fifo, first_byte, second_byte, third_byte, fourth_byte, fifth_byte);
signal data_state : datamachine;
signal finish_adc, finish_dac, finish_dac_cnt : std_logic;

signal enable_adc, spi_adc_read, spi_dac_write, enable_dac : std_logic;
signal serial_transfer_triggered, trigger_serial_transfer, indicator : std_logic;
signal sync_counters : std_logic;
begin

bram1: bram_tdp port map (	a_clk   =>   std_logic(ram_adc_a_clk),  
				a_en    =>   std_logic(ram_adc_a_en),   
				a_wr    =>   std_logic(ram_adc_a_wr),   
				a_addr  =>   std_logic_vector(ram_adc_a_addr), 
				a_din   =>   std_logic_vector(ram_adc_a_din),  
				std_logic_vector(a_dout)  =>   ram_adc_a_dout, 
				
				-- Port B
				b_clk   =>   std_logic(ram_adc_b_clk), 
				b_en    =>   std_logic(ram_adc_b_en),   
				b_wr    =>   std_logic(ram_adc_b_wr),   
				b_addr  =>   std_logic_vector(ram_adc_b_addr), 
				b_din   =>   std_logic_vector(ram_adc_b_din),  
				std_logic_vector(b_dout)  =>   ram_adc_b_dout ); 
				
bram2: bram_tdp port map (	a_clk   =>   std_logic(ram_dac_a_clk),  
				a_en    =>   std_logic(ram_dac_a_en),   
				a_wr    =>   std_logic(ram_dac_a_wr),   
				a_addr  =>   std_logic_vector(ram_dac_a_addr), 
				a_din   =>   std_logic_vector(ram_dac_a_din),  
				std_logic_vector(a_dout)  =>   ram_dac_a_dout, 
				
				-- Port B
				b_clk   =>   std_logic(ram_dac_b_clk), 
				b_en    =>   std_logic(ram_dac_b_en),   
				b_wr    =>   std_logic(ram_dac_b_wr),   
				b_addr  =>   std_logic_vector(ram_dac_b_addr), 
				b_din   =>   std_logic_vector(ram_dac_b_din),  
				std_logic_vector(b_dout)  =>   ram_dac_b_dout ); 
				
				

freqGen:  process (rst, clk) is

begin
	if rst = '1' then
		sysclkreg <= '0';
		bckreg <= '0';
		lrckreg <= '0';
		freq_counter_bck <= (others => '0');
		freq_counter_lrck <= (others => '0');
		freq_counter_sysck <= (others => '0');
		negedge <= '0';
		posedge <= '0';
		lrnegedge <= '0';
		lrposedge <= '0';
	elsif rising_edge(clk)  and (enable_adc = '1' or enable_dac = '1') then
		if (freq_counter_sysck = unsigned(freq_div_factor)) then
			freq_counter_sysck <= (others => '0');
			freq_counter_bck <= freq_counter_bck + 1;
			if freq_counter_bck = "11" then
				freq_counter_lrck <= freq_counter_lrck + 1;
				bckreg <= not bckreg;
				if freq_counter_lrck = "111111" then
					lrckreg <= not lrckreg;
					if lrckreg = '1' then
						lrnegedge <= '1';
					else
						lrposedge <= '1';
					end if;
				else
					if bckreg = '1' then
						if freq_counter_lrck <  50 and freq_counter_lrck > 1 then
							negedge <= '1';
						end if;
					else
						if freq_counter_lrck < 49 and freq_counter_lrck /= 0 then
							posedge <= '1';
						end if;
					end if;
				end if;
			end if;
			sysclkreg <= not sysclkreg;
		else
			freq_counter_sysck <= freq_counter_sysck + 1;
		end if;
		if negedge = '1' then
			negedge <= '0';
		end if;
		if posedge = '1' then
			posedge <= '0';
		end if;
		if lrnegedge = '1' then
			lrnegedge <= '0';
		end if;
		if lrposedge = '1' then
			lrposedge <= '0';
		end if;
	end if;
end process freqGen;

sclk <= sysclkreg;
bck <= bckreg;
lrck <= lrckreg;

i2s_shift_data: process(rst, clk) is

begin
	if rst = '1' then
		adc_I2S_data <= (others => '0');
		dac_I2S_data <= (others => '1');
		
	elsif rising_edge(clk) then
		if posedge = '1' then
			adc_I2S_data <= adc_I2S_data(46 downto 0) & i2sdin;
		end if;
		
		if negedge = '1' then
			dac_I2S_data <= dac_I2S_data(46 downto 0) & '0';
		end if;
		
		if lrnegedge = '1' then
			dac_I2S_data <= ram_dac_a_dout;
			ram_adc_a_din <= adc_I2S_data;
			ram_adc_a_wr <= '1';
		else
			ram_adc_a_wr <= '0';
		end if;
	end if;
end process i2s_shift_data;

i2sdout <= dac_I2S_data(47);


fifo_func: process(rst, clk) is

begin

	if rst = '1' then
		adc_a_addr_counter <= (others => '0');
		adc_b_addr_counter <= (others => '0');
		dac_a_addr_counter <= (others => '0');
		dac_b_addr_counter <= (others => '0');
		adc_fifolevel <= (others => '0');
		dac_fifolevel <= (others => '0');
	elsif rising_edge(clk) then
		if lrnegedge = '1' then
			adc_fifolevel <= adc_fifolevel + 1;
			--dac_fifolevel <= dac_fifolevel - 1;
			
			adc_a_addr_counter <= adc_a_addr_counter + 1;
			dac_a_addr_counter <= dac_a_addr_counter + 1;
		end if;
		
		if spi_adc_read = '1' then
			adc_fifolevel <= adc_fifolevel - 1;
			adc_b_addr_counter <= adc_b_addr_counter + 1;
		end if;
		
		if spi_dac_write = '1' then
			--dac_fifolevel <= dac_fifolevel + 1;
			dac_b_addr_counter <= dac_b_addr_counter + 1;
			dac_fifolevel <= dac_b_addr_counter + 1;
		end if;		
		
		if sync_counters = '1' then
			adc_a_addr_counter <= (others => '0');
			adc_b_addr_counter <= (others => '0');
			dac_a_addr_counter <= (others => '0');
			dac_b_addr_counter <= (others => '0');
			adc_fifolevel <= (others => '0');
			--dac_fifolevel <= (others => '0');	
		end if;
		
		
	end if;

end process fifo_func;

ram_adc_a_addr <= std_logic_vector(adc_a_addr_counter);
ram_adc_b_addr <= std_logic_vector(adc_b_addr_counter);
ram_dac_a_addr <= std_logic_vector(dac_a_addr_counter);
ram_dac_b_addr <= std_logic_vector(dac_b_addr_counter);

ram_adc_b_wr <= '0'; 
ram_adc_a_en <= enable_adc;
ram_adc_b_en <= enable_adc;
ram_dac_a_en <= enable_dac;
ram_dac_b_en <= enable_dac;
ram_dac_a_wr <= '0';

ram_adc_a_clk <= clk;
ram_dac_a_clk <= clk;
ram_dac_b_clk <= clk;
ram_adc_b_clk <= clk;


getData: process (rst, clk, datain, addr) is

begin
	if rst = '1' then
		data_state <= first_byte;
		finish_dac <= '0';
		finish_adc <= '0';
		finish_dac_cnt <= '0';
		ram_dac_b_wr <= '0';
		freq_div_factor <= "0100"; --50kHz default
		data_state <= idle;
		spi_dac_write <= '0';
		spi_adc_read <= '0';
		indicator <= '0';
		dacBufferSize <= (others => '1');
	elsif rising_edge(clk) then
		if (wr = '1' or rd = '1') and addr(2 downto 0) = address(2 downto 0) then
			case data_state is
				when idle =>
					if addr(6 downto 3)  = "0000" then --CONFIG
						conf0 <= datain(6);
						conf1 <= datain(7);
						enable_adc <= datain(4);
						enable_dac <= datain(5);
						freq_div_factor <= datain( 3 downto 0);
					elsif addr(6 downto 3) = "1000" then --GET dac Counter
						dataout( RADDR-9 downto 0) <= std_logic_vector(dac_fifolevel( RADDR-1 downto 8 ));
						dataout( 7 downto RADDR-8) <= (others => '0');
						data_state <= read_fifo;
					elsif addr(6 downto 3) = "1100" then --GET adc Counter
						dataout( RADDR-9 downto 0) <= std_logic_vector(adc_fifolevel( RADDR-1 downto 8 ));
						dataout( 7 downto RADDR-8) <= (others => '0');
						data_state <= read_fifo;
					elsif addr(6 downto 3) = "0010" then -- dac Data
						dac_ram_reg(47 downto 40) <= datain;
						data_state <= first_byte;
					elsif addr(6 downto 3) = "0001" then -- adc Data
						dataout <= ram_adc_b_dout( 47 downto 40);
						data_state <= first_byte;
					elsif addr(6 downto 3) = "1001" then -- sync ADC/DAC
						sync_counters <= '1';
					end if;
					
				when first_byte => 
					if addr(6 downto 3) = "0010" then -- dac Data
						dac_ram_reg(39 downto 32) <= datain;
					elsif addr(6 downto 3) = "0001" then -- adc Data
						dataout <= ram_adc_b_dout( 39 downto 32);
					end if;
					data_state <= second_byte;
				when second_byte =>
					if addr(6 downto 3) = "0010" then -- dac Data
						dac_ram_reg(31 downto 24) <= datain;
					elsif addr(6 downto 3) = "0001" then -- adc Data
						dataout <= ram_adc_b_dout( 31 downto 24);
					end if;
					data_state <= third_byte;
				when third_byte =>
					if addr(6 downto 3) = "0010" then -- dac Data
						dac_ram_reg(23 downto 16) <= datain;
					elsif addr(6 downto 3) = "0001" then -- adc Data
						dataout <= ram_adc_b_dout( 23 downto 16);
					end if;	
					data_state <= fourth_byte;
				when fourth_byte =>
					if addr(6 downto 3) = "0010" then -- dac Data
						dac_ram_reg(15 downto 8) <= datain;
					elsif addr(6 downto 3) = "0001" then -- adc Data
						dataout <= ram_adc_b_dout( 15 downto 8);
					end if;	
					data_state <= fifth_byte;
				when fifth_byte =>
					if addr(6 downto 3) = "0010" then -- dac Data
						dac_ram_reg(7 downto 0) <= datain;
						finish_dac <= '1';
					elsif addr(6 downto 3) = "0001" then -- adc Data
						dataout <= ram_adc_b_dout( 7 downto 0);
						finish_adc <= '1';
					end if;	
					data_state <= idle;
				when read_fifo =>
					if addr(6 downto 3) = "1000" then --GET dac Counter
						dataout <= std_logic_vector(dac_fifolevel( 7 downto 0 ));
					elsif addr(6 downto 3) = "1100" then --GET adc Counter
						dataout <= std_logic_vector(adc_fifolevel( 7 downto 0 ));
					end if;
					data_state <= idle;
				when others =>
					data_state <= idle;
				
			end case;
		else
		
			if finish_adc = '1' then
				finish_adc <= '0';
				spi_adc_read <= '1';
			else
				spi_adc_read <= '0';
			end if;
			
			if finish_dac = '1' then
				ram_dac_b_din <=  dac_ram_reg;
				finish_dac_cnt <= '1';
				finish_dac <= '0';
				ram_dac_b_wr <= '1';
			else
				ram_dac_b_wr <= '0';
				finish_dac_cnt <= '0';
			end if;
			
			if finish_dac_cnt = '1' then
				spi_dac_write <= '1';
			else
				spi_dac_write <= '0';
			end if;
		end if;
		
		if sync_counters = '1' then
			sync_counters <= '0';
		end if;
		
		if serial_transfer_triggered = '1' then
			trigger_serial_transfer <= '0';
		end if;
	end if;
end process getData;

end rtl;


