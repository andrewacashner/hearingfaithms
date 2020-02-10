% Suspended Ecuador version 2 excerpts

\version "2.19"
\include "villancico.ly"
\include "vcbook-example.ly"

% EXAMPLE 1
MusicS = {
  \MeterDuple
  \clef "treble"
  r4 cis''4 r4 d''4
  e''2 r4 d''4~
  d''4 d''4 e''2
  d''2 r2
  R1
  r2 r4 d''4
  d''2 r4 e''8 d''8
  c''2 r2
}

MusicA = {
  r4 a'4 r4 a'4
  a'2 r4 b'4~
  b'4 a'4 a'2
  a'2 r2
  R1
  r2 r4 a'4
  b'2 r4 c''8 \ficta bes'8 
  a'2 r2
}

MusicT = {
  r4 e'4 r4 f'4
  e'2 r4 g'4~
  g'4 f'4 e'2
  fis'2 r2
  R1
  r2 r4 fis'4
  g'2 r4 g'8 g'8
  f'2 r2
}

MusicB = {
  \clef "bass"
  r4 a4 r4 d4
  a2 r4 g4~
  g4 d4 a2
  d2 r2
  R1
  r2 r4 d'4
  g2 r4 c'8 c'8
  f2 r2
}

LyricsS = \lyricmode {
  Sus -- pen -- ded vues -- tro can -- to,
  pa -- rad, es -- cu -- chad,
}

LyricsT = \LyricsS

\score {
  <<
    \new ChoirStaff
    <<
      \ChoirStaffName "Chorus III"
      \new Staff
      <<
        \InstrumentName "Ti." ""
        \new Voice = "S" { \MusicS }
        \new Lyrics \lyricsto "S" { \LyricsS }
      >>
      \new Staff
      <<
        \InstrumentName \TwoLineName "A." "T." ""
        \new Voice = "A" { \voiceOne \MusicA }
        \new Voice = "T" { \voiceTwo \MusicT }
        \new Lyrics \lyricsto "T" { \LyricsT }
      >>
      \new Staff
      <<
        \InstrumentName \TwoLineName "B." "[instr.]" ""
        \new Voice = "B" { \MusicB }
      >>
    >>
  >>
}
