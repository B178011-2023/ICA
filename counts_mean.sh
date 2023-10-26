#!/bin/bash

# Relative paths for input and output files in this script
INPUT="./counts_data_results/counts.txt"
OUTPUT="./counts_data_results/counts_mean.txt"

# S	tarts multi-line awk command
awk '
# Defines a helper function ‘is_numeric’ to scan if a vlue (val) is a number this is done using a regular expression “(val ~ /^[0-9]+([.][0-9]*)?$/)” to cover all character between 0 and 9 including decimals 
function is_numeric(val) {
    return (val ~ /^[0-9]+([.][0-9]*)?$/);
}

{
    # Initialises variables sum (for adding the values) and count (for counting the numeric columns) for each row, “” strings together the non-numeric columns
    sum = 0
    count = 0
    nonNumericFields = ""
    
    # Scans through all columns
    for (i = 1; i <= NF; i++) {
        # Uses if for: if the value is numeric, it is added to the sum and increases the coun, which will be used for the mean
        if (is_numeric($i)) {
            sum += $i
            count++
        } else {
            # Pools together non-numeric columns to nonNumericFields
            nonNumericFields = (nonNumericFields == "" ? $i : nonNumericFields OFS $i)
        }
    }
    
    # Calculates the mean, if there are no numeric columns the mean will be NA (not applicable)
    mean = (count > 0 ? sum / count : "NA")
    
    # Prints the non-numeric fields and the mean to the output file 
    print nonNumericFields, mean
}
' OFS='\t' "$INPUT" > "$OUTPUT"
