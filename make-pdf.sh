#! /usr/bin/env sh
set -e

echo "Resolving cross-references..."
mdref chapters/chapter-*.md
echo "Converting to PDF..."
pandoc \
    config/pdf.yaml chapters/head.yaml chapters/chapter-*.md.ref \
    --filter pandoc-citeproc \
    --latex-engine xelatex \
    --top-level-division part \
    --table-of-contents \
    --include-in-header config/ms.tex \
    --bibliography master.bib \
    --csl chicago-fullnote-bibliography.csl \
    -o pdf/all.pdf
rm chapters/chapter-*.md.ref
echo "Created pdf/all.pdf"

exit 0
