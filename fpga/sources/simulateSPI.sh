#!/bin/bash
#simulate pwm
ghdl -i --workdir=work spi.vhd spi_tb.vhd 
ghdl -m --workdir=work pwm_tb
ghdl -r  pwm_tb  --disp-tree=proc --stop-time=80000ns --wave=pwm.ghw