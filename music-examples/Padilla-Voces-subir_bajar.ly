% Padilla-Voces-subir_bajar.ly
% Mm. 106-126

\version "2.19"

\include "villancico.ly"
\include "vcbook-example.ly"

MusicSI = {
  \clef "treble"
  \CantusMollis
  \MeterTriple
  \set Score.currentBarNumber = #106
  | bes'2\color d''2 d''2~
  | d''2 a'1\endcolor
  | bes'2 bes'2. c''4 
  | d''1. 

  % m. 110
  | R1. 
  | R1.
  | r2 g''2\color g''2~
  | g''2 d''1 
  \break
  | e''1 f''2~
  | f''2 e''1\endcolor
  | f''1.~
  | f''1.~
  | f''1.~
  | f''1.

  % m. 120
  | R1. | R1.
  | r2 d''2\color d''2~
  | d''2 c''1 
  | d''2 d''1\endcolor 
  | d''1. 

  % m. 126
  | d''1.\fermata 
  \FinalBar
}

MusicAI = {
  \clef "treble"
  \CantusMollis
  \MeterTriple
  | g'2\color bes'1\endcolor 
  | a'1. 
  | g'1. 
  | R1. 
  
  % m. 110 
  | R1. | R1. 
  | g'2 g'2. a'4 
  | b'!2 b'2 b'2 
  | c''1 a'2 
  | g'2\color g'1\endcolor
  | f'1.~
  | f'1.
  | r2 bes'2\color bes'2~
  | bes'2 a'1 

  % m. 120
  | g'1 f'2~
  | f'2 es'1\endcolor 
  | d'1. 
  | R1. 
  | a'1 g'2 
  | a'2 a'2 a'2 

  % m. 126
  | b'!1.\fermata 
}

MusicTI = {
  \clef "treble_8"
  \CantusMollis
  \MeterTriple
  | g1. 
  | R1. 
  | r2 d'2\color d'2~
  | d'2 d'1 

  % m. 110
  | bes1 bes2~
  | bes2 g1\endcolor
  | g1. 
  | g'1. 
  | e'1\color c'2~
  | c'2 c'1\endcolor
  | r2 f'2\color f'2~
  | f'2 c'1 
  | d'1 d'2~
  | d'2 c'1 

  % m. 120
  | bes1 a2~
  | a2 g1 
  | f2 bes2 bes2~
  | bes2 g1\endcolor
  | a1 bes2 
  | a1. 

  % m. 126
  | g1.\fermata
}

MusicAII = {
  \clef "treble_8"
  \CantusMollis
  \MeterTriple
  | d'2 d'2. e'4 
  | fis'2 fis'2 fis'2 
  | g'2\color bes'2 bes'2~
  | bes'2 a'1 

  % m. 110
  | g'1 f'2~
  | f'2 es'1\endcolor
  | d'1. 
  | g'1. 
  | g'2\color c''2 c''2~
  | c''2 g'1 
  | a'1 bes'2~
  | bes'2 a'1\endcolor
  | bes'1. 
  | f'1. 

  % m. 120
  | d'1. 
  | r2 g'1\colorOne
  | bes'2 bes'2. a'4 
  | g'1 g'2 
  | \ficta fis'!1\color g'2~
  | g'2 \ficta fis'!1\endcolor

  % m. 126
  | g'1.\fermata  
}

MusicTII = {
  \clef "treble_8"
  \CantusMollis
  \MeterTriple
  | bes2 bes2. c'4 
  | d'2 d'2 d'2 
  | d'2\color g'2 g'2~
  | g'2 f'1 

  % m. 110
  | es'1 d'2~
  | d'2 c'1 
  | b!1 d'2~
  | d'2 d'1\endcolor 
  | c'1. 
  | r2 c'2. bes4 
  | a2\color d'1\endcolor 
  | c'1. 
  | bes1. 
  | R1. 

  % m. 120
  | R1. 
  | r2 bes2\color bes2~ 
  | bes2 f1\endcolor 
  | g1. 
  | r2 d'1\colorOneUnder
  | d'1. 

  % m. 126
  | d'1.\fermata 
}

