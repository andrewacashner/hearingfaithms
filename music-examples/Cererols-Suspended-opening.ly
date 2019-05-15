% Cererols, Suspended cielos
% Example: Opening
\version "2.19"

\include "villancico.ly"
\include "vcbook-example.ly"

MotiveA = \markup \fontsize #2 \bold "A"

MusicSIi = {
  \clef "treble"
  \MeterTriple
  r2 fis''2 fis''2 
  fis''2\color g''1~
  g''2 fis''1\endcolor 
  R1.
  R1. 
}

MusicSIii = {
  \clef "treble"
  \MeterTriple
  r2 d''2 d''2 
  d''2\color d''1~
  d''2 d''1\endcolor 
  R1.
  R1.
}

MusicAI = {
  \clef "treble"
  \MeterTriple
  r2 \Annotate \MotiveA a'2\NB b'2 
  c''2 b'1~\color
  b'2 a'1\endcolor\endNB
  R1.
  R1.
}

MusicTI = {
  \clef "treble"
  \MeterTriple
  r2 d'2 d'2 
  d'2\color g'1~
  g'2 d'1\endcolor 
  R1.
  R1.
}

MusicSII = {
  \clef "treble"
  \MeterTriple
  R1.
  R1.
  r2 d''2 d''2 
  d''2\color d''1~
  d''2 d''1\endcolor 
}

MusicAII = {
  \clef "treble"
  \MeterTriple
  R1.
  R1.
  r2 \Annotate \MotiveA a'2\NB b'2 
  c''2\color b'1~
  b'2 a'1\endcolor\endNB
}

MusicTII = {
  \clef "treble"
  \MeterTriple
  R1.
  R1.
  r2 fis'2 fis'2 
  fis'2\color g'1~
  g'2 fis'1\endcolor
}

MusicBII = {
  \clef "bass"
  \MeterTriple
  \override MultiMeasureRest.staff-position = #9
  R1.
  R1.
  r2 d2 d2 
  d2\color g1~
  g2 d1\endcolor
}

MusicAc = {
  \clef "bass"
  \MeterTriple
  r2 d'2 d'2 
  d'2\color g1~
  g2\endcolor d2 d2 
  d2\color g1~
  g2 d1\endcolor
}

%*******************
% LYRICS
%*******************

LyricsSI = \lyricmode {
  Sus -- pen -- ded, cie -- los,
}

LyricsAII = \LyricsSI

%****************************************
% SCORE
%****************************************

\paper {
  ragged-right = ##t
}
\score {
  <<
    \new ChoirStaff = "ChI"
    <<
      \new Staff = "SI" 
      <<
        \InstrumentName \TwoLineName "Ti. I-1" "Ti. I-2" ""
        \new Voice = "SIi" { \voiceOne \MusicSIi }
        \new Voice = "SIii" { \LowerVoice \MusicSIii }
        \new Lyrics \lyricsto "SIii" { \LyricsSI }
      >>
      \new Staff = "ATI"
      <<
        \InstrumentName \TwoLineName "A. I" "T. I" ""
        \new Voice = "AI" { \voiceOne \MusicAI }
        \new Voice = "TI" { \LowerVoice \MusicTI }
      >>
    >>
    \new ChoirStaff = "ChII"
    <<
      \new Staff = "SII"
      <<
        \InstrumentName "Ti. II" ""
        \new Voice = "SII" { \MusicSII }
        \new Lyrics \lyricsto "SII" { \LyricsAII }
      >>
      \new Staff = "ATII"
      <<
        \InstrumentName \TwoLineName "A. II" "T. II" ""
        \new Voice = "AII" { \voiceOne \MusicAII }
        \new Voice = "TII" { \LowerVoice \MusicTII }
        \new Lyrics \lyricsto "AII" { \LyricsAII }
      >>
    >>
    \new ChoirStaff = "Continuo"
    <<
      \ShowChoirStaffBracket
      \new Staff = "BII-Ac"
      <<
        \InstrumentName \TwoLineName "B. II [instr.]" "Ac." ""
        \new Voice = "BII" { \voiceOne \MusicBII }
        \new Voice = "Ac" { \LowerVoice \MusicAc }
      >>
    >>
  >>
}

