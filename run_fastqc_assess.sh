#!/bin/bash

# A relative path such that the input directory is in the same directory as this script
INPUT_DIR="./fastqc_unzip"

# goes to the input directory if user is not already there
cd "$INPUT_DIR"

# Executes the find and grep commands while also redirecting the  outputs to a specified directory
find . -name "summary.txt" -exec grep "Basic Statistics" {} +
find . -name "summary.txt" -exec grep "Per base sequence quality" {} +
find . -name "summary.txt" -exec grep "Per sequence quality scores" {} +
find . -name "summary.txt" -exec grep "Per base sequence content" {} +
find . -name "summary.txt" -exec grep "Per sequence GC content" {} +
find . -name "summary.txt" -exec grep "Per base N content" {} +
find . -name "summary.txt" -exec grep "Sequence Length Distribution" {} +
find . -name "summary.txt" -exec grep "Sequence Duplication Levels" {} +
find . -name "summary.txt" -exec grep "Overrepresented sequences" {} +
find . -name "summary.txt" -exec grep "Adapter Content" {} +

# .  is used to find in the current direcotry and + is  used to pool the greap comman to give several filemenames at once
