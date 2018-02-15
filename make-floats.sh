#! /usr/bin/env sh
set -e

# Add floats to this, in order
# echo "Resolving cross-references..."
# floatref chapters/chapter-*.md

# Need to do poems in order

# echo "Converting to PDF..."
pandoc \
    --filter pandoc-citeproc \
    --latex-engine xelatex \
    --include-in-header config/floats.tex \
    --bibliography master.bib \
    --csl chicago-fullnote-bibliography.csl \
    -o pdf/floats.pdf \
    config/pdf.yaml chapters/head.yaml poem-examples/*.md

# rm chapters/chapter-*.md.ref
# echo "Created pdf/all.pdf"

exit 0
