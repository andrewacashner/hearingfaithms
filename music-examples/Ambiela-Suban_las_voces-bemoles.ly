% Ambiela, Suban las voces, E-Bbc: M/733/1
% Ex bemoles

\version "2.19"
\include "villancico.ly"
\include "vcbook-example.ly"

MusicSIi = {		
  \clef "treble"
  \MeterTriple
  %	\set Score.currentBarNumber = #25
  e''2 e''2 e''2 
  f''2\color f''1\endcolor
  f''1. 
  e''1.
  a''1. 
  a''1.
  r1. 
  r2 b'2 b'2 
  c''2\color c''1\endcolor 
  c''1.
  b'2 b'2 b'2 
  b'1. 
  a'1 e''2 
  fis''2\color fis''1
  g''2 g''1\endcolor 
  gis''1. 
  a''1. 
}

MusicSIii = {
  \clef "treble"
  \MeterTriple
  a''2 r2 r2 
  R1.*3
  r2 r2 e''2 
  fis''2\color fis''1 
  g''2 g''1\endcolor 
  gis''1.
  a''1. 
  r2 a''2 a''2
  g''2\color d''1\endcolor 
  e''1.
  e''1 e''2 
  d''2\color d''1 
  d''2 d''1\endcolor 
  d''1.
  c''1. 
}

MusicTI = {
  \clef "treble_8"
  \MeterTriple
  e'1. 
  r2 r2 a2 
  b2\color b1 
  c'2 c'1\endcolor
  cis'1. 
  d'1. 
  g2\color g1\endcolor 
  e1. 
  a1 a2 
  d'2\color d'1
  g2 g1\endcolor 
  e1. 
  a1 c'2 
  d'2\color d'1 
  d'2 d'1\endcolor 
  e'1. 
  e'1. 
}

MusicSII = {
  \clef "treble"
  \MeterTriple
  c''2 r2 r2 
  R1.*3
  r2 e''2 e''2 
  d''2\color d''1\endcolor
  d''1.~
  d''1.
  c''2 c''2 c''2 
  d''2\color d''1 
  d''2 g'1\endcolor 
  r2 b'2 b'2
  c''2\color c''1\endcolor 
  c''1. 
  b'2\color b'1\endcolor 
  b'1. 
  c''1.
}

MusicAII = {
  \clef "treble"
  \MeterTriple
  a'2 r2 r2 
  r1. 
  r2 d''2 d''2 
  c''2\color c''1\endcolor
  a'1. 
  a'2 a'2 a'2 
  g'2\color d'1\endcolor 
  e'1. 
  e'1 e'2 
  fis'2\color fis'1 
  g'2 g'1\endcolor 
  gis'1. 
  a'1 a'2 
  a'2\color a'1 
  g'2 g'1\endcolor 
  b'1. 
  a'1 c''2\HalfTie
}

MusicTII = {
  \clef "treble_8"
  \MeterTriple
  a2 r2 r2 
  r2 a'2 a'2 
  g'2\color g'1\endcolor 
  g'1.~
  g'1. 
  fis'1.
  R1.*2
  r2 e'2 e'2 
  d'2\color d'1\endcolor 
  d'1.~
  d'1.
  c'1 a2 
  d'2\color d'1 
  g2 g1\endcolor 
  e1. 
  a1.
}

MusicAc = {
  \clef "bass"
  \MeterTriple
  a1.
  f1. 
  g1.
  c'1.
  a1.
  d'1.
  g1.
  e1. 
  a1.
  d1. 
  g1.
  e1. 
  a1.
  d1. 
  g1.
  e1. 
  a1 a2
}

%*******************
% FIGURES
%*******************

FiguresAc = \figuremode {
  s1.
  s1.
  < 7 >1.
  s1.
  < 7 >1.
  s1.
  s1.
  < 7 >1.
}
%*******************
% LYRICS
%*******************

LyricsSIi = \lyricmode {
  -van 
  con be -- mo -- les blan -- dos,
  blan -- dos, 
  con be -- mo -- les blan -- dos que sus -- pen -- dan,
  tri -- na -- dos que sus -- pen -- dan:
}

LyricsSIii = \lyricmode {
  -van
  tri -- na -- dos que sus -- pen -- dan, 
  con be -- mo -- les blan -- dos,
  tri -- na -- dos que sus -- pen -- dan:
}

LyricsTI = \lyricmode {
  -van
  tri -- na -- dos que sus -- pen -- dan,
  que sus -- pen -- dan, 
  tri -- na -- dos que sus -- pen -- dan,
  \EdLyrics { tri -- na -- dos que sus -- pen -- dan: }
}

LyricsSII = \lyricmode {
  -van
  con be -- mo -- les blan -- dos,
  \EdLyrics { con be -- mo -- les blan -- dos, 
  con be -- mo -- les blan -- dos, sus -- pen -- dan: }
}

LyricsAII = \lyricmode {
  -van
  con be -- mo -- les blan -- dos,
  \EdLyrics { con be -- mo -- les blan -- dos, }
  tri -- na -- dos que sus -- pen -- dan,
  \EdLyrics { tri -- na -- dos que sus -- pen -- dan: }
  si-
}

LyricsTII = \lyricmode {
  -van
  con be -- mo -- les blan -- dos,
  \EdLyrics { con be -- mo -- les blan -- dos, } 
  tri -- na -- dos que sus -- pen -- dan:
}

%****************************************
% SCORE
%****************************************
\paper {
  page-count = #1
}

\score {
  <<
    \new ChoirStaff = "ChI"
    <<
      \new Staff = "SIi"
      <<
        \InstrumentName "Ti. I-1" ""
        \new Voice = "SIi" { \MusicSIi }
        \new Lyrics \lyricsto "SIi" { \LyricsSIi }
      >>
      \new Staff = "SIii"
      <<
        \InstrumentName "Ti. I-2" ""
        \new Voice = "SIii" { \MusicSIii }
        \new Lyrics \lyricsto "SIii" { \LyricsSIii }
      >>
      \new Staff = "TI"
      <<
        \InstrumentName "T. I" ""
        \new Voice = "TI" { \MusicTI }
        \new Lyrics \lyricsto "TI" { \LyricsTI }
      >>
    >>
    \new ChoirStaff = "ChII"
    <<
      \new Staff = "SII"
      <<
        \InstrumentName "Ti. II" ""
        \new Voice = "SII" { \MusicSII }
        \new Lyrics \lyricsto "SII" { \LyricsSII }
      >>
      \new Staff = "AII"
      <<
        \InstrumentName "A. II" ""
        \new Voice = "AII" { \MusicAII }
        \new Lyrics \lyricsto "AII" { \LyricsAII }
      >>
      \new Staff = "TII"
      <<
        \InstrumentName "T. II" ""
        \new Voice = "TII" { \MusicTII }
        \new Lyrics \lyricsto "TII" { \LyricsTII }
      >>
    >>
    \new ChoirStaff 
    <<
      \ShowChoirStaffBracket
      \new Staff = "Ac" 
      <<
        \InstrumentName "Ac." ""
        \new Voice = "Ac" { \MusicAc } 
      >>
    >>
  >>
  \layout {
    \context {
      \Score
      \omit BarNumber
    }
  }
}

