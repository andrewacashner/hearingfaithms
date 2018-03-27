#!/bin/sh

set -e

for infile in ./tables/tex/*.tex; do
    filename="$(basename $infile)"
    pdf_file="${filename%.tex}.pdf"
    pdf_crop_file="${filename%.tex}-crop.pdf"
    latexmk -outdir=aux -pdfxe "$infile" 
    pdfcrop "aux/$pdf_file"
    mv "aux/$pdf_crop_file" ./img/tables/"$pdf_file"
    echo "Created PDF cropped table $pdf_file"
done

exit 0
