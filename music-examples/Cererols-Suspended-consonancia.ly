% Cererols, Suspended cielos
% Example: La mas nueva consonancia
\version "2.19"

\include "villancico.ly"
\include "vcbook-example.ly"

MotiveA = \markup \fontsize #2 \bold "A"
MotiveB = \markup \fontsize #2 \bold "B"

MusicSIi = {
  \clef "treble"
  \ShowFirstBarNumber
  \set Score.currentBarNumber = #29
  \MeterTriple
  R1. 
  r2 \Annotate \MotiveA d''2.\NB  e''4 
  f''2\color e''1\endcolor\endNB
  r2 \Annotate \MotiveA d''2.\NB e''4 
  f''2\color e''1\endcolor\endNB
  r2 a''2. c'''4 
  bes''2\color \Annotate \MotiveB a''1\NB
  g''2 f''1 
  e''2 d''1\endcolor\endNB
  cis''1.
}

MusicSIii = {
  \clef "treble"
  \MeterTriple
  r2 \Annotate \MotiveA e''2.\NB f''4\sh 
  g''2\color f''1\na\endcolor\endNB 
  r2 g''2. g''4 
  g''2\color f''1\endcolor 
  r2 g''2. g''4 
  g''2\color fis''1\endcolor 
  r2 d''2. d''4 
  \[ d''1. 
  bes'1. \] 
  a'1.
}

MusicAI = {
  \clef "treble"
  \MeterTriple
  R1. 
  r2 a'2. a'4 
  a'2\color a'1\endcolor 
  r2 a'2. a'4 
  a'2\color a'1\endcolor 
  R1. 
  r2 a'2. c''4 
  bes'2\color \Annotate \MotiveB a'1\NB
  g'2 f'1\endcolor 
  e'1.\endNB
}

MusicTI = {
  \clef "treble_8"
  \MeterTriple
  r1.  
  r2 d'2. d'4 
  d'2\color cis'1\endcolor 
  r2 d'2. d'4 
  d'2\color cis'1\endcolor 
  r2 d'2. d'4 
  g2\color fis1\endcolor 
  g1.~
  g1.
  a1. 
}

MusicAc = {
  \clef "bass"
  \MeterTriple
  r2 a2. a4 
  g2 d'2. d'4 
  d'2\color cis'1\endcolor  
  d'2 d2. d4 
  d2\color a1\endcolor 
  d'2 d'2. d'4 
  g2\color fis1\endcolor 
  g1.~
  g1.
  a2 s2 s2 
}

%*******************
% LYRICS
%*******************

LyricsSIi = \lyricmode {
  la más nue -- va con -- so -- nan -- cia,
  nue -- va con -- so -- nan -- _ _ _ cia
}

LyricsSIii = \lyricmode {
  la más nue -- va con -- so -- nan -- cia,
  la más nue -- va con -- so -- nan -- _ cia
}

LyricsAI = \lyricmode {
  la más nue -- va con -- so -- nan -- cia,
  nue -- va con -- so -- nan -- _ cia
}

LyricsTI = \lyricmode {
  la más nue -- va con -- so -- nan -- cia,
  nue -- va con -- so -- nan -- cia
}


%****************************************
% SCORE
%****************************************


\paper {
  system-system-spacing.padding = #4
}

\score {
  <<
    \new ChoirStaff = "ChI"
    <<
      \new Staff = "SIi" 
      <<
        \InstrumentName "Ti. I-1" ""
        \new Voice = "SIi" { \MusicSIi }
        \new Lyrics \lyricsto "SIi" { \LyricsSIi }
      >>
      \new Staff = "SIii"
      <<
        \InstrumentName "Ti. I-2" ""
        \new Voice = "SIii" { \MusicSIii }
        \new Lyrics \lyricsto "SIii" { \LyricsSIii }
      >>
      \new Staff = "AI"
      <<
        \InstrumentName "A. I" ""
        \new Voice = "AI" { \MusicAI }
        \new Lyrics \lyricsto "AI" { \LyricsAI }
      >>
      \new Staff = "TI"
      <<
        \InstrumentName "T. I" ""
        \new Voice = "TI" { \MusicTI }
        \new Lyrics \lyricsto "TI" { \LyricsTI }
      >>

    >>
    \new ChoirStaff = "Continuo"
    <<
      \ShowChoirStaffBracket
      \new Staff = "Ac" 
      <<
        \InstrumentName "Ac." ""
        \new Voice = "Ac" { \MusicAc }
      >>
    >>
  >>
}

