% Padilla-Voces-peregrino_tono.ly
% mm. 127--132

\version "2.19"
\include "villancico.ly"
\include "example.ly"

MusicSI = {
  \clef "treble"
  \CantusMollis
  \MeterTriple
  | bes'2 bes'1 
  | a'2 bes'1
  | c''2 \Annotate "D–(C)–F–E–D final cadence" d''1\NB
  | c''2. c''4 f''2~\color
  | f''2 e''1\endcolor
  | d''2 d''1\endNB
}

MusicAI = {
  \clef "treble"
  \CantusMollis
  \MeterTriple
  | g'2 g'1
  | f'2 f'1
  | \Annotate "G–B♭–A–G–F medial cadence, or G–B♭—A–G final in cantus mollis" 
  g'2\NB bes'1
  | a'2. g'4 f'2~\color
  | f'2\endNB g'1\endcolor
  | a'2 bes'1
}

MusicTI = {
  \clef "treble_8"
  \CantusMollis
  \MeterTriple
  | g2 g1
  | \Annotate "D–(C)–F–E–D final cadence" d'2\NB d'1
  | c'2 bes4( c'4 d'4 e'4)
  | f'2. e'4 d'2~\color
  | d'2\endNB e'1\endcolor
  | fis'2 g'1
}

%**********

Lyrics = \lyricmode {
  \StanzaI
  Da -- ba~un ni -- ño pe -- re -- gri -- no to -- no~al hom -- bre~|y
}

%***********

\score {
  <<
    \new ChoirStaff
    <<
      \new Staff = "SI" 
      <<
        \InstrumentName "Ti. I" ""
        \new Voice = "SI" { \MusicSI }
        \new Lyrics \lyricsto "SI" { \Lyrics }
      >>
      \new Staff = "AI"
      <<
        \InstrumentName "A. I" ""
        \new Voice = "AI" { \MusicAI }
        \new Lyrics \lyricsto "AI" { \Lyrics }
      >>
      \new Staff = "TI"
      <<
        \InstrumentName "T. I" ""
        \new Voice = "TI" { \MusicTI }
        \new Lyrics \lyricsto "TI" { \Lyrics }
      >>
    >>
  >>
}


