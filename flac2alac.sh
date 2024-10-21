#!/bin/bash

# Check if the required tools are installed
command -v shntool >/dev/null 2>&1 || { echo >&2 "shntool is required but not installed. Aborting."; exit 1; }
command -v ffmpeg >/dev/null 2>&1 || { echo >&2 "ffmpeg is required but not installed. Aborting."; exit 1; }

# Input args
cue="$1"
flac="$2"
output_dir="./"

# Check which args are provided, verify needed args
if [ -z "$cue" ] || [ -z "$flac" ]; then
    echo "Usage: $0 cue flac [output_dir]"
    exit 1
fi

# Split with shntool
shntool split -f "$cue" -t %n-%t -o flac "$flac" -d "$output_dir"

# tag files
cuetag "$cue" "$output_dir"/[0-9]*.flac

# Convert to ALAC
for f in "$output_dir"/*.flac; do
    out="${f%.flac}.m4a"
    ffmpeg -i "$f" -acodec alac "../$out"
done

rm "$output_dir"
echo "Conversion complete."
