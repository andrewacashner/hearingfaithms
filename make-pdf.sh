#! /usr/bin/env sh
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
    "${chapters[@]/%/.ref}" \
    chapters/floats.md \
    "${floats[@]}"

rm $(find -type f -name *.md.ref)
echo "Created pdf/all.pdf"

exit 0

