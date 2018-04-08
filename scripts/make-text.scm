;; make-text.scm
;; Andrew Cashner, 2018/04/06

(use-modules 
  (xref reflabels)
  (xref listfiles)
  (shell filenames)
  (shell readwrite)
  (ice-9 popen))

;; Make single PDF of selected chapters and corresponding floats
;; - make labels ls from chapters
;; - assemble float files in order from label ls
;; - replace refs in all files with numbers from label ls
;; - replace labels in all files with appropriate string
;; - process files all together with configuration files via pandoc to PDF

(define chapter-files
  '("chapters/chapter-1.md"
    "chapters/chapter-2.md"
    "chapters/chapter-3.md"))

(define pandoc-opts-pdf "\
--filter pandoc-citeproc \
--latex-engine xelatex \
--top-level-division part \
--table-of-contents \
--bibliography master.bib \
--csl chicago-fullnote-bibliography.csl \
")

(define pandoc-opts-odt "\
--filter pandoc-citeproc \
--smart \
--reference-odt config/vcbook.odt \
--bibliography master.bib \
--csl chicago-fullnote-bibliography.csl \
")
 
(define pandoc-cmd
  (lambda (opts outfile)
    (format #f "pandoc ~a -o ~a" opts outfile)))

(define pandoc-pipe
  (lambda (str opts outfile)
    (let* ([pandoc-str (pandoc-cmd opts outfile)]
           [pandoc-port (open-output-pipe pandoc-str)]
           [do-pandoc (display str pandoc-port)])
      (begin
        (close-pipe pandoc-port)
        #f))))
 
(define files->pandoc
  (lambda (type labels ls outfile)
    (let* ([text (file-ls->string ls)]
           [text (replace-refs text labels)]
           [text (replace-labels text)]
           [opts (cond
                   [(eq? type 'pdf) pandoc-opts-pdf]
                   [(eq? type 'odt) pandoc-opts-odt]
                   [else ""])])
      (pandoc-pipe text opts outfile))))

(define touch-file
  (lambda (file)
      (call-with-output-file 
        file 
        (lambda (port) 
          (write '() port)))))

(define make-labels
  (lambda (files ls)
    (let* ([text (file-ls->string files)])
      (list-labels text ls))))
           
(define md->pdf
  (lambda (chapters)
    (let* ([outfile     "pdf/all.pdf"]

           [headers     '("config/pdf.yaml" "chapters/head.yaml")]
           [backmatter  '("chapters/floats.md")]

           [config      "config/xref-labels.scm"]
           [config      (call-with-input-file config read)]

           ; need input.ent or latexmk won't work
           [endnotefile "input.ent"]
           [endnotes    (touch-file endnotefile)]

           [files       (append headers chapters backmatter)]
           [labels      (make-labels files '())]

           [floatfiles  (labels->files labels config)]
           [allfiles    (append files floatfiles)])

      (begin
        (files->pandoc 'pdf labels allfiles outfile)
        (delete-file endnotefile)
        #f))))

(define make-all-pdf
  (lambda ()
    (md->pdf chapter-files)))

;; Make separate ODTs of selected chapters and corresponding floats
;; - make labels ls from chapters
;; - assemble float files in order from label ls
;; - replace refs wtih numbers and labels with strings in EACH file, then
;;   process EACH via pandoc to PDF

(define md->odt
  (lambda (chapters)
    (let* ([headers '("config/odt.yaml" "chapters/head.yaml")] 
           [backmatter '("chapters/floats.md")]

           [config "config/xref-labels.scm"]
           [config (call-with-input-file config read)]

           [endnotefile "input.ent"]
           [endnotes (touch-file endnotefile)]

           [files-all (append headers chapters backmatter)]
           [labels (make-labels files-all '())]

           [float-output "odt/floats.odt"]
           [floatfiles (labels->files labels config)]
           [floatfiles (append headers backmatter floatfiles)])
      (begin
        (files->pandoc 'odt labels floatfiles float-output)
        (let loop ([ch-ls chapters])
          (if (null? ch-ls)
              (begin
                (delete-file endnotefile)
                #f)

              (let* ([chapter (car ch-ls)]
                     [outfile (basename chapter)]
                     [outfile (string-append "odt/" (swap-ext outfile ".odt"))]
                     [infiles (append headers (list chapter))])
                (begin 
                  (files->pandoc 'odt labels infiles outfile)
                  (loop (cdr ch-ls))))))))))

(define make-all-odt
  (lambda ()
    (md->odt chapter-files)))

(define make-pdf-odt
  (lambda (chapters)
    (let* ([config "config/xref-labels.scm"]
           [config (call-with-input-file config read)]
           [endnotefile "input.ent"]
           [endnotes (touch-file endnotefile)]
           [backmatter '("chapters/floats.md")]
           
           [pdf-headers '("config/pdf.yaml" "chapters/head.yaml")]
           [pdf-outfile "pdf/all.pdf"]
          
           [pdf-files (append pdf-headers chapters backmatter)]
           [labels (make-labels pdf-files '())]
           [floatfiles (labels->files labels config)]
          
           [pdf-files (append pdf-files floatfiles)]
           [make-pdfs (files->pandoc 'pdf labels pdf-files pdf-outfile)]
          
           [odt-headers '("config/odt.yaml" "chapters/head.yaml")]
           [odt-float-output "odt/floats.odt"]
           [odt-floatfiles (append odt-headers backmatter floatfiles)]
           [make-odt-floats (files->pandoc 'odt labels 
                                           odt-floatfiles odt-float-output)]

      (let make-odts ([ls chapters])
        (if (null? ls)
            (begin
              (delete-file endnotefile)
              #f) ; return
            (let* ([chapter (car ls)]
                   [outfile (basename chapter)]
                   [outfile (string-append "odt/" (swap-ext outfile ".odt"))]
                   [infiles (append odt-headers (list chapter))])
              (begin
                (files->pandoc 'odt labels infiles outfile)
                (make-odts (cdr ls)))))))))

(define make-all
  (lambda ()
    (make-pdf-odt chapter-files)))

