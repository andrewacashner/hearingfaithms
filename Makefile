SHELL = /bin/sh

$(guile (load "./scripts/make-floats.scm"))

float_inputs = $(shell find ./*/src/* -type f \( -name "*.tex" -o -name "*.ly" \))
float_outputs = $(shell find ./img/*/ -type f -name "*.pdf")


all : $(float_outputs)

floats : $(float_outputs)

$(float_outputs) : $(float_inputs)
	$(guile (make-all-floats))

clean : 
	rm aux/*

.PHONY : floats

