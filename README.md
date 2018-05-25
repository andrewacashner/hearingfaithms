# `vcbook`

| Copyright @ 2018 Andrew A. Cashner
| <acashner@ur.rochester.edu>

First monograph, on villancicos

## Compilation to single PDF

Makefile uses `latexmk` with `lualatex`.
Custom class uses `standalone` and `lyluatex` packages to automatically track
and (re)build tables, poem examples, and music examples as needed.

- All: `make`
- Clean up: `make clean`

## Conversion to ODT, one per chapter

Makefile in `convert` directory is a stripped-down version of the main class
which uses *`pdflatex`* and does not include any floats, just the captions.

````
cd convert
make
````


