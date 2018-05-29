SHELL = /bin/sh

$(guile (load "./scripts/make-floats.scm"))

# DEPENDENCIES
# Track changes in included .tex files
text-depends := \
    ./main.tex ./vcbook.cls \
    $(wildcard ./chapters/*.tex)

music-depends := $(wildcard ./music-examples/*.ly)
poem-depends  := $(wildcard ./poem-examples/*.tex)
table-depends := $(wildcard ./tables/*.tex)

# TARGETS
# Single document output of LaTeX compilation
main-pdf = ./pdf/main.pdf

# Multiple PDF outputs of float compilation
music-pdfs := $(wildcard ./img/music-examples/*.pdf)
poem-pdfs  := $(wildcard ./img/poem-examples/*.pdf)
table-pdfs := $(wildcard ./img/tables/*.pdf)

# RULES
.PHONY :	all clean refresh

# Default rule: Just 'make' does it all
all :		main-pdf

# Compare output targets to input dependencies and recompile if needed
# Latexmk does its own dependency tracking additionally
main-pdf :	music-pdfs poem-pdfs table-pdfs $(text-depends) 
	latexmk -outdir=aux -pdf main
	cp ./aux/main.pdf $(main-pdf)

# Guile script compiles floats and moves them to img/ subdir
music-pdfs :	$(music-depends)
	$(guile (make-floats 'music))

poem-pdfs : $(poem-depends)
	$(guile (make-floats 'poem))

table-pdfs : $(table-depends)
	$(guile (make-floats 'table))

clean :
	rm -f ./aux/*.* ./aux/*/*.*

refresh : clean
	rm -f img/*/*.pdf 
	rm -i pdf/main.pdf
