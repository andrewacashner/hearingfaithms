#! /usr/bin/env sh
set -e

echo "Resolving cross-references..."
floatref chapters/chapter-*.md poem-examples/*.md > floats.log

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
    config/pdf.yaml chapters/head.yaml chapters/chapter-*.md.ref \
    poem-examples/*.md.ref

#rm chapters/chapter-*.md.ref poem-examples/*.md.ref
echo "Created pdf/all.pdf"

exit 0

# To include all floats in floats.log,
# mapfile floats < floats.log
# then use this at end of pandoc invocation   "${floats[@]}"
