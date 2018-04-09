SHELL = /bin/sh

$(guile (load "./scripts/make-floats.scm"))
$(guile (load "./scripts/make-text.scm"))

# INPUT dependencies
text_inputs := $(wildcard ./chapters/chapter-*.md)
float_inputs := $(wildcard ./*/src/*.*)

# OUTPUT targets
pdf = "pdf/all.pdf"
floats := $(wildcard ./img/*/*.*)

# BUILD rules

# Match inputs to PDF target, but make PDF and ODT
pdf : $(text_inputs)
	$(guile (make-all))
	@echo Converted to full-book PDF and single-chapter ODTs

floats : $(float_inputs)
	$(guile (make-all-floats))
	@echo Created float files

clean : 
	rm aux/*.* 



