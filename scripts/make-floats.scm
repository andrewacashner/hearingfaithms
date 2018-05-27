;; make-floats.scm
;; Andrew A. Cashner, 2018/05/27

;; Compile LaTeX floats or Lilypond scores to PDFs, crop the PDFs, move them to
;; img/ subdirectories for inclusion as LaTeX graphics

(use-modules
  (ice-9 ftw)
  (shell filenames))

(define lily-compile
  (lambda (file)
    (let ([cmd (string-append "lilypond -I $HOME/ly " file)])
      (system cmd))))

(define tex-compile
  (lambda (file)
    (let ([cmd (string-append "latexmk -pdf " file)])
      (system cmd))))

(define crop-pdf 
  (lambda (file)
    (system* "pdfcrop" file)))

(define make-floats
  (lambda (type)
    "make-scores Procedure: make-scores
    INPUT:   None
    RETURNS: Files in music-examples/*.ly, compiled with Lilypond, cropped,
    final PDF copied to img/music-examples"

    (let* ([ext     (cond [(eq? type 'music) ".ly"]
                          [else ".tex"])]
           [dir-src (cond [(eq? type 'music) "music-examples/"] 
                          [(eq? type 'poem)  "poem-examples/"] 
                          [(eq? type 'table) "tables/"])]
           [dir-aux (string-append "aux/" dir-src)]
           [dir-img (string-append "img" dir-src)]
           [ls      (scandir dir-src 
                             (lambda (f) (compare-ext f ext)))])
      (begin
        (for-each 
          (lambda (file) 
            (let* ([orig      (string-append dir-music file)]
                   [pdf       (swap-ext file ".pdf")]
                   [aux-pdf   (string-append dir-aux pdf)]
                   [aux-crop  (swap-ext aux-pdf "-crop.pdf")]
                   [out-pdf   (string-append dir-img pdf)])
              (begin
                (if (eq? type 'music)
                    (lily-compile orig)
                    (tex-compile orig))
                (rename-file pdf aux-pdf)
                (crop-pdf aux-pdf)
                (copy-file aux-crop out-pdf))))
          ls)
        #f))))

