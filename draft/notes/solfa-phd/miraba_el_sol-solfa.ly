% JUAN GUTIERREZ DE PADILLA
% MIRABA EL SOL
% MEX-Pc: Leg. 34 (MS anthology)
% Edited by Andrew A. Cashner, 2014-09-09
% Revised 2019/07/18

% VC de concepción, a duo y a 4
% Only tenor part extant

\version "2.19"
\include "villancico.ly"
\include "vcbook-example.ly"

MarkThisUp = 
#(define-event-function
   (markup) (markup?)
   #{ ^\markup \italic $markup #})

MusicT = {
  \clef "treble_8"
  \CantusMollis
  \MeterTriple

  \set Score.currentBarNumber = #12
  \ShowFirstBarNumber
  r2 c'1~
  c'2 d'1\MarkThisUp "MOL: la"
  c'2\MarkThisUp "sol" bes1\MarkThisUp "fa"
  a2\MarkThisUp "mi" g1\MarkThisUp "re"
  f2 g2. a4 
  bes2 a2. a4
  g2 a2. bes4 
  c'2 d'2. d'4
  g2 c'1 
  f'2 d'2. d'4\MarkThisUp "NAT: re"
  e'2\MarkThisUp "mi" f'!1\MarkThisUp "fa"
  g'1.\MarkThisUp "sol"
  r2 c'2 c'2~\MarkThisUp "MOL: sol"
  c'2 d'2\MarkThisUp "la" d'4 d'4\MarkThisUp "la"
  c'2 bes1 
  a2\MarkThisUp "mi" c'1\MarkThisUp "sol"
  r2 d'1\MarkThisUp "la"
  r2 c'1
  r2 a1\MarkThisUp "mi"
  g2\MarkThisUp "re" a2 a2\MarkThisUp "mi"
  c'1.~\MarkThisUp "sol"
  c'1.
  d'2\MarkThisUp "la" bes1
  a1.\MarkThisUp "mi"
  g2\MarkThisUp "re" bes1~
  bes2 a2 a2~\MarkThisUp "mi" 
  a2 g2\MarkThisUp "re" c'2\MarkThisUp "sol"
  r2 bes1~
  bes2 a1
  r2 d'2. d'4\MarkThisUp "la"
  b2 b1
  c'1.
  r2 a2. a4\MarkThisUp "mi"
  d'2\MarkThisUp "la" d'4( c'4 bes4 a4)
  bes2 a1 
  c'2 bes2. d'4\MarkThisUp "la"
  a2\MarkThisUp "mi" g1\MarkThisUp "re"
  d'2 g2. d'4\MarkThisUp "la"
  a2\MarkThisUp "mi" d'1\MarkThisUp "NAT: re"
  r2 g'1~
  g'2 fis'1
  \break
  g'2\MarkThisUp "NAT: sol" e'1\MarkThisUp "mi"
  d'1.\MarkThisUp "re" 
  g2 c'1\MarkThisUp "MOL: sol"
  r2 d'2. d'4\MarkThisUp "la" 
  a1.\MarkThisUp "mi"
  g1.\MarkThisUp "re"
  r2 g2 c'2~\MarkThisUp "sol"
  c'2 b1
  c'2\MarkThisUp "sol" f4( g4 a4 bes4)
  c'1.~\MarkThisUp "sol"
  c'1.\fermata
  \FinalBar
}

% LYRICS
LyricsT = \lyricmode {
  en __ la sol -- fa mi -- re,
  pues a -- gra -- cia -- da~en un pun -- to,~en
  un pun -- to se ve 
  con tan -- ta re -- mi -- fa -- sol,
  que so -- la a la luz de mi sol la
  ad -- mi -- re de mi sol, __
  la ad -- mi -- re.
  A -- ve,  mi -- ra -- sol, A -- ve, 
  y la gra -- cia fue que~el mi -- la -- no __ nun -- ca,
  nun -- ca la mi -- re, nun -- ca la mi -- re,
  y|~e -- lla~al sol mi re, al sol, y la mi -- re, 
  el sol, __ el sol, el __ sol. __
}

% SCORE
\score {
  <<
    \new Staff 
    <<
      \new Voice = "T" { \MusicT }
      \new Lyrics \lyricsto "T" { \LyricsT }
    >>
  >>
  \layout {
    indent = 0\pt
    \context { 
      \Score
      \override TextScript.staff-padding = #2
      \textLengthOn
    }
  }
}




