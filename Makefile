# Makefile for monograph on villancicos
# Andrew A. Cashner

# 2018/07/30 	Working version to create both PDF and ODT, with float files
# 		separately compiled as PDFs
# 2018/06/02	Begun

# (1-a) Compile LaTeX document controlled by master file main.tex to PDF.
# LaTeX includes chapter files, bibliography automatically.
# Style determined by vcbook.sty.
#
# (1-b) Track and compile included floats (LaTeX or Lilypond) separately from
# main LaTeX file; put main output in build/main.pdf and included float PDFs in
# subdirs under build/.
# Style determined by vcfloat.sty (for LaTeX) and ~/ly/villancico.ly  and
# ~/ly/example.ly (for Lilypond).
#
# (2) Convert LaTeX document controlled by master file main-odt.tex and
# convert/*.tex to ODT files, one per chapter.
# Style determined by vcbook-convert.sty.
# First compile main-odt.tex to get bibliography and aux files that will allow
# cross-references and bibliography to span across chapter files.
# Floats are not included in ODT files (placeholder with filename is used
# instead).

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
table-src 	= $(wildcard tables/*.tex)
poem-src 	= $(wildcard poem-examples/*.tex)
music-src 	= $(wildcard music-examples/*.ly)
dia-src 	= $(wildcard diagrams/*.tex)
figure-src 	= $(wildcard figures/*.*)

tex-input	= $(chapters) $(table-src) $(poem-src)

## PDF outputs of compiling .tex and .ly files
pdf_output	= build/main.pdf
music-pdfs 	= $(music-src:%.ly=build/%.pdf)
figures 	= $(figure-src)

floats 		= $(music-pdfs) $(figures)

## ODT input and output
odt_input	:= $(foreach chapter,$(convert-chapters),$(notdir $(chapter)))
odt_output 	:= $(odt_input:%.tex=build/odt/%.odt)

# COMMANDS
dolatex = latexmk -lualatex -bibtex -outdir=aux -shell-escape

#************************************************************************
# RULES
.PHONY : pdf odt all view count clean clobber

# Default target 
## Full document LaTeX->PDF
pdf : $(pdf_output)

## Each chapter LaTeX->ODT
odt : $(odt_output)

all : clobber pdf odt 

### Create needed directories
$(dirs) :
	mkdir -p $(dirs)

### Build dirs and floats first; use pattern rule above for LaTeX compilation
$(pdf_output) : aux/main.pdf 
	mv $< $@

aux/main.pdf : main.tex vcbook.cls master.bib $(tex-input) | $(dirs) $(floats)
	$(dolatex) $<

.SECONDARY : aux/main.pdf

#************************************************************************
## Each chapter LaTeX->ODT

#  Produce a separate ODT file for each chapter, but using bibliography and
#  cross-references from the full document.
#  First completely compile the full document (with latexmk) to get correct .bbl
#  and .aux files.
#  Change the .bbl file to the name of the included chapter file so that make4ht
#  will use it.
#  Make tex4ht use the aux files for each chapter in the chapters/ dir that were
#  already generated by latexmk for the whole doc.

build/odt/%.odt : convert/%.tex %.bbl 
	cp aux/chapters/*.aux chapters/
	make4ht -u -f odt $<
	mv $(@F) $@
	mv $(notdir $(<:%.tex=%*.*)) aux/

%.bbl : aux/main-odt.bbl
	cp $< $@

aux/main-odt.bbl : main-odt.tex | $(dirs)
	latexmk -dvi -bibtex -outdir=aux $<


#************************************************************************
## Floats for inclusion as separate PDFs in subdirectories
aux/%.pdf : poem-examples/%.tex vcfloat.cls
	$(dolatex) -silent $<

aux/%.pdf : music-examples/%.ly ~/ly
	lilypond -I ~/ly -o aux/$* --silent $< 

### Crop and move float PDFs to build subdirectories
$(foreach dir,$(build-subdirs),$(dir)/%.pdf) : aux/%.pdf
	pdfcrop $< $@

#************************************************************************
# VIEW
view : pdf
	evince $(pdf_output) &>/dev/null &

# COUNT
count : pdf
	pdftotext $(pdf_output) - | wc -w
#************************************************************************
# CLEANUP
clean : 
	-rm -rf aux
	-rm -rf chapters/*.aux

clobber : clean
	-rm -rf build

