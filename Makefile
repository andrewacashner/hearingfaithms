# Makefile for monograph on villancicos
# Andrew A. Cashner

# 2019/05/29	Streamlined for LaTeX->PDF with all standalone floats
# 2018/07/30 	Working version to create both PDF and ODT, with float files
# 		separately compiled as PDFs
# 2018/06/02	Begun

# (1-a) Compile LaTeX document controlled by master file main.tex to PDF.
# LaTeX includes chapter files, bibliography automatically.
# Style determined by vcbook.cls, which in turn calls vcbook-format.sty and
# vcbook-macros.sty.
#
# (1-b) Track and compile included floats (LaTeX or Lilypond) separately from
# main LaTeX file; put main output in build/main.pdf and included float PDFs in
# subdirs under build/.
# Style determined by vcbook-float.cls (for LaTeX, with class options to
# indicate poem, table, or dia[gram]) and ~/ly/villancico.ly  and
# ~/ly/example.ly (for Lilypond).

# DIRECTORIES
#   Process in aux; Put results in build 
#   Subdirectories in build match directory of source file
build-pdf-dirs  := $(addprefix build/,diagrams music-examples poem-examples tables)
dirs 		:= aux aux/chapters build $(build-pdf-dirs) build/figures

# FILES
## Main source and subfiles
main		= main.tex
chapters 	= $(wildcard chapters/*.tex)

## Sources and targets for included float files
dia-src 	= $(wildcard diagrams/*.tex)
figure-src 	= $(wildcard figures/*.jpg)
music-src 	= $(wildcard music-examples/*.ly)
poem-src 	= $(wildcard poem-examples/*.tex)
table-src 	= $(wildcard tables/*.tex)

tex-input	= $(chapters) master.bib
tex-floats	= $(dia-src) $(poem-src) $(table-src)
ly-floats	= $(music-src)

## PDF outputs of compiling .tex and .ly files
pdf-output	= $(addprefix build/,$(main:%.tex=%.pdf))
aux-output	= $(addprefix aux/,$(main:%.tex=%.pdf))
tex-float-pdfs	= $(addprefix build/,$(tex-floats:%.tex=%.pdf))
ly-float-pdfs 	= $(addprefix build/,$(music-src:%.ly=%.pdf))
figures 	= $(addprefix build/,$(figure-src))

floats 		= $(tex-float-pdfs) $(ly-float-pdfs) $(figures)

## Configuration files
tex-config	= $(wildcard *.cls *.sty)
ly-dir		= $(HOME)/ly
ly-config	= $(wildcard $(ly-dir)/*.ly) # replace with local files

# COMMANDS
dolatex = latexmk -pdfxe -outdir=aux
quiet   = &>/dev/null &

#************************************************************************
# RULES
.PHONY : all view count clean reset

# Default target 
## Full document LaTeX->PDF
all : $(pdf-output)

### Create needed directories
$(dirs) :
	mkdir -p $(dirs)

### Build dirs and floats first; use pattern rule above for LaTeX compilation
$(pdf-output) : $(aux-output)
	mv $< $@

$(aux-output) : $(main) $(tex-config) $(tex-input) | $(dirs) $(floats)
	$(dolatex) $<

.SECONDARY : $(aux-output)

#************************************************************************
## Floats for inclusion as separate PDFs in subdirectories
aux/%.pdf : diagrams/%.tex 
	$(dolatex) -silent $<

aux/%.pdf : poem-examples/%.tex 
	$(dolatex) -silent $<

aux/%.pdf : tables/%.tex 
	$(dolatex) -silent $<

aux/%.pdf : music-examples/%.ly 
	lilypond -I $(ly-dir) -o aux/$* --silent $< 

### Crop and move float PDFs to build subdirectories
$(foreach dir,$(build-pdf-dirs),$(dir)/%.pdf) : aux/%.pdf
	pdfcrop $< $@
	rm $<

## Just copy figures
build/figures/%.jpg : figures/%.jpg
	cp -n $< $@

#************************************************************************
# VIEW
view : all
	evince $(pdf-output) $(quiet)

# COUNT
count : all
	pdftotext $(pdf-output) - | wc -w

#************************************************************************
# CLEANUP
clean : 
	-rm -rf aux

reset : clean
	-rm -rf build

