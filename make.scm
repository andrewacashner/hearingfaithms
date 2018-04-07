;; make.scm
;; Andrew Cashner, 2018/04/06

;; Make single PDF of selected chapters and corresponding floats
;; - make labels ls from chapters
;; - assemble float files in order from label ls
;; - replace refs in all files with numbers from label ls
;; - replace labels in all files with appropriate string
;; - process files all together with configuration files via pandoc to PDF
;; - clean up

;; Make separate ODTs of selected chapters and corresponding floats
;; - make labels ls from chapters
;; - assemble float files in order from label ls
;; - replace refs wtih numbers and labels with strings in EACH file, then
;;   process EACH via pandoc to PDF
;; - clean up

(use-modules 
  (shell readwrite)
  (xref xref)
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
  (format #f "pandoc ~a -o ~a" pandoc-pdf-opts "pdf/all.pdf"))

(define header-files 
  '("config/pdf.yaml" "chapters/head.yaml"))

(define make-pdfs
  (lambda chapters
    (let* ([files (append header-files chapters)]
           [infile (file-ls->string files)]
           [labels (list-labels infile '())]
;; TODO make file list of floats from labels, add these files to infile
           [text-refs (replace-refs infile labels)]
           [text-labels (replace-labels text-refs)]
           [pandoc-port (open-output-pipe pandoc-cmd)]
           [do-pandoc (display text-labels pandoc-port)])
      (close-pipe pandoc-port))))

