% JUAN GUTIERREZ DE PADILLA

% ALTO ZAGALES DE TODO EL EGIDO
% MEX-Pc: Leg. 2/1 (?), Christmas 1653, first after calenda
% ESTRIBILLO

\version "2.19"
\include "villancico.ly"
\include "vcbook-example.ly"

%*******************
% MUSIC
%*******************

MusicSI = {
  \clef "treble"
  \MeterTriple
  r2 r2 b'2~\color
  b'2 a'1\endcolor
  b'2 b'2 c''2 
  d''1 d''2
  e''2 e''2 e''2 
  e''2 d''2 d''2
  e''2 c''2 c''2 
  c''1 c''2
  c''1.~
  c''1.
  R1.*2
  r2 r2 d''2 
}

MusicAI = {
  \clef "treble"
  \MeterTriple
  r2 r2 g'2~
  g'2 fis'1
  g'2 g'2 g'2 
  g'1 f'2
  e'2 e'2 e'2 
  e'2 g'2 g'2
  e'2 e'2 d'2 
  c'1 e'2
  c'1.~
  c'1.
  r2 f'2 f'2 
  d'2 a'1
  a'1 a'2
}

MusicTI = {
  \clef "treble_8"
  \MeterTriple
  r2 r2 g2~\color
  g2 d'1\endcolor
  g2 g2 a2 
  b1 b2
  c'2 c'2 c'2 
  g2 g2 g2 
  g2 g2 g2 
  g1 c'2
  f1 f2 
  g2 g2 g2
  c'1. 
  r1.
  r2 r2 a2
}

MusicAII = {
  \clef "treble"
  \MeterTriple
  g'1. 
  R1.*3
  r2 r2 g'2~\color
  g'2 g'1\endcolor
  g'2 e'2 f'2 
  g'1 g'2 
  a'2 a'2 a'2 
  g'2 g'2 g'2
  g'2 a'2 a'2 
  g'2\color e'1\endcolor
  fis'1.
}

MusicTII = {
  \clef "treble_8"
  \MeterTriple
  b1. 
  R1.*3
  r2 r2 c'2~
  c'2 d'1 
  c'2 c'2 d'2 
  e'1 e'2
  f'2 f'2 f'2 
  e'2 e'2 e'2
  e'2 a2 a2 
  b2 cis'1 
  d'1.
}

MusicBI = {
  \clef "bass"
  \MeterTriple
  g,1. 
  R1.*3
  r2 r2 c2~\color
  c2 g,1\endcolor
  c1.~
  c1.
  r2 r2 f2 
  c2 c2 c2
  c2 f2 f2 
  g2\color a1\endcolor
  d1.
}

%*******************
% LYRICS
%*******************

LyricsAI = \lyricmode {
  Al __ chaz, chaz con la cas -- ta -- ñue -- la 
  y|~al ta -- pa -- la -- tán con el tam -- bo -- ril, __
  con el tam -- bo -- ril, 
  y|~al
}

LyricsTI = \lyricmode {
  Al __ chaz, chaz con la cas -- ta -- ñue -- la 
  y|~al ta -- pa -- la -- tán con el tam -- bo -- ril,
  y|~al ta -- pa -- la -- tán, 
  y|~al

}

LyricsTII = \lyricmode {
  \EdLyrics { -il. }
  Al __ chaz, chaz con la cas -- ta -- ñue -- la 
  y|~al ta -- pa -- la -- tán con el tam -- bo -- ril,
}

%*******************
% SCORE
%*******************

\score {
  <<
    \new ChoirStaff 
    <<
      \new Staff = "SAI"
      <<
        \InstrumentName
        \TwoLineName "Ti. I" "A. I"
        ""
        \new Voice = "SI" { \voiceOne \MusicSI }
        \new Voice = "AI" { \voiceTwo \MusicAI }
        \new Lyrics \lyricsto "AI" { \LyricsAI }
      >>
      \new Staff = "TI"
      <<
        \InstrumentName "T. I" ""
        \new Voice = "TI" { \MusicTI }
        \new Lyrics \lyricsto "TI" { \LyricsTI }
      >>
    >>
    \new ChoirStaff
    <<
      \ShowChoirStaffBracket
      \new Staff = "ATII"
      <<
        \InstrumentName
        \TwoLineName "A. II" "T. II"
        ""
        \new Voice = "AII" { \voiceOne \MusicAII }
        \new Voice = "TII" { \voiceTwo \MusicTII }
        \new Lyrics \lyricsto "TII" { \LyricsTII }
      >>
      \new Staff = "TII-BI"
      <<
        \InstrumentName 
        \TwoLineName "B. I" "[instr.]"
        ""
        \new Voice = "BI" { \MusicBI }
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


