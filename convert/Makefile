# Makefile for converting monograph chapters from LaTeX to ODT
# Andrew A. Cashner
# 2018/06/01
#
# For each main-#.tex with a corresponding chapter-#.tex (linked from
# ../chapters in main repository), use tex4ht to convert it to ODT, move result
# to build directory, and move auxiliary files to aux directory.

SHELL = /bin/sh

# FILES
input 		= $(wildcard main-*.tex)
output 	 	= $(addprefix $(build)/,$(patsubst %.tex,%.odt,$(input)))
build 	 	= build
aux		= aux
dirs		= $(build) $(aux)
auxfiles	= *.aux *.4ct *.4tc *.bbl *.bcf *.blg *.dvi *.idv \
		  *.lg *.log *.run.xml *.tmp *.xref

# RULES
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

view : $(output)
	libreoffice $(output) &

clean :
	-rm -rf $(aux)

clobber : clean
	-rm -rf $(build)
