#!/bin/bash
#simulate pwm
ghdl -i --work=unisim -fexplicit /home/teg/programs/xilinx/14.7/ISE_DS/ISE/vhdl/src/unisims/*.vhd
ghdl -i --work=unisim -fexplicit /home/teg/programs/xilinx/14.7/ISE_DS/ISE/vhdl/src/unisims/primitive/*.vhd
ghdl -i --work=unimacro -fexplicit /home/teg/programs/xilinx/14.7/ISE_DS/ISE/vhdl/src/unimacro/*.vhd

ghdl -i --workdir=work spi.vhd spi_tb.vhd 
ghdl -m --workdir=work spi_tb
ghdl -r  spi_tb  --disp-tree=proc --stop-time=80000ns --wave=spi.ghw