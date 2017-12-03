METADATA = master.yaml
TEXT = chapters/chapter-*.md
INCLUDES = $(METADATA) $(TEXT)

GLOBAL-OPTIONS = \
    --filter pandoc-citeproc 

PDF-OUTFILE = pdf/all.pdf
PDF-SETTINGS = config/pdf.yaml
TEX-HEADER = config/ms.tex
PDF-OPTIONS = \
    --latex-engine xelatex \
    --top-level-division part \
    --table-of-contents \
    --include-in-header $(TEX-HEADER) 
PDF-INCLUDES = $(PDF-SETTINGS) $(INCLUDES)
PANDOC-PDF = pandoc \
    $(GLOBAL-OPTIONS) \
    $(PDF-OPTIONS) \
    -o $(PDF-OUTFILE)

ODT-OUTFILE = odt/all.odt
ODT-SETTINGS = config/vcbook.odt
ODT-OPTIONS = \
    --smart \
    --reference-odt $(ODT-SETTINGS) 
ODT-INCLUDES = $(INCLUDES)
PANDOC-ODT = pandoc \
    $(GLOBAL-OPTIONS) \
    $(ODT-OPTIONS) \
    -o $(ODT-OUTFILE)

TARGETS = $(PDF-OUTFILE) $(ODT-OUTFILE)

all : $(TARGETS)

pdf : $(PDF-OUTFILE)

odt : $(ODT-OUTFILE)

$(PDF-OUTFILE) : $(PDF-INCLUDES) $(TEX-HEADER)
	cat $(PDF-INCLUDES) | mdref | $(PANDOC-PDF)

$(ODT-OUTFILE) : $(ODT-INCLUDES)
	cat $(ODT-INCLUDES) | mdref | $(PANDOC-ODT)


