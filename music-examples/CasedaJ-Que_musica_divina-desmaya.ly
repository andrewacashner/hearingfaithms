%% CasedaJ Que musica divina: Ex desmaya

\version "2.19"
\include "villancico.ly"
\include "vcbook-example.ly"

MusicSi = {
  \clef "treble"
  \CantusMollis
  \MeterTriple
  \set Score.currentBarNumber = #56
  \ShowFirstBarNumber
  | fis''1.
  | g''2 g''2 g''2 
  | r2 f''2 f''2
  | r2 es''1\colorOne 
  | r2 d''1\colorOne
  | R1.
  | R1.

  % m. 70
  | R1. 
  | r2 r2 a''2
  | f''2 f''2 f''2 
  | fis''1.
  | g''1. 
  | r2 c''2 c''2
  | r2 bes'2 bes'2 
  | r2 a'1\colorOne
  | r2 d''2 d''2 
  | r2 c''1\colorOne

  % m. 80
  | r2 bes'1\colorOne\fermata
  \Fine
  \FinalBar
}

MusicSii = {
  \clef "treble"
  \MeterTriple
  \CantusMollis
  | R1.
  | R1. 
  | r2 d''2 d''2
  | r2 c''2 c''2 
  | r2 bes'1\colorOne
  | r2 a'2. a'4 
  | \ficta b'!2\CN \ficta b'!2 \ficta b'!2

  % m. 70
  | \ficta b'!1. 
  | c''1.
  | R1. 
  | r2 c''2 c''2
  | r2 bes'2 bes'2 
  | r2 a'1\colorOne
  | r2 d''1\colorOne 
  | r2 c''2 c''2
  | r2 bes'2 bes'2 
  | r2 a'1\colorOne

  % m. 80
  | r2 g'1\colorOne\fermata
  \FinalBar
}

MusicA = {
  \clef "treble"
  \MeterTriple
  \CantusMollis
  | r2 a'1\colorOne
  | r2 g'1\colorOne 
  | R1.
  | r2 r2 a'2 
  | f'2 f'2 f'2
  | fis'1. 
  | g'2 g'2 g'2

  % m. 70
  | r2 f'2 f'2 
  | r2 es'1\colorOne
  | r2 d'1\colorOne 
  | r2 r2 a'2
  | bes'2 g'2 a'2 
  | fis'2\color d'1\endcolor
  | R1. 
  | r2 \ficta fis'!2 \ficta fis'!2 
  | r2 g'2 g'2 
  | r2 d'1\colorOne 

  % m. 80
  | r2 d'1\colorOne\fermata
}

MusicT = {
  \clef "treble_8"
  \MeterTriple
  \CantusMollis
  | r2 r2 d'2 
  | bes2 bes2 bes2 
  | b1.
  | c'1 r2 
  | r2 d'2 d'2
  | r2 c'2 c'2 
  | r2 b1\colorOne

  % m. 70
  | r2 g1\colorOne 
  | r2 c'2 c'2
  | r2 bes2 bes2 
  | r2 a1\colorOne
  | r2 g1\colorOne 
  | r2 fis'2 fis'2
  | r2 g'2 g'2 
  | r2 d'1\colorOne
  | r2 g2 g2 
  | r2 \ficta fis!1\colorOne

  % m. 80
  | r2 g1\colorOne\fermata
}

MusicB = {
  \clef "bass"
  \MeterTriple
  \CantusMollis
  | d'1.
  | g1. 
  | g1. 
  | c'1. 
  | d'1. 
  | d1. 
  | g1. 

  % m. 70
  | g1.
  | c'1.
  | bes1. 
  | a1. 
  | g1. 
  | d2\color d1\endcolor
  | g1. 
  | d1. 
  | g2 g2 g2 
  | r2 d1\colorOne

  % m. 80
  | r2 g1\colorOne\fermata
}

LyricsSi = \lyricmode {
  -le -- va,
  po -- ten -- cias des -- ma -- ya,
  sen -- ti -- dos e -- le -- va,
  po -- ten -- cias des -- ma -- ya, des -- ma -- ya.
}
LyricsSii = \lyricmode {
  po -- ten -- cias des -- ma -- ya,
  po -- ten -- cias des -- ma -- ya,
  po -- ten -- cias des -- ma -- ya,
  po -- ten -- cias des -- ma -- ya.
}
LyricsA = \lyricmode {
  -ma -- ya,
  sen -- ti -- dos e -- le -- va,
  po -- ten -- cias des -- ma -- ya,
  sen -- ti -- dos e -- le -- va,
  po -- ten -- cias des -- ma -- ya.
}
LyricsT = \lyricmode {
  sen -- ti -- dos e -- le -- va,
  po -- ten -- cias des -- ma -- ya,
  po -- ten -- cias des -- ma -- ya, 
  po -- ten -- cias des -- ma -- ya, des -- ma -- ya.
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




