#!/bin/bash
#simulate hsaqusition
cd work
ghdl -i  ../i2s.vhd ../i2s_tb.vhd ../dual_port_block_ram.vhd
ghdl -m  i2s_tb
ghdl -r  i2s_tb  --disp-tree=proc --stop-time=80000ns --wave=../i2s.ghw
cd ..
