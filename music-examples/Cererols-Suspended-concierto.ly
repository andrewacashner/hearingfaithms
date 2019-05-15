% Cererols, Suspended, cielos
% Ex: Concierto tan soberano
\version "2.19"
\include "villancico.ly"
\include "vcbook-example.ly"

MusicSIi = {
  \clef "treble"
  \MeterTriple
  \set Score.currentBarNumber = #185
  \ShowFirstBarNumber
  R1.
  r2 e''2\color g''2~
  g''2 fis''1\endcolor
  R1.
  r2 g''2\color g''2~
  g''2 fis''1\endcolor
  g''2 d''2 f''2
  e''4( d''4 c''4 d''4 e''4 fis''4)
  g''1.
  r2 r2 f''4 f''4
  f''2 e''1\color
  fis''2 d''2 g''2~
  g''2 fis''1\endcolor
  d''2 e''2 f''2
  e''2 f''2 g''2
}

MusicSIii = {
  \clef "treble"
  \MeterTriple
  r2 d''2\color d''2~
  d''2 cis''1\endcolor
  R1.
  d''2 a'2 c''2
  b'4( a'4 g'4 a'4 b'4 c''4)
  d''1.
  R1.
  r2 r2 c''4 c''4
  c''2\color b'1
  cis''2 a'2 d''2~
  d''2 cis''1\endcolor
  R1.
  a'2 b'2 c''2
  b'2 c''2 d''2
  cis''1 cis''2
}

MusicAc = {
  \clef "bass"
  \MeterTriple
  d'2 g1
  a2 a1
  d'2 d'1
  d1.
  g1.
  d1 d2
  g2 b2 b2
  c'1 c'2
  c'2\color g1
  a2 f2 d2~
  d2 a1\endcolor
  d'2 b2. c'4
  d'1.
  g2 g2 d2
  a1 a2
}

LyricsSIi = \lyricmode {
  \StanzaIV 
  Con -- cier -- to,
  \EdLyrics { con -- cier -- to }
  tan so -- be -- ra -- no
  só -- lo pu -- do ser re -- pa -- ro,
  con u -- na voz tan hu-
}

LyricsSIii = \lyricmode {
  \StanzaIV
  Con -- cier -- to
  tan so -- be -- ra -- no
  só -- lo pu -- do ser re -- pa -- ro
  con u -- na voz tan hu -- mil -- de
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
        \InstrumentName "Ti. I-1" ""
        \new Voice = "SIii" { \MusicSIii }
        \new Lyrics \lyricsto "SIii" { \LyricsSIii }
      >>
    >>
    \new ChoirStaff = "Continuo"
    <<
      \ShowChoirStaffBracket
      \new Staff = "Ac"
      <<
        \InstrumentName "Ac." ""
        \new Voice = "Ac" { \MusicAc }
      >>
    >>
  >>
}
