% Cererols, Suspended, cielos
% Example: a los angeles lleva el canto llano
\version "2.19"
\include "villancico.ly"
\include "vcbook-example.ly"

MusicSIi = {
  \clef "treble"
  \override MultiMeasureRest.staff-position = #6
  \MeterDuple
  \ShowFirstBarNumber
  \set Score.currentBarNumber = #89
  r2 a''2~
  a''2 g''2~
  g''2 f''2 
  e''1
  d''2 r2
  R1*3
  r4 a''8 g''8
}

MusicSIii = {
  r4 e''8 e''8 cis''4 cis''8 cis''8
  d''4 d''4 b'4 b'4
  c''2 a'2
  R1*4
  r2 e''2~
  e''2 
}

MusicAI = {
  \clef "treble"
  R1
  r4 a'8 a'8 d''4 d''8 d''8
  g'4 g'4 c''4 c''4
  bes'2 a'2
  R1
  r4 c''8 bes'8 a'4 a'8 a'8
  g'4 g'4 e'4 e'4
  f'8[ g'8] a'2 gis'4
  a'2
}

MusicTI = {
  r2 r4 a8 a8
  d'4 d'8 d'8 g4 g4
  c'2 f2 
  g2 a2
  R1*2
  r4 e'8 d'8 cis'4 cis'8 cis'8
  d'2 e'4 e'8 d'8
  cis'4 cis'8 cis'8
}


MusicSII = {
  \clef "treble"
  c''2 r2
  R1*2
  r2 a''2~
  a''2 g''2~
  g''2 f''2
  e''1
  d''4. c''8 b'2
  a'2 
}

MusicAII = {
  \clef "treble"
  a'2 r2
  R1*2
  r2 r4 e'8 e'8
  a'4 a'8 a'8 d'4 d'4
  g'2 c'4 c''4
  bes'4 bes'4 a'2
  a'2 r2
  r2
}

MusicTII = {
  e'2 r4 a'8 g'8
  fis'4 fis'8 fis'8 g'4 g'4
  e'4 e'4 f'4 c'4
  r4 e'8 d'8 cis'4 cis'8 cis'8
  d'4 d'4 b4 b4
  c'2 c'2
  R1*2
  a'2
}

MusicBII = {
  \clef "bass"
  \override MultiMeasureRest.staff-position = #6
  a2 r2
  R1*2
  r2 r4 a8 g8
  fis4 fis8 fis8 g4 g4
  e4 e4 f2
  g2 a2
  d2 r2
  r4 a8 a8 
}

MusicAc = {
  a1
  d'2 g2
  c'2 f2
  g2 a2
  d2 g2
  c2 f2
  g2 a2
  d'2 e'2
  a2
}

LyricsSIi = \lyricmode {
  el __ can -- to lla -- no,
  a los án -- ge -- les lle -- va~el can -- to lla -- no,
}

LyricsSIii = \lyricmode {
  a los án -- ge -- les lle -- va~el can -- to lla -- no,
  el __ can -- to lla -- no, 
}

LyricsAI = \lyricmode {
  a los án -- ge -- les lle -- va~el can -- to lla -- no,
  \EdLyrics { a los án -- ge -- les lle -- va~el can -- to lla -- _ _ _no, }
}

LyricsTI = \lyricmode {
  a los án -- ge -- les lle -- va~el can -- to lla -- no,
  a los án -- ge -- les lle -- va, 
  \EdLyrics { a los án -- ge -- les lle -- va~el } can -- to lla -- no,
}

LyricsSII = \lyricmode {
  -no el __ can -- to lla -- _ _ _ no,
  a los án-
}

LyricsAII = \lyricmode {
  -no a los án -- ge -- les lle -- va~el can -- to, el can -- to lla -- no,
  el can -- to lla -- _ no,
}

LyricsTII = \lyricmode {
  -no a los án -- ge -- les lle -- va~el can -- to lla -- no,
  \EdLyrics { a los án -- ge -- les lle -- va~el can -- to lla -- no, }
  el can -- to lla-
}


\score {
  <<
    \new ChoirStaff = "ChI"
    <<
      \new Staff = "SIi-SIii"
      <<
        \InstrumentName \TwoLineName "Ti. I-1" "Ti. I-2" ""
        \new Voice = "SIi" { \voiceOne \MusicSIi }
        \new Voice = "SIii" { \LowerVoice \MusicSIii }
        \new Lyrics \with { alignAboveContext = "SIi-SIii" }
        \lyricsto "SIi" { \LyricsSIi }
        \new Lyrics \lyricsto "SIii" { \LyricsSIii }
      >>
      \new Staff = "AI-TI"
      <<
        \InstrumentName \TwoLineName "A. I" "T. I" ""
        \new Voice = "AI" { \voiceOne \MusicAI }
        \new Voice = "TI" { \LowerVoice \MusicTI }
        \new Lyrics \with { alignAboveContext = "AI-TI" }
        \lyricsto "AI" { \LyricsAI }
        \new Lyrics \lyricsto "TI" { \LyricsTI }
      >>
    >>
    \new ChoirStaff = "ChII"
    <<
      \new Staff = "SII"
      <<
        \InstrumentName "Ti. II" ""
        \new Voice = "SII" { \MusicSII }
        \new Lyrics \lyricsto "SII" { \LyricsSII }
      >>
      \new Staff = "AII-TII"
      <<
        \InstrumentName \TwoLineName "A. II" "T. II" ""
        \new Voice = "AII" { \voiceOne \MusicAII }
        \new Voice = "TII" { \voiceTwo \MusicTII }
        \new Lyrics \with { alignAboveContext = "AII-TII" }
        \lyricsto "AII" { \LyricsAII }
        \new Lyrics \lyricsto "TII" { \LyricsTII }
      >>
    >>
    \new ChoirStaff = "Continuo"
    <<
      \ShowChoirStaffBracket
      \new Staff = "BII-Ac"
      <<
        \InstrumentName \TwoLineName "B. II [instr.]" "Ac." ""
        \new Voice = "BII" { \voiceOne \MusicBII }
        \new Voice = "Ac" { \voiceTwo \MusicAc }
      >>
    >>
  >>
}

