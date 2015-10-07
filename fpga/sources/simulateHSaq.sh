#!/bin/bash
#simulate hsaqusition
echo "import unisim"
ghdl -i --work=unisim -fexplicit /home/teg/Programs/Xilinx/14.7/ISE_DS/ISE/vhdl/src/unisims/*.vhd
ghdl -i --work=unisim -fexplicit /home/teg/Programs/Xilinx/14.7/ISE_DS/ISE/vhdl/src/unisims/primitive/*.vhd
ghdl -i --work=unimacro -fexplicit /home/teg/Programs/Xilinx/14.7/ISE_DS/ISE/vhdl/src/unimacro/*.vhd
echo "own design"
ghdl -i  HSaqusition.vhd HSaqusition_tb.vhd DSPMAcroCounter.vhd
echo "itsi"
ghdl -m -g -Punisim --warn-unused --ieee=synopsys -fexplicit HSaqusition_tb
echo "oo"
ghdl -r  HSaqusition_tb --stop-time=5400000ns --wave=hsaqusition.ghw > debug
