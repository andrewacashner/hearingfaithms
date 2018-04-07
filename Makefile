SHELL = /bin/sh

$(guile (load "./scripts/make-floats.scm"))
$(guile (load "./scripts/make-text.scm"))

float_inputs := $(wildcard ./*/src/*.*)
text_inputs := $(wildcard ./chapters/chapter-*.md)

floats := $(wildcard ./img/*/*.*)
pdf = "pdf/all.pdf"

all : floats pdf clean

.PHONY : all

floats : $(float_inputs)
	$(guile (make-all-floats))

pdf : $(text_inputs)
	$(guile (make-all-pdf))

clean : 
	rm aux/*.*



