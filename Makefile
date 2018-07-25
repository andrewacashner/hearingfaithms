# Makefile for monograph on villancicos
# Andrew A. Cashner
# 2018/06/02
# 
# Track and compile included floats (LaTeX or Lilypond) separately from main
# LaTeX file;
# put main output in build/main.pdf and included float PDFs in subdirs under
# build/

SHELL = /bin/sh

# DIRECTORIES
#   Process in aux; Put results in build 
#   Subdirectories in build match directory of source file
build-subdirs 	:= $(addprefix build/,poem-examples tables music-examples)
dirs 		:= aux aux/chapters build $(build-subdirs)

# FILES
## Main source and target
chapters 	= $(wildcard chapters/*.tex)

## Sources and targets for included float files
poem-src 	= $(wildcard poem-examples/*.tex)
table-src 	= $(wildcard tables/*.tex)
music-src 	= $(wildcard music-examples/*.ly)
figure-src 	= $(wildcard figures/*.*)

## PDF outputs of compiling .tex and .ly files
poem-pdfs 	= $(poem-src:%.tex=build/%.pdf)
table-pdfs 	= $(table-src:%.tex=build/%.pdf)
music-pdfs 	= $(music-src:%.ly=build/%.pdf)
figures 	= $(figure-src)

floats 		= $(poem-pdfs) $(table-pdfs) $(music-pdfs) $(figures)

no-build	= master.bib $(wildcard *.cls) $(chapters) ~/ly $(figures)

# RULES
.PHONY : all view clean 

#   Compile everything with just `make`
all : build/main.pdf

# COMMANDS
dolatex = latexmk -pdf -outdir=aux 

## Full document LaTeX->PDF

### Create needed directories
$(dirs) :
	mkdir -p $(dirs)

### Build dirs and floats first; use pattern rule above for LaTeX compilation
aux/main.pdf : main.tex vcbook.cls master.bib $(chapters) | $(dirs) $(floats)
	$(dolatex) $<

build/main.pdf : aux/main.pdf 
	mv $< $@

.SECONDARY : aux/main.pdf

### Empty rules: Don't try to build these
$(no-build) : ;

## Floats for inclusion as separate PDFs in subdirectories
aux/%.pdf : poem-examples/%.tex vcfloat.cls
	$(dolatex) -silent $<

aux/%.pdf : tables/%.tex vcfloat.cls
	$(dolatex) -silent $<

aux/%.pdf : music-examples/%.ly ~/ly
	lilypond -I ~/ly -o aux/$* --silent $< 

### Crop and move float PDFs to build subdirectories
$(foreach dir,$(build-subdirs),$(dir)/%.pdf) : aux/%.pdf
	pdfcrop $< $@

# VIEW PDF output when done
view : build/main.pdf
	xpdf $< &

# CLEANUP
clean : 
	-rm -rf aux

clobber : clean
	-rm -rf build

