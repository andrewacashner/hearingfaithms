SHELL = /bin/sh

$(guile (load "./scripts/make-scores.scm"))

# DEPENDENCIES
# Track changes in included .tex files
text-depends := ./main.tex \
$(wildcard ./chapters/*.tex) \
$(wildcard ./poem-examples/*.tex) \
$(wildcard ./tables/*.tex)

# Track changes in included .ly files
score-depends := $(wildcard ./music-examples/*.ly)

# TARGETS
# Single document output of LaTeX compilation
main-pdf = ./pdf/main.pdf

# Multiple PDF outputs of Lilypond compilation
score-pdfs := $(wildcard ./img/music-examples/*.pdf)

# RULES
# Just 'make' does it all
.PHONY :	all

# Compare output targets to input dependencies and recompile if needed
all :		$(score-pdfs) $(main-pdf)

# Can manually recompile just scores with 'make scores'
scores : 	$(score-pdfs)

# Latexmk does its own dependency tracking
# LaTeX documentclass standalone package also tracks its input files and
# recompiles only when needed
$(main-pdf) :	$(score-depends) $(text-depends) 
	latexmk -outdir=aux -shell-escape -pdf main
	cp aux/main.pdf $(main-pdf)

# Guile script compiles all *.ly files and moves them to img/music-examples
$(score-pdfs) :	$(score-depends)
	$(guile (make-scores))

clean :
	rm aux/*.* aux/*/*.*
