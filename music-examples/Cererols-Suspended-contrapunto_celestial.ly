% Cererols, Suspended, cielos
% Example: Contrapunto celestial
\version "2.19"
\include "villancico.ly"
\include "vcbook-example.ly"

\paper {
  system-count = #2
}

MusicSIi = {
  \clef "treble"
  \MeterDuple
  \set Score.currentBarNumber = #66
  \ShowFirstBarNumber
  cis''2 r4 d''8 e''8
  f''8 g''8 a''2 gis''4
  a''2 r2
  r2 a''8 g''8 f''8 f''8
  e''4 e''4 e''2
  r2 r4 a''8 g''8
}

MusicSIii = {
  a'2 r2 
  r2 r4 d''8 d''8
  e''4 e''4 f''4. g''8
  a''2 r2
  r2 r4 a'8 b'8 
  c''8 d''8 e''2 e''4
}


MusicAI = {
  \clef "treble"
  e'4 r4 r2
  R1
  r2 r4 d'8 e'8
  f'8 g'8 a'8 a'8 a'8 a'8 a'4~
  a'4 gis'4 a'2
  r4 b'8 b'8 a'4 a'4
}

MusicTI = {
  a4 a'8 g'8 f'8 e'8 d'4~
  d'4 cis'4 d'4 b8 b8
  a1
  R1
  r4 e'8 d'8 c'8 b8 a4~
  a4 gis4 a2
}


MusicSII = {
  \clef "treble"
  R1*3
  r4 a''8 g''8 f''8 e''8 d''8 c''8
  b'4 b'8 b'8 c''2
  R1
}

MusicAII = {
  \override MultiMeasureRest.staff-position = #6
  R1*2
  r2 a'8 g'8 f'8 e'8
  d'4 e'4 f'2
  r2 a8 b8 c'8 d'8
  e'4 e'4 e'2
}

MusicTII = {
  \clef "treble"
  R1
  r4 a'8 g'8 f'8 e'8 d'4~
  d'4 cis'4 d'2
  r4 e'8 e'8 d'4 a4
  e'4 e'4 e'2
  r4 e'8 d'8 cis'8 d'8 e'8 cis'8
}

MusicBII = {
  \override MultiMeasureRest.staff-position = #9
  R1*2
  r4 a8 g8 f8 e8 d4~
  d4 cis4 d2
  e4 e4 a2
  R1
}

MusicAc = {
  \clef "bass"
  a2 d'4 d'4~
  d'4 cis'4 d'4 b4
  a4 a8[ g8 f8 e8] d4~
  d4 cis4 d2
  e2 a2
  a4 e4 a2
}

LyricsSIi = \lyricmode {
  -as, con -- tra -- pun -- to ce -- les -- tial,
  \EdLyrics { con -- tra -- pun -- to  ce -- les -- tial, }
  con -- tra-
}

LyricsSIii = \lyricmode {
  -as, con -- tra -- pun -- to ce -- les -- tial,
  \EdLyrics { con -- tra -- pun -- to ce -- les- }
}

LyricsAI = \lyricmode {
  -as, con -- tra -- pun -- to, con -- tra -- pun -- to ce -- les -- tial,
  con -- tra -- pun -- to
}

LyricsTI = \lyricmode {
  -as, con -- tra -- pun -- to ce -- les -- tial, ce -- les -- tial,
  con -- tra -- pun -- to ce -- les -- tial,
}

LyricsSII = \lyricmode {
  con -- tra -- pun -- to ce -- les -- tial, ce -- les -- tial,
}

LyricsAII = \lyricmode {
  con -- tra -- pun -- to ce -- les -- tial,
  \EdLyrics { con -- tra -- pun -- to ce -- les -- tial, }
}

LyricsTII = \lyricmode {
  con -- tra -- pun -- to ce -- les -- tial, 
  con -- tra -- pun -- to ce -- les -- tial,
  \EdLyrics { con -- tra -- pun -- to ce -- les- }
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


