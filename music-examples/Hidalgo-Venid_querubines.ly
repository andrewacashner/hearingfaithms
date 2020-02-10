% JUAN HIDALGO, VENID QUERUBINES ALADAS
% D-Mbs: Mus. ms. 2897
% Musical example for ch. 1, on clarines (and birds)
% Excerpt: Copla 5 with "respuesta", SS, Ac

\version "2.19"
\include "villancico.ly"
\include "vcbook-example.ly"

%*******************
% MUSIC
%*******************

MusicSi = {
  % COPLA 5 (= 1, 3)
  \clef "treble"
  \MeterTriple
  \CantusMollis
  r2 d''2 e''2
  f''1.
  r2 a'2 bes'2
  c''1.  
  r2 f'4( g'4) a'4( bes'4)
  c''2 a'4( bes'4) c''4( d''4) 
  a'2 f'4( g'4) a'4( bes'4)
  c''2 a'4( bes'4) c''4( d''4) 
  a'2\color f'1\endcolor
  r2 r2 a'2
  bes'1\color a'2~
  a'2\endcolor g'4( a'4 bes'4 c''4) 
  f'1.
  r1.	

  r2 bes'4( c''4) d''4( \ficta es''4)
  f''2 d''4( \ficta es''4) f''4( g''4) 
  d''2 bes'4( c''4) d''4( \ficta es''4)
  f''2 d''4( \ficta es''4) f''4( g''4) 
  d''2\color bes'1
  r2 g'2 bes'2~
  bes'2 bes'2. a'4\endcolor
  bes'1.~
  bes'1.\fermata
  \MiddleBar
}

MusicSii = {
  \clef "treble"
  \MeterTriple
  \CantusMollis
  r1.
  r2 d''2 e''2 
  f''1.
  r2 a'2 bes'2 
  c''1.
  r2 f'4( g'4) a'4( bes'4) 
  c''2 a'4( bes'4) c''4( d''4)
  a'2 f'4( g'4) a'4( bes'4) 
  c''2 a'4( bes'4) c''4( d''4)
  a'2\color f'1 
  r2 d''2 f''2~
  f''2\endcolor f''2. e''4 
  f''1.

  r2 bes'4( c''4) d''4( \ficta es''4) 
  f''2 d''4( \ficta es''4) f''4( g''4)
  d''2 bes'4( c''4) d''4( \ficta es''4) 
  f''2 d''4( \ficta es''4) f''4( g''4)
  d''2\color bes'1\endcolor 
  r2 r2 d''2
  es''1\color d''1 c''1\endcolor
  d''1.~
  d''1.\fermata
}

MusicAc = {
  % COPLAS
  \clef "bass"
  \MeterTriple
  \CantusMollis
  bes,1.
  bes1.
  f1.
  f,1.  
  f2 f2 f2 
  f1 f,2 
  f2 f2 f2
  f1 f,2 
  f2 f2 f2
  f1 f,2 
  bes,1\color f,2~
  f,2 c1\endcolor 
  f,1.
  bes2 bes2 bes2 
  bes1 bes,2
  bes2 bes2 bes2 
  bes1 bes,2
  bes2 bes2 bes2 
  bes1 bes,2
  es1\color bes,2~
  bes,2 f1\endcolor
  bes,1.~
  bes,1.\fermata 
}

%*******************
% LYRICS
%*******************

LyricsSi = \lyricmode {
  Es -- cu -- chad, a -- ten -- ded,
  que~el cla -- rín de __ su~au -- ro -- ra, __
  cla -- rín de __ su~au -- ro -- ra,
  mi voz ha __ de __ ser,
  que~el cla -- rín de __ su~au -- ro -- ra, __
  cla -- rín de __ su~au -- ro -- ra,
  mi voz __ ha de ser. __
}

LyricsSii = \lyricmode {
  Es -- cu -- chad, a -- ten -- ded,
  que~el cla -- rín de __ su~au -- ro -- ra, __
  cla -- rín de __ su~au -- ro -- ra,
  mi voz __ ha de ser,
  que~el cla -- rín de __ su~au -- ro -- ra, __
  cla -- rín de __ su~au -- ro -- ra,
  mi voz ha de ser. __
}

%*******************
% SCORE
%*******************

\score {
  <<
    \new ChoirStaff
    <<
      \new Staff = "Si"
      <<
        \InstrumentName "Ti. 1" ""
        \new Voice = "Si" { \MusicSi }
        \new Lyrics \lyricsto "Si" { \LyricsSi }
      >>
      \new Staff =  "Sii"
      <<
        \InstrumentName "Ti. 2" ""
        \new Voice = "Sii" { \MusicSii }
        \new Lyrics \lyricsto "Sii" { \LyricsSii }
      >>
    >>
    \new ChoirStaff
    <<
      \ShowChoirStaffBracket
      \new Staff = "Ac"
      <<
        \InstrumentName
        \TwoLineName "Acomp." "Arpa"
        ""
        \new Voice = "Ac" { \MusicAc }
      >>
    >>
  >>
  \layout { 
    \context {
      \Score
      \omit BarNumber
    }
  }
}

