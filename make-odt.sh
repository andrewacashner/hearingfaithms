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

if [[ $# -eq 0 ]]; then
    echo "No input file specified."
    exit 1
fi

chapters=("$@")

function mypandoc() {
    infile="$1"
    outfile="$2"
    pandoc \
        --filter pandoc-citeproc \
        --smart \
        --reference-odt config/vcbook.odt \
        --bibliography master.bib \
        --csl chicago-fullnote-bibliography.csl \
        -o "$outfile" \
        "$infile"
}

# Start fresh
if [[ -f xref.aux ]]; then
    rm xref.aux
fi
if [[ ! -f input.ent ]]; then
    touch input.ent
fi

echo "Resolving cross-references and converting to ODT..."
for file in "${chapters[@]}"; do
    cat "$file" | xref > tmp.md 
    pandoc_outfile="odt/$(basename $file .md).odt"
    mypandoc tmp.md "$pandoc_outfile" && 
        echo "Converted $file to $outfile"
done

echo "Resolving cross-references in float files..."
xref-list xref.aux config/xref-labels.scm > tmp.log
mapfile -t floats < tmp.log

# Process float files in the order of the labels from xref.aux
cat "${floats[@]}" | xref > tmp.md # replace previous tmp.md

echo "Converting float files to single ODT doc..."
pandoc_infile=(config/odt.yaml chapters/head.yaml chapters/copyright.md tmp.md)
pandoc_outfile="odt/floats.odt"
mypandoc "${pandoc_infile[@]}" "$pandoc_outfile" && 
    echo "Output to $pandoc_outfile"

rm input.ent xref.aux tmp.md tmp.log

exit 0


