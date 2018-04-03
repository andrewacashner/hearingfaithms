(use-modules
  (ice-9 format)
  (xref xref)
  (xref xref-list)
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

(define pdf-input-before
  '("config/pdf.yaml"
    "chapters/head.yaml"
    "chapters/copyright.md"))

(define pdf-input-after
  '("chapters/floats.md"))

(define make-crossrefs
  (lambda (chapter-ls auxfile outfile)
    (let* ([infiles (append pdf-input-before 
                            chapter-ls 
                            pdf-input-after)]
      [text (file-ls->string infiles)])
    (do-xref text auxfile outfile)))) 
; avoid outfile?

(define do-make-pdf
  (lambda chapter-ls
    (begin 
      (make-crossrefs chapter-ls "xref.aux" "tmp.md")
      (let* ([filenames (xref-list "xref.aux" "config/xref-labels.scm")]
             [text (file-ls->string filenames)])
        (do-xref text "xref.aux" "tmp2.md"))
      (join-files "tmp.md" "tmp2.md") ; instead append from do-xref?
      (md2pdf "tmp.pdf")))) ; add outfile name



;; xref-list make list of filenames from auxfile
;; input float files from list to xref
;; xref all together and append text to tmp
;; run pandoc on tmp -> output-pdf

