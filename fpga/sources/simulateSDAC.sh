#!/bin/bash
#simulate pwm

ghdl -i --work=work -fexplicit /home/teg/Programs/Xilinx/14.7/ISE_DS/ISE/vhdl/src/unisims/*.vhd
ghdl -i --work=work -fexplicit /home/teg/Programs/Xilinx/14.7/ISE_DS/ISE/vhdl/src/unisims/primitive/*.vhd
ghdl -i --work=work -fexplicit /home/teg/Programs/Xilinx/14.7/ISE_DS/ISE/vhdl/src/unimacro/*.vhd

ghdl -i --workdir=work -fexplicit hs_serial_dac.vhd hs_serial_dac_tb.vhd 
ghdl -m -g -Punisim --warn-unused --ieee=synopsys -fexplicit --workdir=work hs_serial_dac_tb
ghdl -r  hs_serial_dac_tb  --disp-tree=proc --stop-time=80000ns --wave=hs_serial_dac.ghw