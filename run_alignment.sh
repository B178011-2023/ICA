#!/bin/bash

#Relative path to the index files
INDEX_DIR=./genome_index_files

#Absolute path to the directory with the reads 
FASTQ_DIR=/localdisk/data/BPSM/ICA1/fastq

# A relative path for the output directory
OUTPUT_DIR=./alignment_results_sam_files

# Creates the .sam files output directory
mkdir -p $OUTPUT_DIR

# Loops over the files in the fastq reads directory
for READ1 in $FASTQ_DIR/*_1.fq.gz; do
    # Since the paired-end reads are named *_1.fq.gz and *_2.fq.gz this allows use to locate and operationalise read 2 
    READ2=${READ1%_1.fq.gz}_2.fq.gz

    # Get the base name without the _1.fq.gz for the outputted sam files
    BASENAME=$(basename $READ1 _1.fq.gz)
    OUTPUT_SAM=$OUTPUT_DIR/${BASENAME}.sam

    # Runs bowtie2 alignment (paired end)
    bowtie2 -x $INDEX_DIR/Tcongo_genome_index -1 $READ1 -2 $READ2 -S $OUTPUT_SAM
done
