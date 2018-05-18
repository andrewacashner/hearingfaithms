% Padilla-Voces-maxima.ly
% mm. 152--156

\version "2.19"
\include "villancico.ly"
\include "example.ly"

MusicAII = {
  \clef "treble"
  \CantusMollis
  \MeterTriple
  \cadenzaOn
  f'2 f'2 f'2
  g'2 a'2 bes'2
  a'2(\color bes'1. a'1)\endcolor
  bes'1.
}

MusicTII = {
  \clef "treble_8"
  \CantusMollis
  \MeterTriple
  \cadenzaOn
  d'2 d'2 d'2
  \AnnotateOne "breve" { es'\breve\colorOne } { es'8\NB es'8\endNB } d'2 d'2
  c'1. d'1.
}

MusicBI = {
  \clef "bass"
  \CantusMollis
  \MeterTriple
  \cadenzaOn
  bes2 bes2 bes2
  es2 f2 g2
  \AnnotateOne "breve" { f\breve. } { f8\NB f8\endNB }
  bes,1.
}

LyricsAII = \lyricmode {
  y de la má -- xi -- ma~|y bre -- ve
}

\score {
  <<
    \new ChoirStaff
    <<
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
        \new Lyrics \lyricsto "TII" { \LyricsAII }
      >>
    >>
    \new ChoirStaff
    <<
      \ShowChoirStaffBracket
      \new Staff = "BI" 
      <<
        \InstrumentName \TwoLineName "B. I" "[inst.]" ""
        \new Voice = "BI" { \MusicBI }
      >>
    >>
  >>
}

