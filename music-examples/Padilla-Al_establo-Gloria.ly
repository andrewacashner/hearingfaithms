% Gutierrez de Padilla Al establo negrilla gloria
\version "2.19"
\include "villancico.ly"
\include "vcbook-example.ly"

% Put C meter Gloria against CZ Gloria see m. 215
PolyMeterDupleVsTriple = 
#(define-scheme-function
   (music) (ly:music?)
   #{
   \override Staff.TimeSignature.stencil = #Cmeter
   \set Staff.timeSignatureFraction = 4/4
   \scaleDurations 3/2 { $music }
   #})

MusicSI = {
  \clef "treble"
  \MeterTriple
  \set Score.currentBarNumber = #215
  \ShowFirstBarNumber
  e''2\color e''1\endcolor 
  a'2. b'4 \[ c''2~\color
  c''2 b'1\endcolor \] 
  a'2 c''2 c''2 
  c''2\color b'1\endcolor 
  c''2 c''2. b'4
  a'2(\color b'1)\endcolor 
  a'1.
  b'1.\fermata
}

MusicAI = {
  c'1 c'2 
  f'2\color a'1\endcolor
  g'1. 
  f'2 f'2. e'4
  d'2 d'1 
  c'2 c'2 c'2 
  f'2\color g'1\endcolor 
  d'1.
  g'1.\fermata
}

MusicSII = {
  \clef "treble"
  \PolyMeterDupleVsTriple {
    c''1
    c''1
    d''1 
    f''2 f''2
    f''1 
    e''2 e''4 e''4
    d''1 
    d''1
    d''1\fermata
  }
}

MusicAII = {
  \PolyMeterDupleVsTriple {
    c'2 c'2 
    f'2 a'2
    g'1
    f'2. e'4
    d'1 
    c'2 c'4 c'4
    f'2 g'2  
    d'1
    g'1\fermata
  } 
}

LyricsSI = \lyricmode {
  Glo -- ria~en las al -- tu -- _ ras, 
  y|~en la tie -- rra paz, 
  \EdLyrics { y~en la tie -- rra paz. }
}

LyricsAI = \lyricmode {
  Glo -- ria~en las al -- tu -- ras, 
  y|~en la tie -- rra paz,
  y|~en la tie -- _ rra paz.
}

LyricsSII = \lyricmode { 
  Glo  -- ria en las al -- tu -- ras, 
  y|~en la tie -- rra paz.
}

LyricsAII = \lyricmode {
  Glo -- ria~en las al -- tu -- _ _ _ ras,
  y|~en la tie -- _ rra paz.
}

\score { 
  <<
    \new ChoirStaff
    <<
      \ShowChoirStaffBracket
      \new Staff = "SAII"
      <<
        \InstrumentName
        \TwoLineName "Ti. II" "A. II"
        ""
        \new Voice = "SII" { \voiceOne \MusicSII }
        \new Voice = "AII" { \voiceTwo \MusicAII }
        \new Lyrics \with { alignAboveContext = "SAII" }
        \lyricsto "SII" { \LyricsSII }
        \new Lyrics \lyricsto "AII" { \LyricsAII }
      >>
    >>
    \new ChoirStaff
    <<
      \ShowChoirStaffBracket
      \new Staff = "SAI"
      <<
        \InstrumentName
        \TwoLineName "Ti. I" "A. I"
        ""
        \new Voice = "SI" { \voiceOne \MusicSI }
        \new Voice = "AI" { \voiceTwo \DrawColorBracketsUnder \MusicAI }
        \new Lyrics \with { alignAboveContext = "SAI" }
        \lyricsto "SI" { \LyricsSI }
        \new Lyrics \lyricsto "AI" { \LyricsAI }
      >>
    >>
  >>
  \layout { 
    \context { 
      \Staff
      \override VerticalAxisGroup.staff-staff-spacing.basic-distance = #24
    }
  }
}


