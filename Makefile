# Andrew Cashner's book on villancicos for Brill
# Makefile, 2020/02/10
#
# Compile music examples to PDF with Lilypond
# Compile main LaTeX document, including those PDFs

# INPUT
# Main file
main_in		= main.tex

# TeX input subfiles
chapters_in	= $(wildcard chapters/*.tex)
poem_exx_in	= $(wildcard poem-examples/*.tex)
diagrams_in	= $(wildcard diagrams/*.tex)
tables_in	= $(wildcard tables/*.tex)
tex_subfiles	= $(chapters_in) $(poem_exx_in) $(diagrams_in) $(tables_in)

# Lilypond input files
ly_in_dir	= music-examples
ly_in 		= $(wildcard $(ly_in_dir)/*.ly)

# Figure source files
figures_in	= $(wildcard figures/*.jpg) # TODO preferred file format?

# Library files
ly_lib		= $(wildcard ly/*.ly)
tex_lib		= $(wildcard tex/*.cls) $(wildcard tex/*.sty) \
		  $(wildcard tex/*.tex)
bib		= tex/master.bib


# OUTPUT
# Destination directories
aux 		= aux
aux_chapters	= $(aux)/chapters
build 		= build
aux_music	= $(aux)/music-examples
music_out_dir	= $(build)/music-examples
figures_dir	= $(build)/figures
dirs		= $(aux) $(aux_music) $(aux_chapters) \
		  $(build) $(music_out_dir) $(figures_dir)

# Main output
main_out	= $(build)/Cashner-2020-Hearing_Faith.pdf

# Music example PDFs generated by Lilypond
music_exx_pdfs	= $(addprefix $(build)/,$(ly_in:%.ly=%.pdf))

# Figures in build dir
figures_out	= $(addprefix $(build)/,$(figures_in))

# Temporary files
main_aux	= $(addprefix $(aux)/,$(main_in:%.tex=%.pdf))
music_exx_crop	= $(addprefix $(aux)/,$(ly_in:%.ly=%.cropped.pdf))

latexmkrc	= tex/latexmkrc

# TARGETS and RULES
.PHONY : all ly count view clean reset 

# MAIN LATEX DOCUMENT
all : $(main_out)

# Compile main tex file to aux dir
$(main_aux) : $(main_in) $(tex_subfiles) $(tex_lib) $(bib) \
    $(music_exx_pdfs) $(figures_out) $(latexmkrc) | $(dirs)
	latexmk -r $(latexmkrc) $<

# LaTeX compilation options set in latexmkrc:
# - use xelatex to make PDF
# - send output to aux/
# - use texindy with UTF8 to make index

# Copy and rename result to build dir
# Clean up PDF fonts by postprocessing with Ghostscript
$(main_out) : $(main_aux)
	gs -o $@ -sDEVICE=pdfwrite -dPDFSETTINGS=/prepress $<


# LILYPOND MUSIC EXAMPLES
# Compile Lilypond PDFs to music_exx dir
# - Lilypond can crop its own PDFs but to do so it generates intermediate
#   *.cropped.png and *.cropped.pdf.
# - It can route output to a directory but only if the extension is left off and
#   only if relative includes are enabled.

ly : $(music_exx_pdfs)

$(music_exx_pdfs) : $(music_exx_crop)

$(music_exx_crop) : $(ly_in) $(ly_lib) | $(dirs)

$(music_out_dir)/%.pdf : $(aux_music)/%.cropped.pdf
	cp -u $< $@

$(aux_music)/%.cropped.pdf : $(ly_in_dir)/%.ly 
	lilypond -I $(PWD)/ly -dcrop -drelative-includes \
	    -o $(aux_music)/$* $<

# To reduce duplication of font subsetting and thereby the overall size of the
# main output PDF, add flag `-O TeX-GS` to Lilypond invocation. 
# But this renders the individual Lilypond PDFs unusable by themselves. 

# FIGURES
# Just copy the figures
$(figures_out) : $(figures_in)

build/figures/%.jpg : figures/%.jpg
	cp -u $< $@

# DIRECTORIES
# Make needed directories first
$(dirs) :
	mkdir -p $(dirs)

# WORD COUNT
# Count words from output PDF
count : all	
	pdftotext $(main_out) - | wc -w

# VIEW
# View output (and suppress console junk messages)
view : all
	evince $(main_out) &> /dev/null &

# CLEAN
# Clean up: clean removes aux, reset removes aux and build
clean : 
	rm -rf $(aux)

reset : clean
	rm -rf $(build)


