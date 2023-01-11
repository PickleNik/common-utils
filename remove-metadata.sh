#!/bin/bash

# Script to remove metadata using ffmpeg

# Check if input and output file names are provided
if [ $# -ne 2 ]; then
    echo -e "\033[31mUsage: $0 input_file output_file\033[0m"
    exit 1
fi

# Input file
input_file="$1"

# Output file
output_file="$2"

# Run ffmpeg command to remove metadata
ffmpeg -i "$input_file" -map 0:a -c:a copy -map_metadata -1 "$output_file"

# Output message in red
echo -e "\033[32m$input_file without metadata was saved to $output_file\033[0m"
