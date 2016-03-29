#!/bin/bash
#simulate DWG
cd work
ghdl -i  -fexplicit /home/teg/Programs/Xilinx/14.7/ISE_DS/ISE/vhdl/src/unisims/*.vhd
ghdl -i  -fexplicit /home/teg/Programs/Xilinx/14.7/ISE_DS/ISE/vhdl/src/unisims/primitive/*.vhd
ghdl -i  -fexplicit /home/teg/Programs/Xilinx/14.7/ISE_DS/ISE/vhdl/src/unimacro/*.vhd
ghdl -i  -fexplicit ../digital_output.vhd ../digital_output_tb.vhd 

echo "Make"
ghdl -m -g -Punisim --warn-unused --ieee=synopsys -fexplicit  digital_output_tb
echo "Run"
ghdl -r  digital_output_tb  --disp-tree=proc --stop-time=80000ns --wave=../dwg.ghw
cd ..