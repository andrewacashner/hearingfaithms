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

(define Chapter-files
  '("chapters/chapter-1.md"
    "chapters/chapter-2.md"
    "chapters/chapter-3.md"))

(define Names
    '((label-config         . "config/xref-labels.scm") 
      (endnotefile          . "input.ent")
      (floatfile            . "chapters/floats.md")
      (pdf-config           . "config/pdf.yaml")
      (odt-config           . "config/odt.yaml")
      (pdf-outfile          . "pdf/all.pdf")
      (titlefile            . "chapters/head.yaml")
      (odt-float-outfile    . "odt/floats.odt")))

(define Pandoc-opts
  '((pdf . "\
--filter pandoc-citeproc \
--latex-engine xelatex \
--top-level-division part \
--table-of-contents \
--bibliography master.bib \
--csl chicago-fullnote-bibliography.csl ")
    (odt .  "\
--filter pandoc-citeproc \
--smart \
--reference-odt config/vcbook.odt \
--bibliography master.bib \
--csl chicago-fullnote-bibliography.csl ")))

(define default
  (lambda (ls key)
    "Fetch default value for KEY from global alist default-ls"
    (let ([value (assq-ref ls key)])
      (if (eq? #f value)
          (begin 
            (format #t "Default ~a not found.\n" key) 
            (exit 0))
          value))))

(define pandoc-cmd
  (lambda (opts outfile)
    "Construct pandoc invocation with options and output file"
    (format #f "pandoc ~a -o ~a" opts outfile)))

(define pandoc-pipe
  (lambda (str opts outfile)
    "Create pipe calling pandoc with OPTS and OUTFILe, write STR to pipe and
    then close pipe"
    (let* ([pandoc-str (pandoc-cmd opts outfile)]
           [pandoc-port (open-output-pipe pandoc-str)]
           [do-pandoc (display str pandoc-port)])
      (begin
        (close-pipe pandoc-port)
        #f))))
 
(define files->pandoc
  (lambda (type labels ls outfile)
    "Take LS list of files, alist of LABELS, and use pandoc to convert files to
    format TYPE ('pdf or 'odt) in OUTFILE"
    (let* ([text (file-ls->string ls)]
           [text (replace-refs text labels)]
           [text (replace-labels text)]
           [opts (default Pandoc-opts type)])
      (pandoc-pipe text opts outfile))))

(define touch-file
  (lambda (file)
    "Create dummy file"
      (call-with-output-file 
        file 
        (lambda (port) 
          (write '() port)))))

(define make-labels
  (lambda (files ls)
    "Read FILES and make alist LS of labels found"
    (let* ([text (file-ls->string files)])
      (list-labels text ls))))
           
(define md->pdf
  (lambda (chapters)
    "Convert list of markdown files to PDF using pandoc, with cross-references
    resolved"
    (let* ([config      (call-with-input-file (default Names 'label-config) read)]
           [endnotes    (touch-file (default Names 'endnotefile))]
           [files       (append (list (default Names 'pdf-config)
                                      (default Names 'titlefile))
                                chapters
                                (list (default Names 'floatfile)))]
           [labels      (make-labels files '())]
           [floatfiles  (labels->files labels config)]
           [allfiles    (append files floatfiles)])
      (begin
        (files->pandoc 'pdf labels allfiles (default Names 'pdf-outfile))
        (delete-file (default Names 'endnotefile))
        #f))))

;; Make separate ODTs of selected chapters and corresponding floats
;; - make labels ls from chapters
;; - assemble float files in order from label ls
;; - replace refs wtih numbers and labels with strings in EACH file, then
;;   process EACH via pandoc to PDF

(define md->odt
  (lambda (chapters)
    "Convert list of markdown files to separate ODT files per chapter using
    pandoc, with cross-references resolved"
    (let* ([config      (call-with-input-file (default Names 'label-config) read)]
           [endnotes    (touch-file (default Names 'endnotefile))]
           [headers     (list (default Names 'odt-config)
                              (default Names 'titlefile))]
           [backmatter  (list (default Names 'floatfile))]
           [files-all   (append headers chapters backmatter)]
           ; Get labels from full text of all chapters
           [labels (make-labels files-all '())]
           ; Assemble floats from label list
           [floatfiles (labels->files labels config)]
           [floatfiles (append headers backmatter floatfiles)])
      (begin
        ; Convert floats to single ODT
        (files->pandoc 'odt labels floatfiles (default Names 'odt-float-outfile))
        ; Convert each chapter to single ODT
        (let loop ([ch-ls chapters])
          (if (null? ch-ls)
              (begin
                (delete-file (default Names 'endnotefile))
                #f) ; return here

              (let* ([chapter (car ch-ls)]
                     [outfile (basename chapter)]
                     [outfile (string-append "odt/" (swap-ext outfile ".odt"))]
                     [infiles (append headers (list chapter))])
                (begin 
                  (files->pandoc 'odt labels infiles outfile)
                  (loop (cdr ch-ls))))))))))

(define make-pdf-odt
  (lambda (chapters)
    "Convert list of markdown files CHAPTERS to single PDF and to separate ODT
    files per chapter"
    (let* (; config determines which labels are filenames
           [config      (call-with-input-file (default Names 'label-config) read)]
           ; need input.ent or latexmk won't work
           [endnotes    (touch-file (default Names 'endnotefile))]

           ; Get labels from full text of all chapters 
           ; List floats in order from label list
           [pdf-files   (append (list (default Names 'pdf-config) 
                                      (default Names 'titlefile))
                                chapters
                                (list (default Names 'floatfile)))]
           [labels      (make-labels pdf-files '())]
           [floatfiles  (labels->files labels config)]
           [odt-floatfiles      (append (list (default Names 'odt-config) 
                                              (default Names 'titlefile) 
                                              (default Names 'floatfile)) 
                                        floatfiles)] 
           [odt-float-output    (default Names 'odt-float-outfile)]

           ; List all files to convert to single PDF
           [pdf-files   (append pdf-files floatfiles)]
           [pdf-outfile (default Names 'pdf-outfile)]) 
      (begin 
        (format #t "Converting files to ~a...\n" pdf-outfile) 
        (files->pandoc 'pdf labels pdf-files pdf-outfile)

        ; Create single ODT for float files in order
        (format #t "Converting floats to ~a...\n" odt-float-output) 
        (files->pandoc 'odt labels odt-floatfiles odt-float-output)

        ; Make single ODT for each chapter
        (let make-odts ([ls chapters])
          (if (null? ls)
              (begin
                (delete-file (default Names 'endnotefile))
                #f) ; return here
              (let* ([chapter (car ls)]
                     [outfile (basename chapter)]
                     [outfile (string-append "odt/" (swap-ext outfile ".odt"))]
                     [infiles (list (default Names 'odt-config)
                                    (default Names 'titlefile)
                                    chapter)])
                (begin
                  (format #t "Converting ~a to ~a...\n" chapter outfile)
                  (files->pandoc 'odt labels infiles outfile)
                  (make-odts (cdr ls))))))))))


(define make-all-pdf
  (lambda ()
    (md->pdf Chapter-files)))

(define make-all-odt
  (lambda ()
    (md->odt Chapter-files)))

(define make-all
  (lambda ()
    (make-pdf-odt Chapter-files)))

