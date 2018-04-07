;; make-text.scm
;; Andrew Cashner, 2018/04/06

;; Make single PDF of selected chapters and corresponding floats
;; - make labels ls from chapters
;; - assemble float files in order from label ls
;; - replace refs in all files with numbers from label ls
;; - replace labels in all files with appropriate string
;; - process files all together with configuration files via pandoc to PDF

;; Make separate ODTs of selected chapters and corresponding floats
;; - make labels ls from chapters
;; - assemble float files in order from label ls
;; - replace refs wtih numbers and labels with strings in EACH file, then
;;   process EACH via pandoc to PDF


(use-modules 
  (xref reflabels)
  (xref listfiles)
  (shell readwrite)
  (ice-9 popen))

(define pandoc-pdf-opts "\
--filter pandoc-citeproc \
--latex-engine xelatex \
--top-level-division part \
--table-of-contents \
--bibliography master.bib \
--csl chicago-fullnote-bibliography.csl \
")

(define pandoc-cmd
  (lambda (outfile)
    (format #f "pandoc ~a -o ~a" pandoc-pdf-opts outfile)))

(define md->pdf
  (lambda chapters
    (let* ([outfile     "pdf/all.pdf"]

           [headers     '("config/pdf.yaml" "chapters/head.yaml")]
           [backmatter  '("chapters/floats.md")]

           [config      "config/xref-labels.scm"]
           [config      (call-with-input-file config read)]

           ; need input.ent or latexmk won't work
           [endnotefile "input.ent"]
           [endnotes    (call-with-output-file 
                          endnotefile
                          (lambda (port) (write '() port)))]

           [files       (append headers chapters backmatter)]
           [text        (file-ls->string files)]

           [labels      (list-labels text '())]

           [floatfiles  (labels->files labels config)]
           [float-text  (file-ls->string floatfiles)]

           [text        (string-append text float-text)]
           [text        (replace-refs text labels)]
           [text        (replace-labels text)]

           [pandoc-cmd  (pandoc-cmd outfile)]
           [pandoc-port (open-output-pipe pandoc-cmd)]
           [pandoc-cmd  (display text pandoc-port)])

      (begin
        (close-pipe pandoc-port)
        (delete-file endnotefile)
        #f))))

(define make-all-pdf
  (lambda ()
    (md->pdf
      "chapters/chapter-1.md"
      "chapters/chapter-2.md"
      "chapters/chapter-3.md")))

