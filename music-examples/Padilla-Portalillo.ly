% JUAN GUTIERREZ DE PADILLA
% EN LA GLORIA DE UN PORTALILLO
% MEX-Pc: Leg. 1/2, Christmas 1652, first after calenda

% Edited by Andrew Cashner, 2014/08/05
% Revised for book, 2019/07/22
% Musical example for ch. 1, first part of estribillo

\version "2.19"
\include "villancico.ly"
\include "vcbook-example.ly"

%*******************
% MUSIC
%*******************

% CORO I
MusicSI = {
  \clef "treble"
  \MeterTriple
  r2\MarkThisUp "Ti." e''2. e''4 
  c''2 f''2. f''4
  e''2. c''4 d''2~\color
  d''2\endcolor e''2. d''4 
  c''2. b'4 a'2~\color
  \break
  a'2 b'1\endcolor
  R1.*2
  r2 e''2. e''4 
  c''2\color d''1\endcolor
  r2 d''2. d''4 
  d''2 e''2. e''4 
  f''2. f''4 e''2~\color 
  e''2 f''1\endcolor
  \break
  % solo section
  r2\MarkThisUp "Ti." c''2. d''4 
  e''2 a'2. b'4
  cis''2. d''4 cis''2~\color
  cis''2^\endcolor d''2 d''2
  e''2 e''2 f''2 
  e''2 e''2 f''2 
  e''2 e''2 d''2 
  c''2 f''2 d''2
  e''2 d''2 c''2 
  b'2\color c''1\endcolor
  e''2 e''2. d''4 
  e''2. d''4 c''2~
  c''2 b'2. c''4\sh 
  d''2. d''4 cis''2~\color  
  cis''2 d''1\endcolor 
  \break
  R1.*5
  c''2 c''2. c''4 
  d''2. d''4 c''2~
  c''2 c''2. c''4 
}

MusicAI = {
  \clef "treble"
  \MeterTriple
  s1.  s1.  s1.  s1.
  s1.  s1.  s1.  s1.
  r2 g'2. g'4
  a'2 a'1
  r2 a'2. a'4 
  b'2 c''2. c''4
  c''2. c''4 c''2~
  c''2 c''1 
  s1. s1. s1. s1. s1. 
  s1. s1. s1. s1. s1. 
  s1. s1. s1. s1. s1. 
  R1.*5
  g'2 a'2. a'4
  bes'2. a'4 g'2~
  g'2 f'2. f'4
}

MusicTI = {
%  \clef "treble_8"
  \MeterTriple
  s1.  s1.  s1.  s1.
  s1.  s1.  s1.  s1.
  r2 c'2. c'4
  a2\color a1\endcolor
  r2 d'2. d'4 
  b2 e'2. e'4
  c'2. c'4 c'2~\color
  c'2 c'1\endcolor % XX Check MS
  s1. s1. s1. s1. s1. 
  s1. s1. s1. s1. s1. 
  s1. s1. s1. s1. s1. 
  R1.*5
  e'2 f'2. f'4
  f'2. f'4 e'2~\color
  e'2\endcolor a2. a4
}

MusicBI = {
  \clef "bass"
  \MeterTriple
  r2\MarkThisUp "B. [instr.]" c'2. c'4
  a2 d'2. d'4
  c'2. a4 g2~\color
  g2\endcolor c'2. b4
  a2. g4 d'2~
  d'2 g1
  R1.*2
  r2 c2. c4 
  f2 d1
  r2 d2. d4 
  g2 c2. c4
  f2. f4 c2~
  c2 f1
  r2\MarkThisUp "B." f2. f4 
  c2 d2. d4
  a2. d4 a2~
  a2 d2 d'2
  c'2 c'2 f2 
  c'2 c'2 f2
  c'2 c'2 d'2 
  a2 d'2 d'2
  c'2 b2 a2 
  g2 c1
  c'2 c'2 b2 
  c'2. b4 a2~ 
  a2 g2 g2 
  g2. f4 e2~ 
  e2 d1 
  R1.*5
  c'2 f2. f4
  bes2. bes4 c'2~
  c'2 f2. f4
}

% CORO II
MusicSII = {
  \clef "treble"
  \MeterTriple
  R1.*5
  r2 g''2. g''4
  g''2 f''2. f''4
  g''2. g''4 g''2~\color
  g''2 g''1\endcolor
  r2 a''2. a''4
  a''2\color a''1\endcolor 
  g''2 g''2. g''4
  a''2. a''4 g''2~\color 
  g''2 a''1\endcolor
  R1.*22
  e''2 f''2. f''4
}

MusicAII = {
  \clef "treble"
  \MeterTriple
  R1.*5
  r2 g'2. g'4
  g'2 a'2. a'4 
  b'2. c''4 b'2~
  b'2 c''1
  r2 a'2. a'4
  a'2 f'1 
  g'2 g'2. g'4
  f'2. f'4 g'2~
  g'2 f'1
  R1.*22
  c''2 a'2. a'4 % XXX check
}

