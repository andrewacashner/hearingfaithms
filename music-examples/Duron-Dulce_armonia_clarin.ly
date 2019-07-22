% SEBASTIAN DURON, DULCE ARMONIA
% E-E: Música 32/16 
% Excerpt from clarin part 

\version "2.19"
\include "villancico.ly"
\include "vcbook-example.ly"

MusicClarin = {
  \clef "treble"
  \MeterTriple
  c''2 g'2 c''2  
  c''2 d''2. d''4
  e''2 c''2 e''2  
  e''2 f''4( e''4) d''4( c''4)
  g''2. f''4 e''4( d''4)  
  e''2 f''4( e''4 d''4 c''4)
  d''2 r2 r2
}

\score {
  <<
    \new Staff 
    <<
      \InstrumentName
      \TwoLineName "Clarín" "Con violines"
      ""
      \new Voice = "Clarin" { \MusicClarin}
    >>
  >>
}

