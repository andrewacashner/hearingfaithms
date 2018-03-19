#!/usr/bin/env sh

# Given aux file created by xref Scheme script, 
# use xref-list to parse sexp and make list of directory names where floats are
# stored; use substitutions in dirnames.sed to swap abbreviated labels 'fig' or
# 'poem' with full dir name 'figures' or 'poem-examples' and add '.md' extension

set -e 

cat - | 
    xref-list |
    egrep '^fig|^music|^poem|^table' |
    sed -E -f scripts/dirnames.sed 

exit 0
