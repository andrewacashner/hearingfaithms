target = main.pdf

.PHONY:	all

all:	target

target:	
	latexmk -outdir=aux -shell-escape -pdf main
	cp aux/main.pdf pdf/

clean:
	rm aux/*.* aux/*/*.*
