#!/bin/sh

# TODO set up as makefile to track dependencies

set -e

# Compile TeX files
function tex_compile() {
    infile="$1"
    latexmk -outdir=aux -pdfxe "$infile"
}

# Compile Lilypond files
function lily_compile() {
    infile="$1"

    pdf_file="${infile%.ly}.pdf"
    outfile="$(basename $pdf_file)"
    
    lilypond -I "$HOME/ly" "$infile"
    mv "$outfile" aux/
}
    

# Move result to img directory in appropriate subfolder
function move_to_img() {
    infile="$1"
    outfile="$2"
    dir="$3"

    mv "aux/$infile" "img/$dir/$outfile"
    echo "*** Created new image file img/$dir/$outfile ***"
}


function move_uncropped_to_img() {
    infile="$(basename $1)"
    outdir="$2"

    pdf_file="${infile%.*}.pdf"

    move_to_img "$pdf_file" "$pdf_file" "$outdir"
}

function move_cropped_to_img() {
    infile="$(basename $1)"
    outdir="$2"

    pdf_file="${infile%.*}.pdf"
    pdf_crop_file="${infile%.*}-crop.pdf"

    pdfcrop "aux/$pdf_file"
    move_to_img "$pdf_crop_file" "$pdf_file" "$outdir"
}


# Compile and move files of specific types
function make_tables() {
    for infile in tables/src/*.tex; do
        tex_compile "$infile"
        move_cropped_to_img "$infile" tables
    done
}

function make_poem_examples() {
    for infile in poem-examples/src/*.tex; do
        tex_compile "$infile"
        move_uncropped_to_img "$infile" poem-examples
    done
}

function make_music_examples() {
    for infile in music-examples/src/*.ly; do
        lily_compile "$infile"
        move_cropped_to_img "$infile" music-examples
    done
}

make_tables
make_poem_examples
make_music_examples

exit 0
