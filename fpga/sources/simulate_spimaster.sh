#!/bin/bash
#simulate hsaqusition
ghdl -i --workdir=work spi_master.vhd spimaster_tb.vhd
ghdl -m --workdir=work spimaster_tb
ghdl -r  spimaster_tb --stop-time=560000ns --wave=spimaster.ghw
