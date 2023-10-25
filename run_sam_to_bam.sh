#!/bin/bash

# Relative path to the directory with the previously generate .bam files
SAM_DIR=./alignment_results_sam_files

# Relative path for the directory with the converted .bam files
OUTPUT_BAM_DIR=./alignment_results_bam_files

# Creates an output directory for .bam files 
mkdir -p $OUTPUT_BAM_DIR

# Loops over all the .sam files in the directory
for SAM_FILE in $SAM_DIR/*.sam; do
    # Uses the base name without the .sam extension to attach the .bam extensions
    BASENAME=$(basename $SAM_FILE .sam)
    OUTPUT_BAM=$OUTPUT_BAM_DIR/${BASENAME}.bam

    # Converts .sam to .bam via samtools
    samtools view -Sb $SAM_FILE > $OUTPUT_BAM
done
