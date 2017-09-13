MAIN=vcbook

all: 
	latexmk -outdir=aux -bibtex -pdf $(MAIN)
	cp aux/$(MAIN).pdf ./

clean:
	rm $(MAIN).pdf aux/*.* aux/*/*.* 
