#! /usr/bin/env sh
# make.sh
# Andrew A. Cashner, 2018/02/16

# Print the book to 
# - a single PDF file and 
# - to separate ODT files for chapters and floats

# TODO 
# allow to specify name of output file with getopt

set -e

function pandoc_pdf() {
    # Convert INFILE to PDF format OUTFILE
    infile="$1"
    outfile="$2"
    pandoc \
        --filter pandoc-citeproc \
        --latex-engine xelatex \
        --top-level-division part \
        --table-of-contents \
        --bibliography master.bib \
        --csl chicago-fullnote-bibliography.csl \
        -o "$outfile" \
        "$infile"
}

function pandoc_odt() {
    # Convert INFILE to ODT format OUTFILE
    infile="$1"
    outfile="$2"
    pandoc \
        --filter pandoc-citeproc \
        --smart \
        --reference-odt config/vcbook.odt \
        --bibliography master.bib \
        --csl chicago-fullnote-bibliography.csl \
        -o "$outfile" \
        "$infile"
}

function labels_to_file_list() {
    # Output array with list of float filenames
    logfile="$1"
    array="$2"
    xref-list xref.aux config/xref-labels.scm > "$logfile"
    mapfile -t "$2" < "$logfile"
}

# PARSE COMMAND-LINE ARGUMENTS
if [[ $# -eq 0 ]]; then
    echo "No input file specified."
    exit 1
fi

chapters=("$@")

# START FRESH WITH AUXILIARY FILES
if [[ -f xref.aux ]]; then
    rm xref.aux
fi
if [[ ! -f input.ent ]]; then
    touch input.ent
fi

# CONVERT TO PDF
echo "Creating PDF output..."
cat config/pdf.yaml chapters/head.yaml chapters/copyright.md > head.md

echo "Resolving cross-references in chapters..."
cat head.md "${chapters[@]}" chapters/floats.md  | 
    xref > tmp.md

echo "Resolving cross-references in float files..."
labels_to_file_list tmp.log floats

# Process float files in the order of the labels from xref.aux
cat "${floats[@]}" | xref >> tmp.md # append

echo "Converting to PDF..."
pandoc_pdf tmp.md pdf/all.pdf

echo "Output to pdf/all.pdf"

echo ""

# CONVERT TO ODT
echo "Creating ODT output..."
cat config/odt.yaml chapters/head.yaml chapters/copyright.md > head.md # replace

echo "Resolving cross-references and converting to ODT..."
for file in "${chapters[@]}"; do
    cat head.md "$file" |
        xref > tmp.md 
    
    pandoc_outfile="odt/$(basename $file .md).odt"
    pandoc_odt tmp.md "$pandoc_outfile" 
    echo "Converted $file to $outfile"
done

echo "Resolving cross-references in float files..."
labels_to_file_list tmp.log floats

echo "Converting float files to single ODT doc..."
# Make single ODT from float files
cat head.md "${floats[@]}" | 
    xref > tmp.md # replace

pandoc_odt tmp.md odt/floats.odt
echo "Output to odt/floats.odt"


# CLEAN UP
rm input.ent xref.aux head.md tmp.md tmp.log

exit 0

