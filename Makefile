SHELL = /bin/sh

$(guile (load "./scripts/make-scores.scm"))

target = main.pdf

.PHONY:	all

all:	target

target:	
	latexmk -outdir=aux -shell-escape -pdf main
	cp aux/main.pdf pdf/

scores:
	$(guile (make-scores))
	@echo Created scores

clean:
	rm aux/*.* aux/*/*.*
