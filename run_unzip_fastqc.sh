#!/bin/bash

# Relative path to a directory containing fastqc output zip files
INPUT_DIR="./fastqc_output"

# Relative path to a directory where unzipped files should be stored
OUTPUT_DIR="./fastqc_unzip"

# Creates the output directory
mkdir -p "$OUTPUT_DIR"

# Use a simple loop to unzip each .zip file in the directory.
for ZIP_FILE in "$INPUT_DIR"/*.zip; do
    # Check if the zip file exists
    if [[ -f "$ZIP_FILE" ]]; then
        # output into a specified output directory
        unzip "$ZIP_FILE" -d "$OUTPUT_DIR"
    fi
done
