#!/bin/bash

# Check for arguments
if [ "$#" -ne 2 ]; then
	echo "Usage: $0 <file> <regex>"
	exit 1
fi

file=$1
regex=$2

awk -v reg="$regex" '
  BEGIN { RS="\\[\\+\\] Metadata for "; FS="\n" }
  $0 ~ reg { print substr($1, 1, length($1) - 1) }' $file
