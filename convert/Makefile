input 		= $(wildcard main-*.tex)
chapters 	= $(patsubst main-%,chapter-%,$(input))
output 	 	= $(addprefix $(build)/,$(patsubst %.tex,%.odt,$(input)))
build 	 	= build
aux		= aux
dirs		= $(build) $(aux)
auxfiles	= *.aux *.4ct *.4tc *.bbl *.bcf *.blg *.dvi *.idv \
		  *.lg *.log *.run.xml *.tmp *.xref

.PHONY 		: all clean clobber

all 		: $(output)

$(output) 	: | $(dirs) # Make build dir then use static pattern rule below 

$(dirs) :
	mkdir -p $(dirs)

$(build)/main-%.odt : main-%.tex chapter-%.tex title.tex vcbook-convert.sty
	latex --interaction=batchmode $<
	biber $(basename $<)
	mk4ht oolatex $<
	mv $(@F) $@
	mv $(auxfiles) $(aux)/

clean :
	-rm -rf $(aux)

clobber : clean
	-rm -rf $(build)
