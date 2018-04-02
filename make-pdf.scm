(use-modules
  (ice-9 format)
  (xref xref)
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

(define make-crossrefs
  (lambda (chapter-ls)
    (let* ([infiles (append pdf-header-inputs 
                            chapter-ls
                           '("chapters/floats.md"))]
           [text (file-ls->string infiles)]
           [tmp (open-output-string)])
      (begin
        (display text tmp)
        (let ([tmp (open-input-string (get-output-string tmp))]) 
          (do-xref (list tmp)))))))

;; maybe you need a pipe!

