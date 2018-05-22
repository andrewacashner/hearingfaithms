ch2-base = main-2
ch2-in = $(ch2-base).tex chapter-2.tex
ch2-dvi = $(ch2-base).dvi
ch2-odt = $(ch2-base).odt

ch3-base = main-3
ch3-in = $(ch3-base).tex chapter-3.tex
ch3-dvi = $(ch3-base).dvi
ch3-odt = $(ch3-base).odt


.PHONY :	all ch2 ch3 clean refresh

all :		ch2 ch3 clean

ch2 :		$(ch2-odt)

ch3 :		$(ch3-odt)

$(ch2-odt) : 	$(ch2-dvi) 
	mk4ht oolatex $(ch2-base)

$(ch2-dvi) :	$(ch2-in)
	latex $(ch2-base)
	biber $(ch2-base)

$(ch3-odt) : 	$(ch3-dvi) 
	mk4ht oolatex $(ch3-base)

$(ch3-dvi) : 	$(ch3-in) 
	latex $(ch3-base)
	biber $(ch3-base)

clean :
	rm -f *.aux *.4ct *.4tc *.bbl *.bcf *.blg *.idv \
	    *.lg *.log *.run.xml *.tmp *.xref

refresh :
	rm -i *.odt *.dvi
