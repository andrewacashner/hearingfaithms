\version "2.19"

SplitNote = 
#(define-music-function
   (note) (ly:music?)
   #{ \shiftDurations 1 0 { $note $note } #})

% { \shiftDurations 1 0 { a'2 } }
\SplitNote { a'2 }
