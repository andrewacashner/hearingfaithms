;; make-floats.scm
;; Andrew A. Cashner, 2018/03/29

;; - Compile all float files to be included as PDFs in monograph
;; - Put results in img/ under subdirectories for each type (tables,
;;   poem-examples, music-examples)

(use-modules
  (ice-9 format)
  (ice-9 ftw))

;; UTILITIES FOR MODIFYING FILENAMES

(define get-ext 
  (lambda (name) 
    "FN get-ext name
    INPUT:   (1) filename string
    RETURNS: if NAME ends with .*, return .* extension;
             otherwise return NAME"
    (let* ([i (string-rindex name #\.)]
           [i2 (if (eq? #f i) 0 i)])
      (substring name i2 (string-length name)))))

(define compare-ext 
  (lambda (name ext) 
    "FN compare-ext name ext
    INPUT:   (1) filename string, 
             (2) extension string (e.g., \".txt\")
    RETURNS: #t if FILENAME ends with EXT, otherwise #f"
    (let ([ext-a (get-ext name)]
          [ext-b ext])
      (if (eq? #f ext-a)
          #f 
          (string=? ext-a ext-b))) ))

(define strip-extension
  (lambda (filename)
    "FN strip-extension filename
    INPUT:   (1) filename string
    RETURNS: (1) substring  of FILENAME up to concluding .* extension;
             if no extension, return whole FILENAME"
    (let* ([ext-index (string-rindex filename #\.)]
           [ext-index2 (if (eq? #f ext-index) 
                           (string-length filename)
                           ext-index)])
      (substring filename 0 ext-index2))))
        
(define swap-extension
  (lambda (filename ext)
    "FN swap-extension filename ext
    INPUT:   (1) filename string and extension string (e.g., \".txt\")
    RETURNS: (1) string consisting of FILENAME + EXT"
    (string-append (strip-extension filename) ext)))


;; SCRIPTS FOR COMPILING TEX AND LY FILES
;; Move results to aux/

(define tex-compile
  (lambda (texfile)
    "FN tex-compile texfile
    Use latexmk to compile TEXFILE in aux directory"
    (system (format #f "latexmk -outdir=aux -pdfxe ~a" texfile))))

(define lily-compile
  (lambda (lyfile)
    "FN lily-compile lyfile
    Use lilypond to compile LYFILE and move to aux directory"
    (let* ([pdf-file (swap-extension lyfile ".pdf")]
           [outfile-base (basename pdf-file)]
           [outfile-final (format #f "aux/~a" outfile-base)])
      (begin 
        (system (format #f "lilypond -I $HOME/ly ~a" lyfile))
        (rename-file outfile-base outfile-final)))))

;; SCRIPTS FOR MOVING IMAGE FILES 
;; From aux/ to appropriate img/ subdirectory, e.g., img/tables/

(define move-to-img
  (lambda (infile outfile dir)
    "FN move-to-img infile outfile dir
    INPUT:   (3) Strings for input PDF file, output PDF file, directory 
                 (e.g., \"example-crop.pdf\", \"example.pdf\", \"tables\")
    RETURNS: (1) Calls system to rename aux/INFILE to img/DIR/OUTFILE
             (2) Reports success to user"
    (let ([origin (format #f "aux/~a" infile)]
          [destination (format #f "img/~a/~a" dir outfile)])
      (begin
        (rename-file origin destination) 
        (format #t "make-floats: Created new image file ~a\n" outfile)))))

(define move-uncropped-to-img
  (lambda (infile dir)
    "FN move-uncropped-to-img infile dir
    INPUT:   (2) Strings for input filename and directory
    RETURNS: (1) Results of move-to-img, 
                 to move PDF compiled from INFILE to DIR"
    (let* ([infile2 (basename infile)] 
           [pdf-file (swap-extension infile2 ".pdf")])
      (move-to-img pdf-file pdf-file dir))))

(define move-cropped-to-img
  (lambda (infile dir)
    "FN move-cropped-to-img infile dir
    INPUT:   (2) Strings for input file and directory
    RETURNS: (1) Crops image and does move-to-img 
                 to move cropped image from aux/ to img/DIR/"
    (let* ([infile2 (basename infile)]
           [pdf-file (swap-extension infile2 ".pdf")]
           [pdf-crop-infile (format #f "aux/~a" pdf-file)]
           ;; remove -crop addition that pdfcrop will generate
           [pdf-crop-outfile (format #f "~a-crop.pdf" 
                                     (strip-extension infile2))])
      (begin
        (system* "pdfcrop" pdf-crop-infile)
        (move-to-img pdf-crop-outfile pdf-file dir)))))


(define make-floats
  (lambda (dir ext)
    "FN make-floats dir ext
    INPUT:   (2) String for directory to search and extension to find
    RETURNS: Files in DIR/src/ matching EXT, processed according to rules 
             (compile with LaTeX/Lilypond, crop or not, then move)"
    (let* ([type (string->symbol dir)]
           [fulldir (format #f "~a/src" dir)] 
           [file-ls (scandir fulldir (lambda (f) (compare-ext f ext)))])
    (let loop ([ls file-ls])
      (if (null? ls)
          0
          (begin
            (let* ([file (car ls)]
                  [filepath (format #f "~a/src/~a" dir file)])
              (cond
                [(eq? type 'tables)
                 (begin
                   (tex-compile filepath)
                   (move-cropped-to-img filepath type))]
                [(eq? type 'poem-examples)
                 (begin
                   (tex-compile filepath)
                   (move-uncropped-to-img filepath type))]
                [(eq? type 'ly) 
                 (begin
                   (lily-compile filepath)
                   (move-cropped-to-img filepath type))]))
            (loop (cdr ls))))))))

;; GLOBAL LIST OF DIRECTORIES AND EXTENSIONS TO USE
(define Float-types
  '(("tables" . ".tex")
    ("poem-examples" . ".tex")
    ("music-examples" . ".ly")))

(define make-all-floats
  (lambda ()
    "FN make-all-floats
    INPUT:   None
    RETURNS: Result of make-all-floats make-floats for each pair in Float-types" 
    (let loop ([ls Float-types])
      (if (null? ls)
          (exit 0)
          (begin
            (let* ([pair (car ls)]
                   [dir (car pair)]
                   [ext (cdr pair)])
              (make-floats dir ext))
            (loop (cdr ls)))))))


