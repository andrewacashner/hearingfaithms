% Suspended Ecuador version 2 excerpts

\version "2.19"
\include "villancico.ly"
\include "vcbook-example.ly"

% EXAMPLE 1
MusicS = {
  \MeterTriple
  \clef "treble"
  R1.
  R1.
  r2 d''2 e''2 
  fis''2. e''4 fis''2
  g''1 d''2
  d''1.
  d''1.
  b'1. 
  c''1.
  d''1.
  d''1.
  d''1.
  e''1.
  c''1.
  c''1.
  d''1.
  c''1.~
  c''1.\fermata
  \FinalBar
}

MusicA = {
  \MeterTriple
  r2 d''1~\color
  d''2 c''1~
  c''2 b'1\endcolor
  a'1.
  g'1.
  a'1.
  b'1.
  b'1.
  g'1.
  b'1.
  d''1.
  b'1.
  c'1.
  c'1.
  g'1.
  b'1.
  g'1.~
  g'1.\fermata
}

MusicT = {
  \MeterTriple
  r2 fis'2 g'2
  a'2. g'4 a'2
  d'1 d'2
  r2 d'1~\color
  d'2 g'2 d'2~
  d'2 d'2 d'2\endcolor
  d'1. 
  d'1.
  e'1.
  d'1.
  fis'1.
  d'1.
  e'1.
  f'1.
  e'1.
  d'1.
  e'1.~
  e'1.\fermata
}

MusicB = {
  \MeterTriple
  \clef "bass"
  r2 d2 e2
  fis2. e4 fis2
  g1. 
  d1.
  g1.
  d1.
  g1.
  g1.
  c'1.
  g1.
  d'1.
  g1.
  c1.
  f1.
  c1.
  g1.
  c1.~
  c1.\fermata
}

LyricsS = \lyricmode {
  a los án -- ge -- les lle -- va, lle -- va 
  el can -- to lla -- no,
  el can -- to lla -- no. __
}

LyricsA = \lyricmode {
  a __ los án -- ge -- les lle -- va el
}

LyricsT = \lyricmode {
  a los án -- ge -- les lle -- va, 
  a __ los án -- ge -- les 
  \EdLyrics { lle -- va~el } can -- to lla -- no,
  el can -- to lla -- no. __
}

\score {
  <<
    \new ChoirStaff
    <<
      \ChoirStaffName "Chorus III"
      \new Staff = "S"
      <<
        \InstrumentName "Ti." ""
        \new Voice = "S" { \MusicS }
        \new Lyrics \lyricsto "S" { \LyricsS }
      >>
      \new Staff = "AT"
      <<
        \InstrumentName \TwoLineName "A." "T." ""
        \new Voice = "A" { \voiceOne \MusicA }
        \new Voice = "T" { \voiceTwo \MusicT }
        \new Lyrics \with { alignAboveContext = "AT" }
        \lyricsto "A" { \LyricsA }
        \new Lyrics \lyricsto "T" { \LyricsT }
      >>
      \new Staff = "B"
      <<
        \InstrumentName \TwoLineName "B." "[instr.]" ""
        \new Voice = "B" { \MusicB }
      >>
    >>
  >>
}
