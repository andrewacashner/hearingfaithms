% Padilla-Voces-alamire.ly
% Andrew Cashner, 2018/03/29

\version "2.19"
\include "villancico.ly"
\include "example.ly"

color={}
endcolor={}

MusicSI = {
  \clef "treble"
  \CantusMollis
  \MeterTriple
  \set Score.currentBarNumber = #66
  | r2 d''2 d''2 
  | c''2 c''1 

  | \Annotate "[mol] la – [fic] mi – [nat] re" d''2\NB cis''1 
  | d''2\endNB\color a'1~

  % m. 70
  | a'2\endcolor bes'2 a'2 
  | g'2 g'2 g'2 
  | \AnnotateOne "[mol] mi" { a'1. } { a'4\NB a'4\endNB }
 
}

MusicAI = {
  \clef "treble"
  \CantusMollis
  \MeterTriple
  | r2 f'2 g'2 
  | \AnnotateBelow "A (la, mi, re)"
  a'2\NB a'4(\endNB g'4 f'4 e'4) 
  | f'2 
  \AnnotateBelowOne "[nat] mi" { e'1 } { e'2\NB e'2\endNB }
  | fis'2\color fis'1~ 

  % m. 70
  | fis'2\endcolor g'2 f'?2 
  | e'2 d'2 d'2
  | \AnnotateBelowOne "[nat] mi" { e'2 } { e'4\NB e'4\endNB } f'2 f'2 
 
}

MusicTI = {
  \clef "treble_8"
  \CantusMollis
  \MeterTriple
  | r2 bes2 bes2 
  | \AnnotateBelow "A (la, mi, re)" a2\NB a1\endNB
  | \AnnotateBelow "[mol] la – mi" d'2\NB\color a1\endNB
  | \AnnotateBelowOne "[nat] re" { d'2 } { d'4\NB d'4\endNB } d'1~

  % m. 70
  | d'2\endcolor g2 g2 
  | c'2 bes2 bes2 
  | \AnnotateBelowOne "[mol] mi" { a2 } { a4\NB a4\endNB } d'2 d'2 
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
}

