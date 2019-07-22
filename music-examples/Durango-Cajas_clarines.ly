% MATIAS DURANGO, CAJAS Y CLARINES
% E-E: Música 29/15
% Excerpt from SI-1 part for ch. 1 (on clarines), doubled with SIII (chirimia)

\version "2.19"
\include "villancico.ly"
\include "vcbook-example.ly"

MusicSIi = {
  \clef "treble"
  c''4 g'4 c''4 d''4 
  e''4 f''8[ e''8] d''8[ c''8(] d''4)
  c''2
  c''4 g'4 c''4 d''4 
  e''4 f''8[ e''8] d''8[ c''8(] d''4)
  c''2
}

LyricsSIi = \lyricmode {
  Ca -- jas, ca -- jas y cla -- ri -- nes,
  ca -- jas, ca -- jas y cla -- ri -- nes
}

\score {
  <<
    \new Staff 
    <<
      \InstrumentName
      \TwoLineName "Ti. I-1" "Ti. III (chirimía)"
      ""
      \new Voice = "SIi" { \MusicSIi}
      \new Lyrics \lyricsto "SIi" { \LyricsSIi }
    >>
  >>
}

