% ANON., ANTÓN LLORENTE, Y BAROLO
% MEX-Mcen: CSG.014
% Example for . ch1

\version "2.19"
\include "villancico.ly"
\include "vcbook-example.ly"

%*******************
% MUSIC
%*******************

MusicSIi = {
  \clef "treble"
  \MeterTriple
  r2 r2 g''2~\color
  g''2 g''1~
  g''2 e''1\endcolor
  f''2 e''2 e''2
  d''2\color d''2 g''2~
  g''2 g''1~
  g''2 e''1\endcolor
  f''2 e''2 e''2 
  d''2\color d''2 e''2~
  e''2 d''1~
  d''2 e''2 e''2\endcolor
  e''2 f''1 
  e''1.
  r2 r2 e''2~\color
  e''2 e''1~
  e''2 f''2 f''2\endcolor
  g''2 g''1 
  g''2\color e''2 e''2~
  e''2 f''1\endcolor
  e''2 d''1 
  e''2\color d''1\endcolor
  d''1.\fermata
  \RepeatBarEnd
  \break
} 

MusicSIii = {
  \clef "treble"
  \MeterTriple
  r2 r2 d''2~
  d''2 d''1~
  d''2 c''1 
  d''2 c''2 c''2
  b'2 b'2 d''2~
  d''2 d''1~
  d''2 c''1 
  d''2 c''2 c''2
  b'2 b'2 c''2~
  c''2 a'1~
  a'2 c''2 c''2 
  c''2 d''1
  b'1. 
  r2 r2 c''2~ 
  c''2 c''1~
  c''2 d''2 d''2
  e''2 d''1 
  e''2. d''4 c''2~
  c''2 d''1 
  g'2 b'1
  c''2 a'1 
  b'1.\fermata
}

MusicAI = {
  \clef "treble_8"
  \MeterTriple
  r2 r2 b'2~
  b'2 b'1~
  b'2 g'2 g'2~
  g'2 g'2 g'2
  g'2 g'2 b'2~
  b'2 b'1~
  b'2 g'2 g'2~
  g'2 g'2 g'2
  g'2 g'2 g'2~
  g'2 f'1~
  f'2 a'2 a'2 
  a'2 a'1 
  gis'1. 
  r2 r2 a'2~ 
  a'2 a'1~
  a'2 a'2 a'2 
  c''2 d''1 
  c''2 g'2 a'2~
  a'2 a'1 
  c''2 g'1 
  g'2 fis'1 
  g'1.\fermata
}

MusicTI = {
  \clef "treble_8"
  \MeterTriple
  r2 r2 g'2~\color 
  g'2 g'1~
  g'2 c'1\endcolor 
  b2 c'2 c'2
  g2\color g2 g'2~
  g'2 g'1~
  g'2 c'1\endcolor 
  b2 c'2 c'2
  g2\color g2 c'2~
  c'2 d'1~
  d'2 a2 b2 
  c'2 d'1\endcolor
  e'1. 
  r2 r2 a2~\color
  a2 a1~
  a2 d'2 d'2\endcolor 
  c'2 b1 
  c'2. b4 a2~\color
  a2 d'1\endcolor 
  c'2 g1  % XXX check
  a2\color d1\endcolor 
  g1.\fermata
}

MusicBI = {
  \clef "bass"
  \MeterTriple
  R1.*22
  % BI solo begins, TI tacet
  \Section "RESPONSIÓN a 8" 
  r2\MarkThisUp "B. solo" g2 g2 
  g2. a4 b2 
  c'1 c'2 
  b2 a2 g2 
  a2\color g1\endcolor
  r2 g2 g2
  g2. a4 b2
  c'1 c'2
  b2 a2 g2
  a2\color g1\endcolor
  r2 d'2 d'2
  e'2. d'4 c'2
  d'1 b2
  c'2 b2 b2 
  a2\color g1\endcolor
  r2 d'2 d'2
  e'2. d'4 c'2
  d'1 b2
  c'2 b2 b2 
  a2\color g1\endcolor
}

%*******************
% LYRICS
%*******************

LyricsSIi = \lyricmode {
  An -- tón Llo -- ren -- te~|y Bar -- to -- lo,
  \EdLyrics { An -- tón Llo -- ren -- te~|y Bar -- to -- lo } 
  tra -- za -- ron un me -- mo -- rial
  de que con los vi -- llan -- ci -- cos 
  se~han al -- za -- do Gil y Bras.
}

LyricsBI = \lyricmode {
  % BASS I solo
  No quie -- ro que me Bras -- en ni que me Gil -- en,
  no \EdLyrics { quie -- ro que me Bras -- en ni que me Gil -- en, }
  si -- no que me Llo -- ren -- ten y me To -- ri -- bien,
  \EdLyrics { si -- no que me Llo -- ren -- ten y me To -- ri -- bien, }
}

%*******************
% SCORE
%*******************

\score {
  <<
    \new ChoirStaff = "ChI"
    <<
      \new Staff = "Si-ii" 
      <<
        \InstrumentName
        \TwoLineName "Ti. I-1" "Ti. I-2" 
        ""
        <<
          \new Voice = "SIi" { \voiceOne \MusicSIi }
          \new Voice = "SIii" { \LowerVoice \voiceTwo \MusicSIii }
          \new Lyrics \lyricsto "SIi" { \LyricsSIi }
        >>
        \new Staff = "AT"
        <<
          \InstrumentName 
          \TwoLineName "A. I" "T./B. I"
          ""
          \new Voice = "AI" { \voiceOne \MusicAI }
          \new Voice = "TI" { \LowerVoice \voiceTwo \MusicTI }
        >>
        \new Staff = "B"
        <<
          \InstrumentName "B. I" ""
          \new Voice = "BI" { \MusicBI }
          \new Lyrics \lyricsto "BI" { \LyricsBI }
        >>
      >>
    >>
  >>
  \layout { 
    \context {
      \Staff
      \RemoveAllEmptyStaves
    }
  }
}
