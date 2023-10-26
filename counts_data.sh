#!/bin/bash

# Directory with all the .bam files
BAM_DIR="./alignment_results_bam_files"

# Absolute path to the .bed file
BED_FILE="/localdisk/data/BPSM/ICA1/TriTrypDB-46_TcongolenseIL3000_2019.bed"

# Defines a relative path to an output directory and a modified .bed file within it 
OUTPUT_DIR="./counts_data_results"
MODIFIED_BED="${OUTPUT_DIR}/modified_TriTrypDB-46_TcongolenseIL3000_2019_with_counts.bed"

# Creates the output directory
mkdir -p $OUTPUT_DIR

# Copies the original .bed file and saves it as the modified .bed file to make further changes to it
cp $BED_FILE $MODIFIED_BED

# Loops over all the .bam files in the directory 
for bam in ${BAM_DIR}/*.bam; do
    # Uses bedtools’ intersect function to generate values for counts, it also adds these values to the output file
    bedtools intersect -a $MODIFIED_BED -b $bam -c > ${MODIFIED_BED}.new
    mv ${MODIFIED_BED}.new $MODIFIED_BED
done


# Uses awk to extract the 4th and 5th columns from the modified .bed file and adds to counts.txt, the output file, as an indicator of gene descriptions and gene names
awk '{for (i=4; i<=NF; i++) printf $i (i==NF ? "\n" : "\t")}' $MODIFIED_BED > ${OUTPUT_DIR}/counts.txt
