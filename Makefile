METADATA = master.yaml
TEXT = chapters/chapter-*.md
INCLUDES = $(METADATA) $(TEXT)

PDF-OUTFILE = pdf/all.pdf
PDF-SETTINGS = config/pdf.yaml
TEX-HEADER = config/ms.tex
PDF-INCLUDES = $(PDF-SETTINGS) $(INCLUDES)
PANDOC-PDF = pandoc --latex-engine xelatex \
    --include-in-header $(TEX-HEADER) \
    --filter pandoc-citeproc -o $(PDF-OUTFILE)

ODT-OUTFILE = odt/all.odt
ODT-INCLUDES = $(INCLUDES)
PANDOC-ODT = pandoc --filter pandoc-citeproc -S -o $(ODT-OUTFILE)

TARGETS = $(PDF-OUTFILE) $(ODT-OUTFILE)

all : $(TARGETS)

pdf : $(PDF-OUTFILE)

odt : $(ODT-OUTFILE)

$(PDF-OUTFILE) : $(PDF-INCLUDES) $(TEX-HEADER)
	cat $(PDF-INCLUDES) | mdref | $(PANDOC-PDF)

$(ODT-OUTFILE) : $(ODT-INCLUDES)
	cat $(ODT-INCLUDES) | mdref | $(PANDOC-ODT)


