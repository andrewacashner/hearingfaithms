SHELL = /bin/sh

$(guile (load "./scripts/make-floats.scm"))

float_inputs := $(wildcard ./*/src/*.*)

floats : $(float_inputs)
	$(guile (make-all-floats))

all : floats

clean : 
	rm aux/*.*

.PHONY : all

