# `vcbook`

| Copyright @ 2018 Andrew A. Cashner
| <acashner@ur.rochester.edu>

First monograph, on villancicos

## Compilation to single PDF

Makefile compiles whole document plus all included subfiles for the floats.
These include separate LaTeX files for the tables and poem examples, and
Lilypond files for the music examples.

- All: `make`
- Clean up aux files: `make clean`
- Start over completely: `make clobber`

## Conversion to ODT, one per chapter

Makefile in `convert` directory is a stripped-down version of the main class
which uses *`pdflatex`* and does not include any floats, just the captions.

````
cd convert
make
````


