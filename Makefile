SHELL = /bin/sh

# DEPENDENCIES
# Track changes in included .tex files
text-depends := ./main.tex ./vcbook.cls ./vcfloat.cls \
$(wildcard ./chapters/*.tex) \
$(wildcard ./music-examples/*.tex) \
$(wildcard ./poem-examples/*.tex) \
$(wildcard ./tables/*.tex) 

# TARGETS
# Single document output of LaTeX compilation
main-pdf = ./pdf/main.pdf

# RULES
.PHONY :	all clean

# Default rule: Just 'make' does it all
# Compare output targets to input dependencies and recompile if needed
all :		$(main-pdf)

# Latexmk does its own dependency tracking
# LaTeX documentclass standalone and lyluatex packages also track their input
# files and recompile only when needed
$(main-pdf) :	$(text-depends) 
	latexmk -lualatex -shell-escape -outdir=aux ./main
	cp ./aux/main.pdf $(main-pdf)

clean :
	rm ./aux/*.* ./aux/*/*.*
