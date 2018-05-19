;; make-scores.scm
;; Andrew A. Cashner, 2018/05/19

;; Compile Lilypond scores to PDFs, crop the PDFs, move them to
;; img/music-examples for inclusion as LaTeX graphics

(use-modules
  (ice-9 format)
  (ice-9 ftw)
  (shell filenames))

(define lily-compile
  (lambda (lyfile)
    "make-scores Procedure: lily-compile lyfile
    Use lilypond to compile LYFILE and move to aux directory"
    (let* ([pdf-file (swap-ext lyfile ".pdf")]
           [outfile-base (basename pdf-file)]
           [outfile-final (format #f "aux/~a" outfile-base)])
      (begin 
        (system (format #f "lilypond -I $HOME/ly ~a" lyfile))
        (rename-file outfile-base outfile-final)))))

(define move-to-img
  (lambda (infile outfile dir)
    "make-scores Procedure: move-to-img infile outfile dir
    INPUT:   (3) Strings for input PDF file, output PDF file, directory 
                 (e.g., \"example-crop.pdf\", \"example.pdf\", \"tables\")
    RETURNS: (1) Calls system to rename aux/INFILE to img/DIR/OUTFILE
             (2) Reports success to user"
    (let ([origin (format #f "aux/~a" infile)]
          [destination (format #f "img/~a/~a" dir outfile)])
      (begin
        (rename-file origin destination) 
        (format #t "make-floats: Created new image file ~a\n" outfile)))))


(define move-cropped-to-img
  (lambda (infile dir)
    "make-scores Procedure: move-cropped-to-img infile dir
    INPUT:   (2) Strings for input file and directory
    RETURNS: (1) Crops image and does move-to-img 
                 to move cropped image from aux/ to img/DIR/"
    (let* ([filebase (basename infile)]
           [pdf-file (swap-ext filebase ".pdf")]
           [pdf-crop-infile (format #f "aux/~a" pdf-file)]
           ;; remove -crop addition that pdfcrop will generate
           [pdf-crop-outfile (format #f "~a-crop.pdf" (strip-ext filebase))])
      (begin
        (system* "pdfcrop" pdf-crop-infile)
        (move-to-img pdf-crop-outfile pdf-file dir)))))

(define make-scores
  (lambda ()
    "make-scores Procedure: make-scores
    INPUT:   None
    RETURNS: Files in DIR/src/ matching EXT, processed according to rules 
    (compile with LaTeX/Lilypond, crop or not, then move)"
    (let* ([dir "music-examples/"]
           [ls (scandir dir (lambda (f) (compare-ext f ".ly")))])
      (for-each 
        (lambda (file) 
          (let ([filepath (format #f "~a/~a" dir file)])
            (begin
              (lily-compile filepath)
              (move-cropped-to-img filepath dir))))
          ls))))

