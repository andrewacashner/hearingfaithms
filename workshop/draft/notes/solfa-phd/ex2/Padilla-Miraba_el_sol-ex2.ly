% EXAMPLE 2 (m 46b-50)

% JUAN GUTIERREZ DE PADILLA
% MIRABA EL SOL
% MEX-Pc: Leg. 34 (MS anthology)

% Edited by Andrew A. Cashner, 2014-09-09

% VC de concepción, a duo y a 4
% Only tenor part extant

% revised 2019/07
\version "2.19"
\include "villancico.ly"
\include "vcbook-example.ly"

MusicT = {
  \clef "treble_8"
  \MeterTriple
  \CantusMollis
  d'2 g1
  c'2\color a1\endcolor 
  g1.~
  g1. 
  g'2\color fis'1
  g'2 e'1\endcolor 
  d'2 g1
  c'1.~
  c'1.
}

LyricsT = \lyricmode {
  y~e -- lla~al sol mi re, y~e -- lla~al sol mi -- re al sol, 
}

\score {
  <<
    \new Staff 
    <<
      \new Voice = "T" { \MusicT }
      \new Lyrics \lyricsto "T" { \LyricsT }
    >>
  >>
  \layout { 
    ragged-right = ##t
  }
}

