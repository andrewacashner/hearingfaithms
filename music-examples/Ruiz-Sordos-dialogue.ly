% MATIAS RUIZ, PUES LA FIESTA DEL NIÑO ES (VILLANCICO DE LOS SORDOS)
% E-E: Mús. 83-12
% Example 1, mm. 41--55, catechetical dialogue
% 2017-01-19 revised for book proposal
% 2015-02-20

\version "2.19"
\include "villancico.ly"
\include "vcbook-example.ly"

Solo = \MarkThisUp \markup \italic "Solo"

%*******************
% MUSIC
%*******************

MusicSIii = {
  \clef "treble"
  \MeterTriple
  | R1. 
  | R1.
  | r2 g''2\Solo g''2~\color
  | g''2 d''1\endcolor
  | r2 e''2 f''2~\color
  | f''2 e''1\endcolor
  | d''1. 
  | c''1.
  | R1. | R1.
  | R1. | R1.
  | R1. | R1.
  | r2 g''2 e''2~\color
  | e''2 f''1\endcolor
  | d''1. 
  | r2 d''2 a'2 
  | b'2\color g'1 
  | c''1 b'2~
  | b'2 a'1\endcolor 
  | g'1.
  | R1. | R1.
  | R1. | R1.
  | R1. | R1.
  | R1. | R1.
}

MusicBI = {
  \clef "treble_8"
  f'2\Solo e'2 d'2 
  | c'2 b2 a2
  | g1. 
  | R1. | R1.
  | R1. | R1. 
  | r2 r2 c'2~\color
  | c'2 f'1\endcolor 
  | e'2 d'2 c'2~\color
  | c'2 b1\endcolor 
  | c'2 d'2 c'2
  | b1 b2 
  | a2 b2 a2
  | g2 r2 r2 
  | R1. | R1.
  | R1. | R1.
  | R1. | R1.
  | R1.
  | c'2 d'2 c'2 
  | b2 c'2 b2
  | a1\color g2~
  | g2 g1\endcolor
  | c'2 d'2 c'2 
  | b1\color c'2~
  | c'2\endcolor a1 
  | g1.
}

MusicAc = {
  \clef "bass"
  f2 f2 g2 
  | c1 d2
  | g1\color g2~
  | g2 g1 
  | c'2 c'2 f2~
  | f2 c1\endcolor
  | g1. 
  | c'1\color c'2~
  | c'2 f1\endcolor 
  | c'2 b2 c'2
  | f2\color g1\endcolor 
  | c'2 b2 a2 
  | g1. 
  | d1.
  | g2\color g2 c'2~
  | c'2 f1\endcolor
  | g1. 
  | d1. 
  | g1. 
  | c1\color g2~
  | g2 d1\endcolor 
  | g1. 
  | c'2 b2 a2 
  | g1.
  | d1\color g2~
  | g2 g1\endcolor
  | c1. 
  | g1\color c2~
  | c2 d1\endcolor 
  | g1.
}

%*******************
% LYRICS
%*******************

LyricsSIii = \lyricmode {
  ¿Quién lla -- ma con tan -- to~es -- truen -- do?
  Ba -- jad la voz, que~a Dios gra -- cias no soy __ sor -- do.
}

LyricsBI = \lyricmode {
  Én -- tro -- me de~hoz y de coz.
  Hab -- len al -- to, que __ no~en -- tien -- do si no le -- van -- tan la voz.
  ¿Di -- ce que~es -- tá~el ni -- ño gor -- do?
  pues de~e -- so me~a -- le -- gro __ mu -- cho.
}

%*******************
% SCORE
%*******************

\score {
  <<
    \new Staff = "SIii" 
    <<
      \InstrumentName "Ti. I-2" ""
      \new Voice = "SIii" { \MusicSIii }
      \new Lyrics \lyricsto "SIii" { \LyricsSIii }
    >>
    \new Staff = "BI"
    <<
      \InstrumentName "B. I" ""
      \new Voice = "BI" { \MusicBI }
      \new Lyrics \lyricsto "BI" { \LyricsBI }
    >>
    \new Staff = "Ac"
    <<
      \InstrumentName "Ac." ""
      \new Voice = "Ac" { \MusicAc }
    >>
  >>
  \layout {
    \context { 
      \Score
      \omit BarNumber
    }
  }
}

