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
aux-dir 	:= aux
build-dir 	:= build
dirs 		:= $(aux-dir) $(build-dir)

# Subdirectories in each match directory of source file
aux-subdirs 	:= $(addprefix $(aux-dir)/,chapters poem-examples tables music-examples)
build-subdirs 	:= $(addprefix $(build-dir)/,poem-examples tables music-examples)

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
poem-pdfs 	= $(addprefix $(build-dir)/,$(patsubst %.tex,%.pdf,$(poem-src)))
table-pdfs 	= $(addprefix $(build-dir)/,$(patsubst %.tex,%.pdf,$(table-src)))
music-pdfs 	= $(addprefix $(build-dir)/,$(patsubst %.ly,%.pdf,$(music-src)))
figures 	= $(figure-src)

floats 		= $(poem-pdfs) $(table-pdfs) $(music-pdfs) $(figures)

# COMMANDS
latexmk		= latexmk -pdf -bibtex -outdir=aux -silent 
lilypond 	= lilypond -I ~/ly --silent
delete 		= -rm -rf

# Use same subdirectory in aux as src
define pdflatex-subfile
pdflatex -output-directory=aux/$(<D) -interaction=batchmode $<
endef

# Use same subdirectory in aux as src, move to build dir
define mv-cropped
pdfcrop aux/$(<D)/$(@F) $@
endef


# RULES
.PHONY : all view clean 

# Compile everything with just `make`
all : $(main-pdf)

$(build-dir)/%.pdf : %.tex vcbook.cls $(chapters) $(floats)
	$(latexmk) $<
	mv aux/$(@F) $@

.DELETE_ON_ERROR : $(main-pdf)

# Create the aux and build directories before anything else
$(floats) : | $(dirs)

$(dirs) :
	mkdir -p $(aux-dir) $(aux-subdirs) $(build-dir) $(build-subdirs)

# Then make the floats
$(poem-pdfs) $(table-pdfs) : vcfloat.cls

$(poem-pdfs)  : $(poem-src)

$(table-pdfs) : $(table-src)

$(music-pdfs) : $(music-src) ~/ly

# Static pattern rules for floats in each directory
vpath %.tex poem-examples 
build/poem-examples/%.pdf : %.tex
	for i in {1..2} ; do $(pdflatex-subfile) ; done
	$(mv-cropped)

vpath %.tex tables
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

