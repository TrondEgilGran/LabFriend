#!/bin/bash
#simulate hsaqusition
cd work
ghdl -i --work=unisim -fexplicit /home/teg/programs/xilinx/14.7/ISE_DS/ISE/vhdl/src/unisims/*.vhd
ghdl -i --work=unisim -fexplicit /home/teg/programs/xilinx/14.7/ISE_DS/ISE/vhdl/src/unisims/primitive/*.vhd
ghdl -i --work=unimacro -fexplicit /home/teg/programs/xilinx/14.7/ISE_DS/ISE/vhdl/src/unimacro/*.vhd

ghdl -i  ../spimaster.vhd ../spimaster_tb.vhd
ghdl -m  spimaster_tb
ghdl -r  spimaster_tb --stop-time=560000ns --wave=spimaster.ghw
cd ..