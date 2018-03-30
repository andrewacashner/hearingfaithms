% Padilla-Voces-alamire.ly
% Andrew Cashner, 2018/03/29

\version "2.19"
\include "villancico.ly"
\include "example.ly"

% TODO do single-note brackets & labels using invisible voice with hidden notes?
%      put Analysis Label in appropriate ~/ly place

color={}
endcolor={}

AnalysisLabel =
#(define-scheme-function 
   (str) (markup?)
     #{ \once \override HorizontalBracketText.text = \markup \italic $str #})

% TODO fix dot position
AnnotateNote = 
#(define-music-function
   (dir label note) (ly:dir? markup? ly:music?)
   #{ 
     << 
       { $note }
       \\
       {
           \once \hide Voice.NoteHead
           \once \hide Voice.Stem
           \once \hide Voice.Dots
         
           \once \override HorizontalBracket.direction = #dir
           \AnalysisLabel $label
          
           <>\startGroup
           \shiftDurations 1 0 { $note }
           
           \once \hide Voice.NoteHead
           \once \hide Voice.Stem
           \once \hide Voice.Dots
           
           \shiftDurations 1 0 { $note }
           <>\stopGroup
       }
     >>
    #})


MusicSI = {
  \clef "treble"
  \CantusMollis
  \MeterTriple
  \set Score.currentBarNumber = #66
  | r2 d''2 d''2 
  | c''2 c''1 
  \once \override HorizontalBracket.direction = #UP
  | \AnalysisLabel "[mol] la – [fic] mi – [nat] re" d''2\startGroup cis''1 
  | d''2\stopGroup\color a'1~

  % m. 70
  | a'2\endcolor bes'2 a'2 
  | g'2 g'2 g'2 
  | \AnnotateNote #UP "[mol] mi" { a'1. }  
 
}

MusicAI = {
  \clef "treble"
  \CantusMollis
  \MeterTriple
  | r2 f'2 g'2 
  | \AnalysisLabel "A (la, mi, re)"
  a'2\startGroup a'4(\stopGroup g'4 f'4 e'4) 
  | \AnalysisLabel "[nat] fa – mi" f'2\startGroup e'1\stopGroup
  | fis'2\color fis'1~ 

  % m. 70
  | fis'2\endcolor g'2 f'?2 
  | e'2 d'2 d'2
  | \AnnotateNote #DOWN "[nat] mi" { e'2 } f'2 f'2 
 
}

MusicTI = {
  \clef "treble_8"
  \CantusMollis
  \MeterTriple
  | r2 bes2 bes2 
  | \AnalysisLabel "A (la, mi, re)" a2\startGroup a1\stopGroup
  | \AnalysisLabel "[mol] la – mi" d'2\startGroup\color a1\stopGroup
  | \AnalysisLabel "[nat] re" d'2\startGroup d'1~\stopGroup

  % m. 70
  | d'2\endcolor g2 g2 
  | c'2 bes2 bes2 
  | a2 d'2 d'2 
}

%************

LyricsAI = \lyricmode {
  por el sig -- no~a -- la -- mi -- re, 
  pues -- tos los o -- jos en mi, a la 
}

LyricsTI = \lyricmode {
  por el sig -- no~a -- la -- mi -- re, 
  pues -- tos los o -- jos en mi, a la
}

%************

\score {
  <<
    \new ChoirStaff = "ChI"
    <<
      \new Staff = "SAI"
      <<
        \InstrumentName
        \TwoLineName "Ti. I" "A. I"
        ""
        \new Voice = "SI" { \voiceOne \MusicSI }
        \new Voice = "AI" { \voiceTwo \DrawColorBracketsUnder \MusicAI }
        \new Lyrics \lyricsto "AI" { \LyricsAI }
      >>
      \new Staff = "TI"
      <<
        \InstrumentName "T. I" ""
        \new Voice = "TI" { \MusicTI }
        \new Lyrics \lyricsto "TI" { \LyricsTI }
      >>
    >>
  >>
  \layout {
    \context { 
      \Voice
      \consists "Horizontal_bracket_engraver"
    }
  }

}