MusicBI = {
  \clef "bass"
  \CantusMollis
  \MeterTriple
  | g2 g2 g2 
  | d2 d2 d2 
  | g2\color g2 g2~
  | g2 d1 

  % m. 110
  | es1 bes,2~
  | bes,2 c1 
  | g,2 g1\endcolor 
  | g1. 
  | c1.~
  | c1.
  | f1.~
  | f1.
  | bes,2\color bes2 bes2~
  | bes2 f1 

  % m. 120
  | g1 d2~
  | d2 es1\endcolor 
  | bes,1. 
  | \ficta es!1. 
  | d1.~
  | d1.

  % m. 126
  | g,1.\fermata 

}

%************************

LyricsSI = \lyricmode {
  jar,
  y to -- do~en Dios es ba -- jar,
  y to -- do~en Dios es __ ba -- jar, __
  y to -- do~en Dios es ba -- jar.
}

LyricsAI = \lyricmode {
  jar, es ba -- jar,
  to -- do~en el hom -- bre~es su -- bir,   
  y to -- do~en Dios, __ 
  y to -- do~en Dios es __ ba -- jar,
  to -- do~en Dios es ba -- jar.
}

LyricsTI = \lyricmode {
  y to -- do~en Dios es __ ba -- jar, 
  to -- do~es ba -- jar, 
  y to -- do~en Dios es __ ba -- jar, es __ ba -- jar,
  y to -- do~en Dios es ba -- jar.
}

LyricsAII = \lyricmode {
  to -- do~en el hom -- bre~es su -- bir,
  y to -- do~en Dios es __ ba -- jar, ba -- jar,
  y to -- do~en Dios es __ ba -- jar, ba -- jar, ba -- jar,
  to -- do~en Dios es ba -- jar, __ ba -- jar.
}

LyricsTII = \lyricmode {
  to -- do~en el hom -- bre~es su -- bir, 
  y to -- do~en Dios es __ ba -- jar, es __ ba -- jar,
  to -- do~en Dios es ba -- jar,
  y to -- do~en Dios es ba -- jar.
}

%************************

\score {
  <<
    \new ChoirStaff = "ChI"
    <<
      \new Staff = "SAI"
      <<
        \InstrumentName \TwoLineName "Ti. I" "A. I" ""
        \new Voice = "SI" { \voiceOne \MusicSI }
        \new Voice = "AI" { \voiceTwo \DrawColorBracketsUnder \MusicAI }
        \new Lyrics \with { alignAboveContext = "SAI" }
            \lyricsto "SI" { \LyricsSI }
        \new Lyrics \lyricsto "AI" { \LyricsAI }
      >>
      \new Staff = "TI"
      <<
        \InstrumentName "T. I" ""
        \new Voice = "TI" { \MusicTI }
        \new Lyrics \lyricsto "TI" { \LyricsTI }
      >>
    >>
    \new ChoirStaff = "ChII"
    <<
      \new Staff = "ATII"
      <<
        \InstrumentName \TwoLineName "A. II" "T. II" ""
        \ShowChoirStaffBracket
        \new Voice = "AII" { \voiceOne \MusicAII }
        \new Voice = "TII" { \voiceTwo \DrawColorBracketsUnder \MusicTII }
        \new Lyrics \with { alignAboveContext = "ATII" }
            \lyricsto "AII" { \LyricsAII }
        \new Lyrics \lyricsto "TII" { \LyricsTII }
      >>
    >>
    \new ChoirStaff = "Ac"
    <<
      \new Staff = "BI"
      <<
        \InstrumentName \TwoLineName "B. I" "[instr.]" ""
        \ShowChoirStaffBracket
        \new Voice = "BI" { \MusicBI }
      >>
    >>
  >>
  \layout { 
    \ShowFirstBarNumber
    \context {
      \ChoirStaff
      \override StaffGrouper.staffgroup-staff-spacing = 
        #'((basic-distance . 15)
           (minimum-distance . 14))

    }
  }
}

\paper { 
  page-count = 1
  system-system-spacing =
    #'((basic-distance . 20)
       (minimum-distance . 16))
}


