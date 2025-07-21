#!/bin/bash

# Check garmintools dependency
command -v garmin_gpx >/dev/null 2>&1 || { echo >&2 "garmin_gpx (garmintools) is required but not installed. Aborting."; exit 1; }

# Inputs
input=$1
output="${input%.gmn}.gpx"

garmin_gpx "$input" > "$output"
