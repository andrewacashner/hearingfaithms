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

echo "Resolving cross-references..."
floatref "${chapters[@]}" figures/*.md music-examples/*.md poem-examples/*.md tables/*.md

mapfile -t floats < floats.log

echo "Converting to PDF..."
pandoc \
    --filter pandoc-citeproc \
    --latex-engine xelatex \
    --top-level-division part \
    --table-of-contents \
    --include-in-header config/ms.tex \
    --bibliography master.bib \
    --csl chicago-fullnote-bibliography.csl \
    -o pdf/all.pdf \
    config/pdf.yaml chapters/head.yaml \
    chapters/copyright.md \
    "${chapters[@]/%/.ref}" \
    chapters/floats.md \
    "${floats[@]}"

echo "Output to pdf/all.pdf"

rm $(find ./ -type f -name "*.md.ref") floats.log

exit 0

