all: 
	latexmk -outdir=aux -bibtex -pdf main 
	cp aux/main.pdf ./

clean:
	rm main.pdf aux/*.* aux/*/*.* 
