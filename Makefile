# Makefile for monograph on villancicos
# Andrew A. Cashner
# 2018/05/30
# 
# Track and compile included floats (LaTeX or Lilypond) separately from main
# LaTeX file;
# put main output in build/main.pdf and included float PDFs in subdirs under
# build/

SHELL = /bin/sh

# DIRECTORIES
# Process in aux-dir, put results in build-dir 
aux-dir := aux
build-dir := build
dirs := $(aux-dir) $(build-dir)

# Subdirectories in each match directory of source file
aux-subdirs := $(addprefix $(aux-dir)/,chapters poem-examples tables music-examples)
build-subdirs := $(addprefix $(build-dir)/,poem-examples tables music-examples)

# FILES
# Main source and target
main-src = main.tex
main-pdf = $(build-dir)/main.pdf

# Sources and targets for included float files
poem-src = $(wildcard poem-examples/*.tex)
table-src = $(wildcard tables/*.tex)
music-src = $(wildcard music-examples/*.ly)

# PDF outputs of compiling .tex and .ly files
poem-pdfs = $(addprefix $(build-dir)/,$(patsubst %.tex,%.pdf,$(poem-src)))
table-pdfs = $(addprefix $(build-dir)/,$(patsubst %.tex,%.pdf,$(table-src)))
music-pdfs = $(addprefix $(build-dir)/,$(patsubst %.ly,%.pdf,$(music-src)))
figures = $(wildcard figures/*.*)

build-floats = $(poem-pdfs) $(table-pdfs) $(music-pdfs)

# COMMANDS
pdflatex = pdflatex -output-directory=aux

# Use same subdirectory in aux as src
define pdflatex-subfile
pdflatex -output-directory=aux/$(<D) -interaction=batchmode $<
endef

biber = biber --output_directory=aux

lilypond = lilypond -I ~/ly --silent

# Use same subdirectory in aux as src, move to build dir
define mv-cropped
pdfcrop aux/$(<D)/$(@F) $@
endef

delete = -rm -rf

# RULES
.PHONY : all view clean 

# Compile everything with just `make`
all : $(main-pdf)

$(main-pdf) : $(main-src) vcbook.cls master.bib $(figures) $(build-floats)
	$(pdflatex) $<
	$(biber) $(basename $<)
	for i in {1..2} ; do $(pdflatex) $< ; done
	mv aux/$(@F) $@

# Create the aux and build directories before anything else
$(build-floats) : | $(dirs)

$(dirs) :
	mkdir -p $(aux-dir) $(aux-subdirs) $(build-dir) $(build-subdirs)

# Then make the floats
$(poem-pdfs) $(table-pdfs) : vcfloat.cls

$(poem-pdfs) : $(poem-src)

$(table-pdfs) : $(table-src)

$(music-pdfs) : $(music-src) ~/ly

# Static pattern rules for floats in each directory
vpath %.tex poem-examples 
build/poem-examples/%.pdf : %.tex
	for i in {1..3} ; do $(pdflatex-subfile) ; done
	$(mv-cropped)

vpath %.tex  tables
build/tables/%.pdf : %.tex
	$(pdflatex-subfile)
	$(mv-cropped)

vpath %.ly music-examples
build/music-examples/%.pdf : %.ly
	$(lilypond) $<
	mv $(@F) aux/$(<D)
	$(mv-cropped)

# VIEW PDF output when done
view : $(main-pdf)
	xpdf $< &

# CLEANUP
clean : 
	$(delete) aux

clobber : clean
	$(delete) build

