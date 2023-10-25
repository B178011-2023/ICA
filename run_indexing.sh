#!/bin/bash

# Absolute path to the genome fasta file on the MSc server 
GENOME="/localdisk/data/BPSM/ICA1/Tcongo_genome/TriTrypDB-46_TcongolenseIL3000_2019_Genome.fasta.gz"

# Define the output directory for the index files using a relative path to accomodate the difference between the developer's environment and the  users
OUTPUT_DIR="./genome_index_files"

# Creates the output directory
mkdir -p "$OUTPUT_DIR"

# Runs the bowtie2-build command which should create index files in the .bt2 format
bowtie2-build "$GENOME" "$OUTPUT_DIR/Tcongo_genome_index"




