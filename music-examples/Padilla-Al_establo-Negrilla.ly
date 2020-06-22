% Gutiérrez de Padilla Al establo negrilla intro
\version "2.18"
\include "villancico.ly"
\include "vcbook-example.ly"

MusicSI = {
  \clef "treble"
  \MeterTriple
  \set Score.currentBarNumber = #153
  \ShowFirstBarNumber
  r2 e''2 d''2
  e''2. e''4 f''2~\color
  f''2 e''1\endcolor
  d''1 d''2
  e''2. d''4 e''2 
  f''2\color d''1\endcolor
  e''2 cis''1
  r2 c''2 b'2
  c''2. b'4 c''2~\color
  c''2 d''1
  e''2 cis''1\endcolor
  c''2 c''2 c''2
  b'1\color c''2~
  c''2 a'1\endcolor
  b'1.
}

MusicTI = {
  \clef "treble_8"
  \MeterTriple
  R1.*15
  r2 g'1
  e'2 a'1
  f'2 f'1
  e'2. d'4 c'2
  d'2 e'1
  f'2 f'2 a'2
  g'2 f'2 e'2
  d'2\color c'1\endcolor
  g'1 g'2
}

MusicBI = {
  \clef "bass"
  \MeterTriple
  r2 c'2 g2 
  c'2. a4 d'2~\color
  d'2 c'1\endcolor
  g1 g2
  c'2. b4 c'2
  f2 g1
  c'2 a1
  r2 e2 e2
  a2. g4 a2~\color
  a2 b1\endcolor
  c'2 a1
  a2 e2 f2 
  g1\color c2~
  c2 d1\endcolor
  g1.
}

MusicBII = {
  \clef "bass"
  \MeterTriple
  R1.*15
  r2 g1
  c'2 a1
  d'2 d'1
  c'2. b4 a2
  b2\color c'1\endcolor
  f2 f2 f2
  e2 d2 c2 
  g2\color a1\endcolor
  g1 g2
}

LyricsSI = \lyricmode {
  Di -- ga pli -- mo, don -- de sa?
  la ni --  ño, de na -- ci -- men -- ta
  plu -- que sa -- mo su __ pa -- len -- ta
  y la ve -- ni -- mo~a __ bus -- ca.
}

LyricsTI = \lyricmode {
  Ay -- tá, ay -- ta, cun -- di -- ro~ent -- le pa -- ji -- ta,
  su o -- jo co -- mo tre -- yi -- ta
}

\score {
  <<
    \new ChoirStaff
    <<
      \new Staff = "SI"
      <<
        \InstrumentName "Ti. I" ""
        \new Voice = "SI" { \MusicSI }
        \new Lyrics \lyricsto "SI" { \LyricsSI }
      >>
    >>
    \new ChoirStaff
    <<
      \new Staff = "BI"
      <<
        \InstrumentName
        \TwoLineName "B. I" "[instr.]"
        ""
        \ShowChoirStaffBracket
        \new Voice = "BI" { \MusicBI }
      >>
    >> 
  >>
}
