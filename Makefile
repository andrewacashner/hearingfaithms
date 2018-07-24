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
# Process in aux-dir, put results in build-dir 
aux-dir 	:= aux
build-dir 	:= build

# Subdirectories in each match directory of source file
aux-subdirs	:= $(addprefix $(aux-dir)/,chapters)
build-subdirs 	:= $(addprefix $(build-dir)/,poem-examples tables music-examples)

dirs 		:= $(aux-dir) $(aux-subdirs) $(build-dir) $(build-subdirs)

# FILES
# Main source and target
main-src 	= main.tex
main-pdf 	= $(build-dir)/main.pdf
chapters 	= $(wildcard chapters/*.tex)

# Sources and targets for included float files
poem-src 	= $(wildcard poem-examples/*.tex)
table-src 	= $(wildcard tables/*.tex)
music-src 	= $(wildcard music-examples/*.ly)
figure-src 	= $(wildcard figures/*.*)

# PDF outputs of compiling .tex and .ly files
poem-pdfs 	= $(poem-src:%.tex=$(build-dir)/%.pdf)
table-pdfs 	= $(table-src:%.tex=$(build-dir)/%.pdf)
music-pdfs 	= $(music-src:%.ly=$(build-dir)/%.pdf)
figures 	= $(figure-src)

floats 		= $(poem-pdfs) $(table-pdfs) $(music-pdfs) $(figures)

# COMMANDS
latexmk		= latexmk -pdf -outdir=aux 
delete 		= -rm -rf

define lilypond-aux
lilypond -I ~/ly -o aux/$* $<
endef

# RULES
.PHONY : all view clean 

# Compile everything with just `make`
all : build/main.pdf

aux/main.pdf : main.tex vcbook.cls $(chapters) | $(dirs) $(floats) 
	$(latexmk) $<

build/main.pdf : aux/main.pdf
	mv $< $@

$(dirs) :
	mkdir -p $(dirs)

# Then make the floats: Just use static pattern rules defined below
$(poem-pdfs) $(table-pdfs) : vcfloat.cls 

$(music-pdfs) : ~/ly 

# Empty rules: Don't try to build these
$(figures) : ;

vcfloat.cls vcbook.cls ~/ly $(chapters) : ;

# Static pattern rules for floats in each directory
vpath %.tex poem-examples:tables
aux/%.pdf : %.tex
	$(latexmk) $<

vpath %.ly music-examples
aux/%.pdf : %.ly
	$(lilypond-aux)

build/poem-examples/%.pdf : aux/%.pdf
	pdfcrop $< $@

build/tables/%.pdf : aux/%.pdf
	pdfcrop $< $@

build/music-examples/%.pdf : aux/%.pdf
	pdfcrop $< $@

# VIEW PDF output when done
view : $(main-pdf)
	xpdf $< &

# CLEANUP
clean : 
	$(delete) aux

clobber : clean
	$(delete) build

