SHELL = /bin/sh

poems := img/$(patsubst %.tex,%.pdf,$(wildcard ./poem-examples/*.tex))
tables := img/$(patsubst %.tex,%.pdf,$(wildcard ./tables/*.tex))
music := img/$(patsubst %.ly,%.pdf,$(wildcard ./music-examples/*.ly))

define mv-cropped = 
pdfcrop aux/$* 
mv aux/$*-crop.pdf img/$*.pdf
endef

.PHONY : all clean

all : ./main.pdf

main.pdf : ./main.tex $(poems) $(tables) $(music)
	latexmk -outdir=aux -pdf main
	mv aux/main.pdf pdf/

vpath %.tex poem-examples tables
%.pdf : %.tex
	latexmk -outdir=aux/$(<D) -silent -pdf $*
	$(mv-cropped)

vpath %.ly music-examples
%.pdf : %.ly
	lilypond -I ~/ly $*
	mv $(@F) aux/$(<D)
	$(mv-cropped)

clean : 
	-rm aux/*.* aux/*/*.* img/*/*.*

