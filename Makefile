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
build-subdirs 	:= $(addprefix build/,odt poem-examples tables music-examples)
dirs 		:= aux aux/chapters build $(build-subdirs)

# FILES
## Main source and target
chapters 	= $(wildcard chapters/*.tex)
convert-chapters = $(wildcard convert/*.tex)

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

# COMMANDS
dolatex = latexmk -pdf -outdir=aux 

#************************************************************************
# RULES
.PHONY : all FORCE odt view clean 

## Full document LaTeX->PDF

#   Compile everything with just `make`
all : build/main.pdf

### Create needed directories
$(dirs) :
	mkdir -p $(dirs)

### Build dirs and floats first; use pattern rule above for LaTeX compilation
aux/main.pdf : main.tex vcbook.cls master.bib $(chapters) FORCE | $(dirs) $(floats)
	$(dolatex) $<

build/main.pdf : aux/main.pdf 
	mv $< $@

.SECONDARY : aux/main.pdf

#************************************************************************
## Each chapter LaTeX->ODT

odt_input	:= $(foreach chapter,$(convert-chapters),$(notdir $(chapter)))
odt_output 	:= $(odt_input:%.tex=build/odt/%.odt)
tmp		= *.4ct *.4tc *.aux *.bbl *.bcf *.blg *.dvi \
		  *.fdb_latexmk *.fls *.idv *.log \
		  *.lof *.lot *.mux *.pox *.toc \
		  *.lg *.log *.run.xml *.tmp *.xref \
		  *.4oo *.4os *.4of *.out

odt : $(odt_output)

build/odt/%.odt : convert/%.tex %.aux %.bbl | $(dirs)
	make4ht -u -f odt $<
	mv $(@F) $@

%.aux : main-odt.aux
	cp $< $@

%.bbl : main-odt.bbl
	cp $< $@

main-odt.aux main-odt.bcf : main-odt.tex
	latex '\def\excerpt{} \input{$<}'

main-odt.bbl : main-odt.bcf
	biber $<



#************************************************************************
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

#************************************************************************
# VIEW PDF output when done
view : build/main.pdf
	xpdf $< &

# CLEANUP
clean : 
	-rm -rf aux
	-rm -rf $(tmp)
	-rm -rf chapters/*.aux

clobber : clean
	-rm -rf build

