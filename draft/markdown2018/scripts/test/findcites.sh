#!/bin/sh
# Find all cite keys in format @first:second, remove @, sort and delete
# duplicates
grep -ho -E '@[[:alnum:]]*:[[:alnum:]]*' chapter-*.md | tr -d '@' | sort -u > citas.txt
