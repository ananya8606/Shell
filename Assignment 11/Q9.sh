#!/bin/bash

# Function to find the number of gid columns in the VCF file (a)
get_gid_columns() {
    awk '/^#/{for(i=1;i<=NF;i++) if($i=="gid") gid_count++;} END{print gid_count}' "$1"
}

# Function to retain lines within a given mutation range (b)
filter_mutations_range() {
    awk -v min="$2" -v max="$3" '$2 >= min && $2 <= max || NR < 2' "$1"
}

# Function to retain lines where REF field has allowed characters (c)
filter_ref_field() {
    awk 'NR < 2 || $4 ~ /^[ACGT]+$/ {print}' "$1"
}

# Function to retain lines where ALT field has allowed characters (d)
filter_alt_field() {
    awk 'NR < 2 || $5 ~ /^[ACGT]+$/ {print}' "$1"
}

# Function to merge all functionalities (a-d) to produce C1 equivalent output (e)
merge_functionalities() {
    local file="$1"
    local min="$2"
    local max="$3"
    
    get_gid_columns "$file" | xargs echo "Number of gid columns:"

    echo "Filtering mutations in range $min - $max:"
    filter_mutations_range "$file" "$min" "$max"

    echo "Filtering lines with allowed characters in REF field:"
    filter_ref_field "$file"

    echo "Filtering lines with allowed characters in ALT field:"
    filter_alt_field "$file"
}

# Function to identify the line with the highest mutation rate within the filtered lines (f)
identify_highest_mutation_rate() {
    awk 'NR > 1 { mutation_rate = ($5 ~ /,/ ? gsub(/,/, "") + 1 : 1); if (mutation_rate > max_mutation_rate) { max_mutation_rate = mutation_rate; max_mutation_line = $0 } } END {print max_mutation_line}' "$1"
}

# Usage
file="$1"
min="$2"
max="$3"

merge_functionalities "$file" "$min" "$max" # Output C1 equivalent output (a-d)
identify_highest_mutation_rate "$file"    # Identify the line with the highest mutation rate (f)
