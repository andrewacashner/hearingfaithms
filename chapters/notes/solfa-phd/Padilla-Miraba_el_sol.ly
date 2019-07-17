% JUAN GUTIERREZ DE PADILLA
% MIRABA EL SOL
% MEX-Pc: Leg. 34 (MS anthology)

% Edited by Andrew A. Cashner, 2014-09-09
% Revised 2019/07/17

% VC de concepción, a duo y a 4
% Only tenor part extant

\version "2.19"
\include "villancico.ly"

\header {
  title		= "Miraba el sol el águila bella"
  subtitle 	= "De Concepción."
  composer	= "JUAN GUTIÉRREZ DE PADILLA"
  dates		= "(c. 1590–1664)"
  source	= "“Villançicos dibinos, i umanos de diversos autores,” MEX-Pc:
  Leg. 34 (Only Tenor part extant)"
  editor 	= "Andrew A. Cashner"
  copyright     = "Copyright © 2019 Andrew A. Cashner"
}

%****************************************
% MUSIC

% INCIPIT
IncipitT = {
  \MeterCZ
  \CantusMollis
  \MSclefCiii
  a1
}

% MAIN
MusicT = {
  \clef "treble_8"
  \CantusMollis
  \MeterTriple

  \Section "[INTRODUCCIÓN] a duo"
  R1.
  r2 a1 
  g2 f1
  c'2 d'1 
  c'2 bes2. bes4
  a2 g2 g2 
  d'2 es'2. es'4
  d'2 c'1 
  bes2 a1
  g2(\color d'1)\endcolor 
  c'1.
  \MiddleBar
  \break

  % signum congruentiae: estribillo next
  \Section "[ESTRIBILLO]"
  r2 c'1~
  c'2\color d'1\endcolor
  c'2 bes1 
  a2 g1
  f2 g2. a4 
  bes2 a2. a4
  g2 a2. bes4 
  c'2 d'2. d'4
  g2 c'1 
  f'2 d'2. d'4
  e'2\color fis'1\endcolor 
  g'1. 
  r2 c'2 c'2~
  c'2 d'2 d'4 d'4
  c'2 bes1 
  a2\color c'1
  r2 d'1 
  r2 c'1
  r2 a1\endcolor 
  g2 a2 a2
  c'1.~
  c'1.
  d'2\color bes1\endcolor 
  a1.
  g2\color bes1~
  bes2 a2 a2~
  a2\endcolor g2 c'2 
  r2 bes1~\color
  bes2 a1\endcolor 
  r2 d'2. d'4
  b2\color b1\endcolor 
  c'1.
  r2 a2. a4 
  d'2 d'4( c'4 bes4 a4)
  bes2 a1 
  c'2 bes2. d'4
  a2 g1 
  d'2 g2. d'4
  a2\color d'1  
  r2 g'1~
  g'2 fis'1 
  g'2 e'1\endcolor
  d'1. 
  g2\color c'1\endcolor
  r2 d'2. d'4 
  a1.
  g1.
  r2 g2\color c'2~
  c'2 b1\endcolor
  c'2 f4( g4 a4 bes4)
  c'1.~
  c'1.\fermata
  \MiddleBar % \Fine
  \break
 
  % RESPONSION A4 del duo
  \Section "RESPONSIÓN a 4 del duo"
  r2 f'1~\color
  f'2 e'2 e'2~ 
  e'2 d'1\endcolor 
  c'1.
  r2 g'2. f'4 
  e'2 f'1
  r2 d'2. d'4 
  e'2\color a1~
  a2 g2 c'2~
  c'2 b1\endcolor 
  c'1. 
  r2 d'2. d'4
  b2\color b1\endcolor 
  c'1.
  a2 a1 
  a2 d'2 d'2 
  d'2\color a1\endcolor 
  r2 a2. a4
  d'2 d'4( c'4 bes4 a4) 
  bes2\color f1\endcolor
  c'2 c'1 
  a2 a2 a2
  a2\color d'1 
  r2 a1~ 
  a2 d'1\endcolor 
  c'2 d'2. d'4
  e'!2 d'1 
  d'2 g1
  c'2\color a1\endcolor 
  g1.~
  g1. 
  g'2\color fis'1 
  g'2 e'1\endcolor 
  d'2 g1
  c'1.~
  c'1.
  R1. 
  r2 d'2. d'4
  a2\color d'1\endcolor 
  c'1.
  r2 c'2. d'4 
  e'2 f'1 
  g'2\color f'1\endcolor 
  e'1.~
  e'1.\fermata
  \MiddleBar
  \break

  % COPLAS a duo
  \Section "COPLAS a duo"
  r2 f'1 
  d'2 g'2. f'4 
  e'2 f'1 
  d'2( e'1) 
  f'2 d'1 
  c'2 a4( g4 a4 bes4)
  c'2 c'2. d'4 
  c'2 bes2. a4
  bes1. 
  a1.
  R1. 
  d'2 d'2 d'2
  b2 b2 b2 
  c'1.~\color
  c'2 d'1\endcolor 
  c'2 bes1
  a2\color g1\endcolor 
  d'2 es'1
  d'2 c'1 
  bes2 a1
  bes2( c'1) 
  f1.\fermata
  R1. 
  r2 c'1 
  f'2 d'1 
  e'2 fis'2. fis'4 
  g'2 e'2. e'4 
  fis'2\color g'1~ 
  g'2\endcolor f'2. e'4 
  f'2 d'2 d'2~
  d'2 b2. b4 
  c'1.
  R1.\RepeatMsg "To estribillo"
  \MiddleBar
  \break

  r2 f'1 
  d'2 g'2. f'4
  e'2\color f'1\endcolor 
  d'2( e'1)
  f'2 d'1 
  c'2 a4( g4 a4 bes4)
  c'2 c'2. d'4 
  c'2 bes2. a4
  bes1. 
  a1.
  R1. 
  d'2 d'4 c'4( bes4 a4)
  bes2\color bes1 
  c'1.~
  c'2 d'1\endcolor 
  c'2 bes1
  a2 g1 
  d'2 es'1
  d'2 c'1 
  bes2 a1 
  bes2(\color c'1)\endcolor 
  f1.
  R1. 
  r2 c'1
  f'2 d'1 
  e'2 f'2. f'4
  g'2 e'!1 
  f'2 g'2 g'2~
  g'2 f'2. e'4 
  f'2 d'2 d'2~
  d'2 b!2. b4 
  c'1.
  R1.\RepeatMsg "To estribillo"
  \FinalBar
}

% LYRICS
LyricsT = \lyricmode {
  % INTRODUCCION
  Mi -- ra -- ba~el sol el á -- gui -- la
  be -- lla, y vién -- do -- la yo
  su lim -- pio cri -- sol, 

  % ESTRIBILLO
  en la sol -- fa mi -- re,
  pues a -- gra -- cia -- da~en un pun -- to,~en
  un pun -- to se ve 
  con tan -- ta re -- mi -- fa -- sol,
  que so -- la a la luz de mi sol la
  ad -- mi -- re de mi sol,
  la ad -- mi -- re.
  A -- ve,  mi -- ra -- sol, A -- ve, 
  y la gra -- cia fue que~el mi -- la -- no __ nun -- ca,
  nun -- ca la mi -- re, nun -- ca la mi -- re,
  y|~e -- lla~al sol mi re, al sol, y la mi -- re, 
  el sol, __ el sol, el __ sol.

  % RESPONSION
  A -- ve, mi -- ra -- sol, A -- ve, A -- ve, A -- ve, mi mi -- ra -- 
  sol, A -- ve, y la gra -- cia fue, gra -- cia fue, y la gra -- cia
  que~el mi -- la -- no __ nun -- ca, nun -- ca, nun -- ca la mi -- re, nun -- ca,
  nun -- ca la mi -- re __ y|~e -- lla~al sol mi re, y|~e -- lla~al sol mi -- re al
  sol, y la mi -- re~el sol, y la mi -- re~el sol, el sol. __

  % COPLA 1
  \StanzaI
  A~el cie -- lo su can -- to~a -- le -- gra pues que~el sol la  a  -- cri -- 
  so -- la,~a -- cri -- so -- la, ni~u -- na se mí -- ni -- ma so -- la, tu -- vo de la no -- ta
  ne -- gra, no -- ta ne -- gra, can -- ta -- ba~en dul -- ce be -- mol sin que~A -- 
  dán to -- no le de. Su lim -- pio cri -- sol,

  % COPLA 2
  \StanzaII
  Al ni -- do y pun -- to de voz en -- tró de~ins -- 
  tan -- tes sin te -- dio, sin te -- dio, que no hay __ tiem -- po de por
  me -- dio en la má -- _ xi -- ma de Dios, de __ Dios, so -- bre~un e --
  rran -- te fa -- rol, e -- co~el com -- pás con el pie. Su lim -- pio cri --
  sol,
}

% SCORE
\score {
  <<
    \new Staff 
    <<
      \IncipitStaff "TENOR" "" { \IncipitT }
      \new Voice = "T" { \MusicT }
      \new Lyrics \lyricsto "T" { \LyricsT }
    >>
  >>
}




