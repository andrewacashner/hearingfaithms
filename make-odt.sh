#! /usr/bin/env sh
# make-odt.sh

# Convert each chapter of the book to a separate ODT file

# 1. Get a list of chapters to include from command line argument
# 2. Preprocess these chapters plus all floats with floatref to resolve
#    cross-references
# 3. Concatenate all float files into one
# 4. Convert each preprocessed chapter files and the concatenated float file
#    into separate ODT files with pandoc
# 5. Clean up .ref and .log files produced by floatref

set -e

chapters=("$@")

echo "Resolving cross-references..."
floatref "${chapters[@]}" figures/*.md music-examples/*.md poem-examples/*.md tables/*.md

cat $(cat floats.log) > floats.md.ref

refchapters=("${chapters[@]/%/.ref}" "floats.md.ref")

echo "About to process ${chapters[@]}"

for file in "${refchapters[@]}"; do
    echo "Converting to ODT: $file..."
    outputname="$(basename $file .md.ref).odt"
    echo "Output to $outputname..."
    pandoc \
        --filter pandoc-citeproc \
        --smart \
        --reference-odt config/vcbook.odt \
        --bibliography master.bib \
        --csl chicago-fullnote-bibliography.csl \
        -o odt/"$outputname" \
        config/odt.yaml chapters/head.yaml \
        "$file"
done

rm $(find ./ -type f -name "*.md.ref") floats.log

exit 0


