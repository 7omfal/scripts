#!/bin/bash

MAX_CPU=$(cpupower frequency-info -l | tail -n1 | cut -d' ' -f2)

# Disable "BD PROCHOT"
wrmsr -a 0x1FC 262238;

# Set and apply frequencies
cpupower frequency-set \
	-d $(expr $MAX_CPU / 4) \
	-u $MAX_CPU \
	-r \
	-g performance