MusicTII = {
  \clef "treble_8"
  \MeterTriple
  R1.*5
  r2 d'2. d'4
  e'2 c'2. c'4
  d'2. e'4 d'2~\color
  d'2 e'1\endcolor
  r2 d'2. d'4
  e'2\color d'1\endcolor 
  d'2 c'2. c'4
  c'1.~\color
  c'2 a1\endcolor
  R1.*15
  f'2 g'2. g'4
  e'2. e'4 f'2~
  f'2 e'2. e'4
  d'2. e'4 d'2~\color
  d'2 c'1\endcolor
  R1.*2
  c'2 c'2. c'4
}

MusicBII = {
  \clef "bass"
  \MeterTriple
  R1.*5
  r2 g2. g4
  e2 a2. a4
  g2. c'4 g2~
  g2 c'1
  r2 d'2. d'4
  a2 d'1 
  g2 c'2. c'4
  f2. f4 c'2~
  c'2 f1 
  R1.*15
  d'2 g2. g4 
  c'2. c'4 f2~
  f2 c2 c2 
  g2. c4 g2~
  g2 c1  
  R1.*2
  c2 f2. f4
}

%*******************
% LYRICS
%*******************

LyricsSI = \lyricmode {
  En la glo -- ria de~un por -- ta -- li -- llo, 
  de~un por -- ta -- li -- llo,
  en la glo -- ria, 
  en la glo -- ria de~un por -- ta -- li -- llo
  los za -- ga -- les se vuel -- ven ni -- ños
  y~en -- to -- nos so -- no -- ros,
  re -- pi -- ten a co -- ros, 
  en bai -- les lu -- ci -- dos,
  can -- ten las a -- ves, can -- ten al sol na -- ci -- do,
  va -- ya de fies -- tas, va -- ya, pues
}

LyricsTI = \lyricmode {
  En la glo -- ria, 
  en la glo -- ria de~un por -- ta li -- llo
  va -- ya de fies -- tas, va -- ya, pues
}

LyricsAII = \lyricmode {
  En la glo -- ria de~un por -- ta -- li -- llo, 
  en la glo -- ria, glo -- ria de~en por -- ta -- li -- llo,
  %va -- ya de 
}

LyricsTII = \lyricmode {
%  En la glo -- ria de~un por -- ta -- li -- llo, 
%  en la glo -- ria de~un por -- ta -- li -- llo, 
  _ _ _ _ _ _ _ _ _
  _ _ _ _ _ _ _ _ _
  va -- ya de fies -- tas, va -- ya, pues Dios es ni -- ño,
  va -- ya de 
}


%*******************
% SCORE
%*******************

\score {
  <<
    \new ChoirStaff 
    <<
      \new Staff = "SAI"
      <<
        \InstrumentName
        \TwoLineName "Ti. I" "A. I"
        \TwoLineName "Ti. I" "A. I"
        \new Voice = "SI" { \voiceOne \MusicSI }
        \new Voice = "AI" { \voiceTwo \MusicAI }
        \new Lyrics \lyricsto "SI" { \LyricsSI }
      >>
      \new Staff = "TBI"
      <<
        \InstrumentName
        \TwoLineName "T. I" "B. I"
        \TwoLineName "T. I" "B. I"
        \new Voice = "TI" { \voiceOne \MusicTI }
        \new Voice = "BI" { \voiceTwo \MusicBI }
    %    \new Lyrics \with { 
    %      alignAboveContext = "TBI" 
    %    } \lyricsto "TI" { \LyricsTI }
      >>
    >>
    \new ChoirStaff 
    <<
      \ShowChoirStaffBracket
      \new Staff = "SAII"
      <<
        \InstrumentName
        \TwoLineName "Ti. II" "A. II"
        \TwoLineName "Ti. II" "A. II"
        \new Voice = "SII" { \voiceOne \MusicSII }
        \new Voice = "AII" { \voiceTwo \MusicAII }
        \new Lyrics \lyricsto "AII" { \LyricsAII }
      >>
      \new Staff = "TBII"
      <<
        \InstrumentName
        \TwoLineName "T. II" "B. II"
        \TwoLineName "T. II" "B. II"
        \new Voice = "TII" { \voiceOne \MusicTII }
        \new Voice = "BII" { \voiceTwo \MusicBII }
        \new Lyrics \with { 
          alignAboveContext = "TBII" 
        } \lyricsto "TII" { \LyricsTII }
      >>
    >>
  >>
  \layout { 
    short-indent = 0.5\in
    \context { 
      \Staff 
      \RemoveAllEmptyStaves
    }
  }
}
