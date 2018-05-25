SHELL = /bin/sh

tex = ./main.tex
pdf = ./pdf/main.pdf

.PHONY : FORCE_MAKE clean

all : $(pdf)

$(pdf) : $(tex) FORCE_MAKE 
	latexmk -lualatex $(tex)

clean : 
	rm aux/*.* aux/*/*.* tmp-ly/*.*

