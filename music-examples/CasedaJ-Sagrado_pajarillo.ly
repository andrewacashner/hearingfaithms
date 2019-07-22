% JOSE DE CASEDA, SAGRADO PAJARILLO
% MEX-Mcen: CSG.155
% Excerpt from SI-1 part for diss ch. 1 (on birds)

\version "2.19"
\include "villancico.ly"
\include "vcbook-example.ly"

% start partway through second line of MS
MusicSIi = {
  \clef "treble"
  \MeterDuple
  \partial 2 e''4 e''4 
  fis''8[ g''8 fis''8 g''8 fis''8 g''8 fis''8 a''8] 
  g''8[ a''8 g''8 a''8 g''8 a''8 g''8 a''8  
  e''8 f''8 e''8 f''8 e''8 f''8 e''8 g''8(] 
  f''2) c''4 d''4 
  e''4 f''8[ e''8] d''4.( c''8) 
  c''2 r2 
}

LyricsSIi = \lyricmode {
  con gor -- ge -- _ os, gor -- ge -- _ _  os
}

\score {
  <<
    \new Staff
    <<
      \InstrumentName "Ti. I-1" ""
      \new Voice = "SIi" { \MusicSIi }
      \new Lyrics \lyricsto "SIi" { \LyricsSIi }
    >>
  >>
}

