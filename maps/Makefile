dirs = aux build

.PHONY : all spain mexico view clean reset

all : spain mexico 

spain : build/spain.pdf 

mexico : build/mexico.pdf 

$(dirs) : 
	mkdir -p $(dirs)

build/%.pdf : aux/%.dvi
	dvipdf -dNOSAFER $< $@

aux/%.dvi : %.tex mapa.sty | $(dirs)
	latex -output-directory=aux $<

view :  
	evince build/*.pdf &> /dev/null &

clean : 
	rm -rf aux

reset : clean
	rm -rf build

