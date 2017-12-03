#! /usr/bin/env sh
set -e

echo "Resolving cross-references..."
mdref chapters/chapter-*.md

for file in chapters/chapter-*.mdref
do
    echo "Converting to ODT: "$file"..."
    pandoc \
        --filter pandoc-citeproc \
        --smart \
        --reference-odt config/vcbook.odt \
        --bibliography master.bib \
        --csl chicago-fullnote-bibliography.csl \
        chapters/head.yaml "$file" \
        -o "${file%.mdref}.odt"
done

echo "Created $(find chapters/chapter-*.odt)"
mv chapters/*.odt odt/
rm chapters/*.mdref

exit 0


