# `vcbook`

| Copyright @ 2018 Andrew A. Cashner
| <acashner@ur.rochester.edu>

First monograph, on villancicos

## Compilation to single PDF

Makefile compiles whole document to PDF plus all included subfiles for the
floats.  
These include separate LaTeX files for the tables and poem examples, and
Lilypond files for the music examples.

## Conversion to ODT, one per chapter

Makefile also creates separate ODT files for each chapter with correct
cross-references and bibliography spanning the whole document.

## Requirements

- TeXLive 2018 (includes `pdfcrop`)
- Lilypond 2.19.\*
- GNU Make
- Bash shell and Unix-like tools

## Summary of build commands

Goal                    Command
--------------------    ----------------------
Single PDF              `make` or `make pdf`
ODTs per chapter        `make odt`
Clean up                `make clean`
Total reset             `make clobber`
Reset + PDF + ODT       `make all`





