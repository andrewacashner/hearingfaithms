;; make-floats.scm
;; Andrew A. Cashner, 2018/05/27

;; Compile LaTeX floats or Lilypond scores to PDFs, crop the PDFs, move them to
;; img/ subdirectories for inclusion as LaTeX graphics

(use-modules
  (ice-9 ftw)
  (ice-9 format)
  (shell filenames))

(define lily-compile
  (lambda (file)
    (let ([cmd (format #f "lilypond -I $HOME/ly ~a" file)])
      (system cmd))))

(define tex-compile
  (lambda (file dir-aux)
    (let* ([cmd (format #f "latexmk -silent -outdir=~a -pdf ~a" dir-aux file)])
      (system cmd))))

(define crop-pdf 
  (lambda (file)
    (system* "pdfcrop" file)))

(define Default
  '((music  . ((ext . ".ly") 
               (dir . "music-examples")))
    (poem   . ((ext . ".tex")
               (dir . "poem-examples")))
    (table  . ((ext . ".tex")
               (dir . "tables")))))

(define get-default
  (lambda (type key)
    (let ([ls Default])
      (assq-ref (assq-ref ls type) key))))

(define make-floats
  (lambda (type)
    "make-scores Procedure: make-floats type
    INPUT:   Symbol of type: 'music, 'poem, or 'table
    RETURNS: Cropped PDF of float in proper directory under img/"

    (let* ([ext     (get-default type 'ext)]
           [dir-src (get-default type 'dir)] 
           [dir-aux (format #f "aux/~a" dir-src)]
           [dir-img (format #f "img/~a" dir-src)]
           [ls      (scandir dir-src 
                             (lambda (f) (compare-ext f ext)))])
      (begin
        (for-each 
          (lambda (file) 
            (let* ([orig      (format #f "~a/~a" dir-src file)]
                   [pdf       (swap-ext file ".pdf")]
                   [aux-pdf   (format #f "~a/~a" dir-aux pdf)]
                   [aux-crop  (swap-ext aux-pdf "-crop.pdf")]
                   [out-pdf   (format #f "~a/~a" dir-img pdf)])
              (begin
                ;; for lilypond, compile in base dir then move to aux
                ;; for tex, use outdir option of latxmk to compile in aux
                (if (eq? type 'music) 
                    (begin 
                      (lily-compile orig) 
                      (rename-file pdf aux-pdf))
                    (tex-compile orig dir-aux))
                (crop-pdf aux-pdf)
                (copy-file aux-crop out-pdf))))
          ls)
        #f))))

