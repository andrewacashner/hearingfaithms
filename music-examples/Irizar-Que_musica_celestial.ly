% IRIZAR, QUE MUSICA CELESTIAL (E-SE: 18/36 AND 3/28)
% EXAMPLE: OPENING

\version "2.19"
\include "villancico.ly"
\include "vcbook-example.ly"

solo = \MarkThisUp \markup \italic "solo" 

%*******************
% MUSIC
%*******************

MusicSIi = {
  \clef "treble"
  \MeterTriple
  R1.*6
  r1. 
  r2\solo a''2 a''2~\color 
  a''2\endcolor g''2 g''2~\color
  g''2\endcolor f''2 f''2 
  f''2 e''2 e''2 
  e''2\color d''1\endcolor
  cis''2 d''2 d''2~\color
  d''2 cis''1\endcolor
  d''1.
}

MusicAI = {
  \clef "treble"
  \MeterTriple
  r2\solo d''2 d''2~\color
  d''2\endcolor c''2 c''2 
  c''2 bes'2 bes'2~\color
  bes'2\endcolor a'2 a'2
  a'2 g'2 g'2~\color
  g'2\endcolor f'2 f'2~(\color 
  f'2 g'1)\endcolor 
  a'1.
  R1.*7
}

MusicAc = {
  \clef "bass"
  \MeterTriple
  d1. 
  a1. 
  d'1. 
  c'1. 
  bes1. 
  a2\color d1\endcolor
  d'2 c'2 bes2 
  a1.
  d'1. 
  a1.
  g1. 
  f1 g2 
  a2\color d1\endcolor 
  a1. 
  d1 d2
}

%*******************
% LYRICS
%*******************

LyricsSIi = \lyricmode {
  ¿Qué so -- be -- ra -- na~ar -- mo -- ní -- a~es 
  la que~el o -- í -- do~e -- le -- _ va?
}

LyricsAI = \lyricmode {
  ¿Qué mú -- si -- ca ce -- les -- tial __
  es la que~hoy el ai -- re~al -- te -- ra?
}

%*******************
% FIGURES
%*******************

FiguresAc = \figuremode {
  < _ >1. < 4 >1. < 7 >2 < 6 >1 < 7- >1. < 7 >1. < 7 >1.
  < _ >1 < 6 >2 < _ >1.
  < 4 >1. < 7 >1. < 7 >1. < 7 >1. < _ >1. < 4 >1. < _ >1.
}

%*******************
% SCORE
%*******************

\score {
  <<
    \new ChoirStaff
    <<
    \new Staff = "SI1-AI"
    <<
      \InstrumentName "Ti. I-1" "Ti. I-1"
      \new Voice = "SIi" { \MusicSIi }
      \new Lyrics  \lyricsto "SIi" { \LyricsSIi }
    >>
    \new Staff = "AI"
    <<
      \InstrumentName "A. I" "A. I"
      \new Voice = "AI"  { \MusicAI }
      \new Lyrics \lyricsto "AI" { \LyricsAI }
    >>
  >>
  \new ChoirStaff
  <<
    \ShowChoirStaffBracket
    \new Staff = "Ac"
    <<
      \InstrumentName "Ac." "Ac."
      \new Voice = "Ac" { \MusicAc }
      \new FiguredBass { \FiguresAc }
    >>
  >>
  >>
  \layout {
    short-indent = 0.5\in
    \context { 
      \Score
      \RemoveAllEmptyStaves
    }
  }
}

