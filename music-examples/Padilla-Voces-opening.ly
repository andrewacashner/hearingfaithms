\version "2.19"

\include "villancico.ly"
\include "vcbook-example.ly"

MusicSI = {
  \clef "treble"
  \CantusMollis
  \MeterTriple
  r2 d''1~\color
  d''2 e''1\endcolor
  c''2. c''4 c''2~\color
  c''2 d''1\endcolor
  c''1 c''2
  r2 f''1~\color
  f''2\endcolor d''2 d''2
  e''2 d''2 d''2
  d''2( cis''1)
  d''2 a'1
  a'2 a'2 a'2
  a'1 a'2
  bes'2\color bes'2 a'2~
  a'2 d''1
  bes'1 c''2~
  c''2 a'1~
  a'2 d''1\endcolor
  c''1.
  b'2

}

MusicAI = {
  \clef "treble"
  \CantusMollis
  \MeterTriple
  r2 bes'1~\color
  bes'2 g'1\endcolor
  a'2. g'4 a'2~\color
  a'2 bes'1\endcolor
  a'1 a'2
  r2 a'1~\color
  a'2\endcolor bes'2. a'4
  g'2 f'2 f'2
  e'1.
  fis'2 fis'1
  fis'2 fis'2 fis'2
  fis'1 fis'2
  g'2\color g'2 f'2~
  f'2 bes'1 
  g'1 a'2~
  a'2 f'1~
  f'2 d'2 \[ g'2~
  g'2 \] fis'1\endcolor
  g'2
}

MusicTI = {
  \clef "treble_8"
  \CantusMollis
  \MeterTriple
  r2 g'1~\color
  g'2 c'1\endcolor
  f'2. e'4 f'2~\color
  f'2 bes1\endcolor
  f'1 f'2
  r2 d'1~\color
  d'2\endcolor bes2 bes2
  c'2 d'2 d'2
  a1. 
  d2 d'1
  d'2 d'2 d'2
  d'1 d'2
  g2\color g2 d'2~
  d'2 bes1
  es'1 c'2~
  c'2 d'1~
  d'2 bes1\endcolor
  a1. g2
}

LyricsSI = \lyricmode { 
  Vo -- ces, las de la __ ca -- pi -- lla, 
  cuen -- ta con lo que se can -- ta, 
  que~es mú -- si -- co~el Rey,
  y no -- ta las __ más le -- ves di -- so -- nan -- cias,
}

\score {
  <<
    \new ChoirStaff = "ChI"
    <<
      \ChoirStaffName "CHORUS I"
      \new Staff = "SAI"
      <<
        \InstrumentName 
        \TwoLineName "Ti. I" "A. I" 
        ""
        \new Voice = "SI" { \voiceOne \MusicSI }
        \new Voice = "AI" { \voiceTwo \DrawColorBracketsUnder \MusicAI }
        \new Lyrics \lyricsto "SI" { \LyricsSI }
      >>
      \new Staff = "TI"
      <<
        \InstrumentName "T. I" ""
        \new Voice = "TI" { \MusicTI }
      >>
    >>
  >>
}
