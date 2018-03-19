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

chapters=("$@")

# Start fresh
if [ -f xref.aux ]; then
    rm xref.aux
fi

echo "Resolving cross-references..."
cat "${chapters[@]}" \
    figures/*.md music-examples/*.md poem-examples/*.md tables/*.md | \
    xref > tmp.md

echo "Making list of float files..."
cat xref.aux | xref-list | \ 
    grep -E 'fig|music|poem|table' | \
    sed -E -f dirnames.sed | \
    mapfile -t floats 

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
    chapters/floats.md \
    "${floats[@]}"

echo "Output to pdf/all.pdf"

rm xref.aux tmp.md

exit 0

