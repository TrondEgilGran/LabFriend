#!/bin/bash
#simulate hsaqusition
ghdl -i --workdir=work HSaqusition.vhd HSaqusition_tb.vhd
ghdl -m --workdir=work HSaqusition_tb
ghdl -r  HSaqusition_tb --stop-time=14000ns --wave=hsaqusition.ghw
