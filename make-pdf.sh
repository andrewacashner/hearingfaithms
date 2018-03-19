#! /usr/bin/env sh
# make-pdf.sh
# Andrew A. Cashner, 2018/02/16

# Print the book to a single PDF file

# 1. Get list of chapters to include from command line argument
# 2. Preprocess these chapters plus all floats with floatref to resolve
#    cross-references
# 3. Convert preprocessed chapter and float files, plus configuration files 
#    to PDF with pandoc
# 4. Clean up .ref and .log files produced by floatref

# TODO 
# allow to specify name of output file with getopt

set -e

if [[ $# -eq 0 ]]; then
    echo "No input file specified."
    exit 1
fi

chapters=("$@")

# Start fresh
if [[ -f xref.aux ]]; then
    rm xref.aux
fi
if [[ ! -f input.ent ]]; then
    touch input.ent
fi

echo "Resolving cross-references in chapters..."
cat "${chapters[@]}" chapters/floats.md  | xref > tmp.md

echo "Resolving cross-references in float files..."
cat xref.aux | ./scripts/label2dir.sh > tmp.log
mapfile -t floats < tmp.log

# Process float files in the order of the labels from xref.aux
cat "${floats[@]}" | xref >> tmp.md


echo "Converting to PDF..."
pandoc \
    --filter pandoc-citeproc \
    --latex-engine xelatex \
    --top-level-division part \
    --table-of-contents \
    --bibliography master.bib \
    --csl chicago-fullnote-bibliography.csl \
    -o pdf/all.pdf \
    config/pdf.yaml chapters/head.yaml \
    chapters/copyright.md \
    tmp.md

echo "Output to pdf/all.pdf"

rm input.ent xref.aux tmp.md tmp.log

exit 0

