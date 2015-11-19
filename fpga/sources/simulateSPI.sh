#!/bin/bash
#simulate pwm
ghdl -i --workdir=work spi.vhd spi_tb.vhd 
ghdl -m --workdir=work spi_tb
ghdl -r  spi_tb  --disp-tree=proc --stop-time=80000ns --wave=spi.ghw