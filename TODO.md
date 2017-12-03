- Add 'langid' entries for foreign-language items in bibliography
- You will have to make a separate bibliography chapter for the publisher (this
  may include more than what is cited anyway, primary sources, etc.); you could
  extract cited sources in single bib by using pandoc to generate .tex, running
  `pdflatex`, then running `biber --output-format=bibtex file.bcf`; or you could
  manually add keywords to everything cited in bibliography (!)
  + Use `suppress-bibliography: true` in YAML to create each chapter without
    automatic bibliography at end; but this won't work to create final
    bibliography; may have to modify .csl file
- If you want to insert TOC automatically, sort of, in ODT, add to ODT-OPTIONS
  in makefile, which uses custom template:  `--template
  config/vcbook.opendocument --variable=toc-title:'Contents'`
  + Otherwise you don't need the custom template. You would have to make
    LibreOffice insert the TOC manually anyway; but publisher doesn't need it?
- Create build directory with necessary structure of files, subdirectories for
  figures, etc. as publisher wants

