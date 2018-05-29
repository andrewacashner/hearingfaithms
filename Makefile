SHELL = /bin/sh

aux-dir := aux
build-dir := build
dirs := $(aux-dir) $(build-dir)

aux-subdirs := $(addprefix $(aux-dir)/,chapters poem-examples tables music-examples)
build-subdirs := $(addprefix $(build-dir)/,poem-examples tables music-examples)

main-src := main.tex
main-pdf := $(build-dir)/main.pdf

poem-src := $(wildcard poem-examples/*.tex)
table-src := $(wildcard tables/*.tex)
music-src := $(wildcard music-examples/*.ly)

poem-pdfs := $(addprefix $(build-dir)/,$(patsubst %.tex,%.pdf,$(poem-src)))
table-pdfs := $(addprefix $(build-dir)/,$(patsubst %.tex,%.pdf,$(table-src)))
music-pdfs := $(addprefix $(build-dir)/,$(patsubst %.ly,%.pdf,$(music-src)))
figures := figures/*.*

build-floats := $(poem-pdfs) $(table-pdfs) $(music-pdfs)

.PHONY : all clean 

all : $(main-pdf)

$(main-pdf) : $(main-src) vcbook.cls master.bib $(figures) $(build-floats)
	latexmk -outdir=aux -pdf $<
	mv aux/main.pdf $@

$(build-floats) : | $(dirs)

$(dirs) :
	mkdir -p $(aux-dir) $(aux-subdirs) $(build-dir) $(build-subdirs)

$(poem-pdfs) $(table-pdfs) : vcfloat.cls

$(poem-pdfs) : $(poem-src)

$(table-pdfs) : $(table-src)

$(music-pdfs) : $(music-src) ~/ly

vpath %.tex poem-examples tables
build/poem-examples/%.pdf build/tables/%.pdf : %.tex
	latexmk -outdir=aux/$(<D) -silent -pdf $<
	pdfcrop aux/$(<D)/$(@F) $@

vpath %.ly music-examples
build/music-examples/%.pdf : %.ly
	lilypond -I ~/ly $<
	mv $(@F) aux/$(<D)
	pdfcrop aux/$(<D)/$(@F) $@

clean : 
	-rm -rf aux

clobber : clean
	-rm -rf build

