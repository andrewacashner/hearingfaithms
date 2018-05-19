;; make-scores.scm
;; Andrew A. Cashner, 2018/05/19

;; Compile Lilypond scores to PDFs, crop the PDFs, move them to
;; img/music-examples for inclusion as LaTeX graphics

(use-modules
  (ice-9 ftw)
  (shell filenames))

(define lily-compile
  (lambda (file)
    (let ([cmd (string-append "lilypond -I $HOME/ly " file)])
      (system cmd))))

(define crop-pdf 
  (lambda (file)
    (system* "pdfcrop" file)))

(define make-scores
  (lambda ()
    "make-scores Procedure: make-scores
    INPUT:   None
    RETURNS: Files in music-examples/*.ly, compiled with Lilypond, cropped,
    final PDF copied to img/music-examples"

    (let* ([dir-music   "music-examples/"] 
           [dir-aux     "aux/music-examples/"]
           [dir-img     "img/music-examples/"]
           [ls (scandir dir-music 
                        (lambda (f) (compare-ext f ".ly")))])
      (for-each 
        (lambda (file) 
          (let* ([ly        (string-append dir-music file)]
                 [pdf       (swap-ext file ".pdf")]
                 [aux-pdf   (string-append dir-aux pdf)]
                 [aux-crop  (swap-ext aux-pdf "-crop.pdf")]
                 [out-pdf   (string-append dir-img pdf)])
            (begin
              (lily-compile ly)
              (rename-file pdf aux-pdf)
              (crop-pdf aux-pdf)
              (copy-file aux-crop out-pdf))))
          ls))))

