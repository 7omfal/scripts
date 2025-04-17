#!/bin/bash
gio mount -li | awk -F= '{if(index($2,"mtp") == 1)system("gio mount "$2)}'

