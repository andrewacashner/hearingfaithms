#! /usr/bin/env sh
# make-odt.sh

# Convert each chapter of the book to a separate ODT file

set -e

if [[ $# -eq 0 ]]; then
    echo "No input file specified."
    exit 1
fi

chapters=("$@")

function pandoc_odt() {
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
    cat config/odt.yaml chapters/head.yaml chapters/copyright.md > tmp.md 
    cat "$file" | xref >> tmp.md 
    pandoc_outfile="odt/$(basename $file .md).odt"
    pandoc_odt tmp.md "$pandoc_outfile" 
    echo "Converted $file to $outfile"
done

echo "Resolving cross-references in float files..."
xref-list xref.aux config/xref-labels.scm > tmp.log
mapfile -t floats < tmp.log

# Process float files in the order of the labels from xref.aux
cat config/odt.yaml chapters/head.yaml chapters/copyright.md > tmp.md # replace
cat "${floats[@]}" | xref >> tmp.md # append

echo "Converting float files to single ODT doc..."
pandoc_odt tmp.md odt/floats.odt
echo "Output to odt/floats.odt"

rm input.ent xref.aux tmp.md tmp.log

exit 0


