%% Carrión, Si los sentidos, E-SE: 28/25
%% example

\version "2.19"
\include "villancico.ly"
\include "example.ly"

%% CARRION, SI LOS SENTIDOS
%% MUSIC

EstribilloSolo = {
  \clef "treble"
  \MeterTriple

  |a'2 b'2 c''2
  | f'2\color e'1
  | a'1.~
  | a'2 gis'1\endcolor
  | b'2 c''2 d''2
  | cis''2. cis''4 d''2~\color 
  | d''2 e''1\endcolor
  | R1.
  | r2 c''2 g'2
  | a'2 f'2 g'2
  | e'1.~\color
  | e'2 d'1\endcolor
  | r2 e'2 g'2
  | fis'2. g'4 a'2
  | a'2\color gis'1\endcolor
  | r2 a'2 c''2
  | b'2. c''4 d''2
  | d''2\color cis''1\endcolor
  | R1.
  | r2 e''2 b'2
  | c''2 a'2 b'2
  | gis'1.
  | e''2 c''2 d''4( c''4)
  | b'2\color c''1\endcolor
  | R1.
  | r2 c''2 g'2
  | a'2 f'2 g'2
  | e'1 r2
  | c''2 a'2 b'4( a'4)
  | gis'2\color a'1\endcolor
  | R1.
}

EstribilloAcomp = {
  \clef "bass"
  \MeterTriple
  a1.
  | d'2\color c'1\endcolor
  | f1.
  | e1. 
  | gis1.
  | a1\color d'2~
  | d'2\endcolor c'2 g2
  | a2 f2 g2
  | e2 a2 e2
  | f2 d2 e2
  | c2 c'2 g2 
  | a2 f2 g2
  | e1.
  | d1.
  | e1.
  | a1.
  | gis1.
  | r2 a2 e2 
  | f2 d2 e2
  | c2\color e1
  | a2 f1\endcolor
  | e2 e'2 b2
  | c'2 a2 b2
  | gis2 a2 e2 
  | f2 d2 e2
  | c2\color e1 
  | f2 d1\endcolor
  | c2 c'2 g2
  | a2 f2 g2
  | e2 f2 c2
  | d2 b,2 c2
}

EstribilloFiguresAcomp = \figuremode {
  \MeterTriple
  | s1.
  | s1.
  | s1.
  | <4>1.
  | s1.
  | s1.
  | s1 <6>2
  | s1.
  | s1.
  | s1.
  | s1 <6>2
  | s2 <6>2 s2
  | s1.
  | <_+>1.
  | <4>1.
  | s1.
  | s1.
  | s2 <_+>2 <6>2
  | s1.
  | s1.
  | s1.
  | <_+>2 s1
  | s1.
  | s1 <6>2
  | s1.
  | s2 <6>1

}

%% CARRION, SI LOS SENTIDOS
%% LYRICS

LyricsEstribilloSolo = \lyricmode {
  Si los sen -- ti -- dos
  que -- ja for -- man del Pan Di -- vi -- no,
  por -- que lo que~e -- llos sien -- ten 
  no~es de Fe con -- sen -- ti -- do,
  \EdLyrics { no~es de Fe con -- sen -- ti -- do, }
  to -- dos hoy con la Fe se -- an o -- í -- dos,
  to -- dos hoy con la Fe se -- an o -- í -- dos.
}

\score {
  <<
    \new Staff
    <<
      \InstrumentName "SOLO" ""
      \new Voice = "Solo" {\EstribilloSolo }
      \new Lyrics \lyricsto "Solo" { \LyricsEstribilloSolo }
    >>
    \new Staff
    <<
      \InstrumentName "ACOMP." ""
      \new Voice = "Acomp" { \EstribilloAcomp }
      \new FiguredBass { \EstribilloFiguresAcomp }
    >>
  >>
  \layout {
    short-indent = 0\in
    \context { 
      \Score 
      \omit BarNumber
    }
  }
}



