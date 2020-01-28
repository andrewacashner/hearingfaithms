dirs = aux build

.PHONY : spain mexico view clean reset

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

