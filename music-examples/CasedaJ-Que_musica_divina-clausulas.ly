%% CasedaJ Que musica divina: Ex clausulas

\version "2.19"
\include "villancico.ly"
\include "vcbook-example.ly"

MusicSi = {
  \clef "treble"
  \CantusMollis
  \MeterTriple
  \set Score.currentBarNumber = #40
  \ShowFirstBarNumber
  % m. 40
  | r2 r2 d''2 
  | f''2 \ficta es''!2 d''2 
  | es''1. 
  | d''1.~\color
  | d''2 c''1 
  | bes'2 g''2 g''2~
  | g''2 fis''2 e''2\endcolor 
  | \ficta fis''!1.
  | g''1. 
  | r2 f''2\color f''2~

  % m. 50
  | f''2 e''2 f''2 
  | g''2 d''1
  | r2 g''2 g''2~
  | g''2 fis''2 e''2 
  | fis''2 g''1~
  | g''2 \ficta fis''!1\endcolor
}

MusicSii = {
  \clef "treble"
  \MeterTriple
  \CantusMollis
  % m. 40
  | R1.
  | R1.
  | r2 g''2\color g''2~
  | g''2 fis''2 e''2\endcolor
  | \ficta fis''!1. 
  | g''2 r2 r2 
  | R1. 
  | r2 r2 c''2
  | es''2 d''2 c''2 
  | d''1.

  % m. 50
  | g''1. 
  | r2 f''2\color f''2~
  | f''2 e''2 d''2\endcolor 
  | e''1.
  | d''1.~
  | d''1. 
}

MusicA = {
  \clef "treble"
  \MeterTriple
  \CantusMollis
  % m. 40
  | R1.
  | R1.
  | r2 r2 g'2 
  | bes'2 a'2 g'2
  | a'1. 
  | g'2 r2 r2 
  | R1. 
  | r2 c''2\color c''2~
  | c''2 b'2 a'2\endcolor 
  | \ficta b'!1.

  % m. 50
  | c''1. 
  | d''1.
  | g'1. 
  | r2 r2 g'2
  | bes'2 a'2 g'2 
  | a'2\color a'1\endcolor
}

MusicT = {
  \clef "treble_8"
  \MeterTriple
  \CantusMollis
  % m. 40
  | r2 d'2 d'2~
  | d'2 c'2 bes2 
  | c'1. 
  | d'1.~
  | d'1. 
  | r2 r2 g'2
  | bes'2 a'2 g'2 
  | a'1.
  | g'1.~
  | g'1.

  % m. 50
  | r2 c'2\color c'2~
  | c'2 b2 a2\endcolor
  | \ficta b!1. 
  | c'1. 
  | d'1.~
  | d'1.
}

MusicB = {
  \clef "bass"
  \MeterTriple
  \CantusMollis
  % m. 40
  | d2\color bes,1\endcolor 
  | f1. 
  | es1. 
  | d1.
  | d1. 
  | g1. 
  | bes1. 
  | a1. 
  | g1. 
  | g1. 

  % m. 50
  | c1. 
  | g1. 
  | g1. 
  | c'1. 
  | d'1.~
  | d'1.
}

LyricsSi = \lyricmode {
  y|~en cláu -- su -- las va -- rias, __ va -- rias,
  \EdLyrics { y|~en cláu -- su -- las va -- rias, }
  y|~en cláu -- su -- las va -- rias, 
  y|~en cláu -- su -- las va -- _ rias, 
}
LyricsSii = \lyricmode {
  y|~en cláu -- su -- las va -- rias,
  y|~en cláu -- su -- las va -- rias,
  y|~en cláu -- su -- las va -- rias, __
}
LyricsA = \lyricmode {
  y|~en cláu -- su -- las va -- rias,
  y|~en cláu -- su -- las va -- rias, va -- rias,
  y|~en cláu -- su -- las va -- rias,
}
LyricsT = \lyricmode {
  y|~en cláu -- su -- las va -- rias, __ 
  \EdLyrics { y|~en cláu -- su -- las va -- rias,
  y|~en cláu -- su -- las va -- _ rias, __ }
}

\score {
  <<
    \new ChoirStaff = "Chorus"
    <<
      \new Staff = "Si"
      <<
        \InstrumentName "Ti. 1" ""
        \new Voice = "Si" { \MusicSi }
        \new Lyrics \lyricsto "Si" { \LyricsSi }
      >>
      \new Staff = "Sii"
      <<
        \InstrumentName "Ti. 2" ""
        \new Voice = "Sii" { \MusicSii }
        \new Lyrics \lyricsto "Sii" { \LyricsSii }
      >>
      \new Staff = "A"
      <<
        \InstrumentName "A." ""
        \new Voice = "A" { \MusicA }
        \new Lyrics \lyricsto "A" { \LyricsA }
      >>
      \new Staff = "T"
      <<
        \InstrumentName "T." ""
        \new Voice = "T" { \MusicT }
        \new Lyrics \lyricsto "T" { \LyricsT }
      >>
    >>
    \new ChoirStaff = "Bc"
    <<
      \ShowChoirStaffBracket
      \new Staff = "B"
      <<
        \InstrumentName \TwoLineName "B." "[instr.]" ""
        \new Voice = "B" { \MusicB }
      >>
    >>
  >>
}






