#! /usr/bin/env sh
set -e

echo "Resolving cross-references..."
floatref chapters/chapter-*.md

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

mv chapters/*.odt odt/
echo "Created $(find odt/chapter-*.odt)"
rm chapters/*.md.ref

exit 0


