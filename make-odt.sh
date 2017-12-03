#! /usr/bin/env sh
set -e

echo "Resolving cross-references..."
mdref chapters/chapter-*.md

for file in chapters/chapter-*.md.ref
do
    echo "Converting to ODT: ${file%.ref}..."
    pandoc \
        --filter pandoc-citeproc \
        --smart \
        --reference-odt config/vcbook.odt \
        --bibliography master.bib \
        --csl chicago-fullnote-bibliography.csl \
        chapters/head.yaml "$file" \
        -o "${file%.md.ref}.odt"
done

echo "Created $(find chapters/chapter-*.odt)"
mv chapters/*.odt odt/
rm chapters/*.md.ref

exit 0


