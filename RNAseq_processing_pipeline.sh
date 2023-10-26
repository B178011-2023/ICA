#!/bin/bash

# Runs a script for running  fastqc
./run_fastqc.sh

# Runs a script for unzipping the fastqc output
./run_unzip_fastqc.sh

# Runs a script to assess the quality of our data using the fastqc data
./run_fastqc_assess.sh

# Runs a script to index the genome
./run_indexing.sh

# Runs a script of paired end alignment using bowtie2
./run_alignment.sh

# Runs a script to convert the alignment output from .sam to .bam
./run_sam_to_bam.sh

# Runs a script that uses bedtools for generating counts
./counts_data.sh

#Runs a script for calculating the average counts per gene
./counts_mean.sh
