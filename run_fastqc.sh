#!/bin/bash

# The path to the directory containing FASTQ files.
DIR="/localdisk/data/BPSM/ICA1/fastq"

# The ./ is a relative path to allow for flexibility in where our script is run  ie. not hardcoded path
OUTPUT_DIR="./fastqc_output"

# This checks if the output directory exists, which in the case our user, it miight not so it uses 'if' to create it.

if [ ! -d "$OUTPUT_DIR" ]; then
    mkdir "$OUTPUT_DIR"
fi

# This starts a simple loop where the code is executed fore each .gz file in the directory.
for FILE in "$DIR"/*.gz; do
    # This runs fastqc
    # The -o "$OUTPUT_DIR" part save the output in the above defined output directory.
    fastqc "$FILE" -o "$OUTPUT_DIR"
done
