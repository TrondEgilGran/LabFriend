#!/bin/bash
#simulate hsaqusition
echo "import unisim"
cd work
ghdl -i --work=unisim -fexplicit /home/teg/programs/xilinx/14.7/ISE_DS/ISE/vhdl/src/unisims/*.vhd
ghdl -i --work=unisim -fexplicit /home/teg/programs/xilinx/14.7/ISE_DS/ISE/vhdl/src/unisims/primitive/*.vhd
ghdl -i --work=unimacro -fexplicit /home/teg/programs/xilinx/14.7/ISE_DS/ISE/vhdl/src/unimacro/*.vhd
echo "own design"
ghdl -i --warn-unused  ../HSaqusition.vhd ../HSaqusition_tb.vhd ../DSPMAcroCounter.vhd
echo "itsi"
ghdl -m -g -Punisim --warn-unused  --ieee=synopsys -fexplicit HSaqusition_tb
echo "oo"
ghdl -r --ieee=synopsys -fexplicit HSaqusition_tb --stop-time=90000ns --wave=../hsaqusition.ghw > debug
cd ..
