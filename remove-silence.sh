#!/bin/bash

# Script to remove silence from an audio file using ffmpeg

# Check if input and output file names are provided
if [ $# -lt 2 ]; then
    echo -e "\033[31mUsage: $0 input_file output_file [threshold (dB)]\033[0m"
    exit 1
fi

# Input file
input_file="$1"

# Output file
output_file="$2"

# Threshold for silence detection (in dB)
threshold="-50dB"

# Check if threshold is provided
if [ $# -eq 3 ]; then
    threshold=$3
fi

# Run ffmpeg command to remove silence
ffmpeg -i "$input_file" -af "silenceremove=start_periods=1:stop_periods=-1:start_threshold=$threshold:stop_threshold=$threshold:start_silence=2:stop_silence=2" "$output_file"

echo -e "\033[32m$input_file without silence was saved to $output_file\033[0m"
