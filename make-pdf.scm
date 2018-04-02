(use-modules
  (ice-9 format)
  (shell filenames)
  (shell readwrite))

;; ****************

(define pandoc-options-pdf "\
--filter pandoc-citeproc \
--latex-engine xelatex \
--top-level-division part \
--table-of-contents \
--bibliography master.bib \
--csl chicago-fullnote-bibliography.csl")

(define md2pdf
  (lambda (infile)
    (let ([outfile (swap-ext infile ".pdf")])
      (system (format #f "pandoc ~a -o ~a ~a" 
                      pandoc-options-pdf outfile infile)))))

(define pdf-header-inputs
  '("config/pdf.yaml"
    "chapters/head.yaml"
    "chapters/copyright.md"))

;(let ([header (join-file-ls pdf-header-inputs)]))
