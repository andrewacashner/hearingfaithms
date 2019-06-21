% Ambiela, Suban las voces, E-Bbc: M/733/1
% Ex Mudando el aire

\version "2.19"
\include "villancico.ly"
\include "vcbook-example.ly"

MusicSIi = {
  \clef "treble"
  \MeterDuple
%  \set Score.currentBarNumber = #10
  f''4 e''8 d''8 cis''4 d''4 
  d''4 cis''4 r4 a''8 g''8
  f''8[ e''8] d''8 c''8 c''4 b'4
  e''8 d''8 c''8 b'8 a'4 d''4
  r4 d''8 c''8 b'8 b'8 a'4
  g'2 r4 d''8 c''8
  b'8 b'8 c''8 c''8 f''4 e''4
  e''4 d''4. d''8 c''4~
  c''4 b'4 b'4 c''4
}


MusicSIii = {
  \clef "treble"
  \MeterDuple
  R1*3
  r2 a''8 g''8 f''8 e''8
  d''4 g''4 r2
  g''2 f''4. f''8
  e''4. e''8 d''4 b'4
  c''8 c''8 a'8 a'8 b'4 g'4
  c''8 c''8 d''8 c''8 b'4 a'4
}

MusicTI =  {
  \MeterDuple
  R1*3
  r4 a'8 g'8 f'8 e'8 d'4
  g'4 g8 a8 b8 c'8 d'8 c'8
  b4 c'4 f'8 f'8 d'4
  e'4 a'2 g'4~
  g'8 g'8 f'2 e'4
  e'4( d'4) e'2 
}

MusicSII = {
  \clef "treble"
  \MeterDuple
  R1*4
  g'8 a'8 b'8 c''8 d''8 e''8 f''8 e''8
  d''4 e''4 a''8 a''8 b''8 a''8
  gis''4 a''4 r2
  a''2 g''4. g''8 
  f''4. f''8 e''2
}

MusicAII = {
  \clef "treble"
  \MeterDuple
  R1*3
  r2 r4 d''8 c''8
  b'8 a'8 g'4 d'4 d''4~
  d''4 c''4. c''8 b'4~
  b'4 a'4 b'2
  a'2 r2 
  a'8 a'8 b'8 a'8 gis'4 a'4
}

MusicTII = {
  \MeterDuple
  R1*4
  r4 g'2 f'4~ 
  f'8 f'8 e'2 d'4~
  d'4 c'4 d'4 e'4
  c'8 c'8 d'8 c'8 b4 c'4
  r4 d'2 c'4\HalfTie
}

MusicAc = {
  \clef "bass"
  \MeterDuple
  d4 g4 a4 d4 
  e4 a8[ g8 f8 e8] d4
  d4. e8 fis4 g4
  gis4 a8[ g8 f8 e8] d4
  g4 g4 g4 d4 
  g4 c4 f4 d4
  e4 a4 d'4 e'4
  c'4 d'4 b4 c'4 
  f4 d4 e4 a4 
}

%*******************
% LYRICS
%*******************

LyricsSIi = \lyricmode {
  di -- gan mu -- dan -- do~el ai -- re
  en ve -- lo -- ces cor -- che -- as, 
  vue -- len, vue -- len jun -- tos,
  vue -- len, vue -- len jun -- tos,
  vue -- len, vue -- len, \EdLyrics { vue -- len } jun -- tos
  en sín -- co -- pas __ que~e -- le -- van,
}

LyricsSIii = \lyricmode {
  vue -- len, \EdLyrics { vue -- len } jun -- tos
  en sín -- co -- pas que~e -- le -- van, 
  vue -- len, \EdLyrics { vue -- len } jun -- tos,
  vue -- len, \EdLyrics { vue -- len } jun -- tos
}

LyricsTI = \lyricmode {
  vue -- len, \EdLyrics { vue -- len } jun -- tos
  vue -- len, \EdLyrics { vue -- len, vue -- len  } jun -- tos
  vue -- len jun -- tos 
  en sín -- co -- pas que~e -- le -- van,
}

LyricsSII = \lyricmode {
  vue -- len, \EdLyrics { vue -- len, vue -- len, vue -- len } jun -- tos,
  vue -- len, \EdLyrics { vue -- len } jun -- tos 
  en sín -- co -- pas que~e -- le-
}

LyricsAII = \lyricmode {
  vue -- len, \EdLyrics { vue -- len } jun -- tos 
  en __ sín -- co -- pas que~e -- le -- van, 
  vue -- len, \EdLyrics { vue -- len } jun -- tos
}

LyricsTII = \lyricmode {
  en sín -- co -- pas que e -- le -- van, 
  vue -- len, \EdLyrics { vue -- len } jun -- tos
  en sín-
}


%****************************************
% SCORE
%****************************************
\paper {
  page-count = #1
}

\score {
  <<
    \new ChoirStaff = "ChI"
    <<
      \new Staff = "SIi"
      <<
        \InstrumentName "Ti. I-1" "Ti. I-1"
        \new Voice = "SIi" { \MusicSIi }
        \new Lyrics \lyricsto "SIi" { \LyricsSIi }
      >>
      \new Staff = "SIii-TI"
      <<
        \InstrumentName "" \TwoLineName "Ti. I-2" "T. I"
        \new Voice = "SIii" { \voiceOne \MusicSIii }
        \new Voice = "TI" { \LowerVoice \MusicTI }
        \new Lyrics 
        \with { alignAboveContext = "SIii-TI" }
        \lyricsto "SIii" { \LyricsSIii }
        \new Lyrics \lyricsto "TI" { \LyricsTI }
      >>
    >>
    \new ChoirStaff = "ChII"
    <<
      \new Staff = "SII"
      <<
        \InstrumentName "" "Ti. II"
        \new Voice = "SII" { \MusicSII }
        \new Lyrics \lyricsto "SII" { \LyricsSII }
      >>
      \new Staff = "AII-TII"
      <<
        \InstrumentName "" \TwoLineName "A. II" "T. II"
        \new Voice = "AII" { \voiceOne \MusicAII }
        \new Voice = "TII" { \LowerVoice \MusicTII }
        \new Lyrics 
        \with { alignAboveContext = "AII-TII" }
        \lyricsto "AII" { \LyricsAII }
        \new Lyrics \lyricsto "TII" { \LyricsTII }
      >>
    >>
    \new ChoirStaff 
    <<
      \ShowChoirStaffBracket
      \new Staff = "Ac" 
      <<
        \InstrumentName "Ac." "Ac."
        \new Voice = "Ac" { \MusicAc } 
      >>
    >>
  >>
  \layout {
    indent = 0.5\in
    short-indent = 0.5\in
    \context {
      \Score
      \RemoveAllEmptyStaves
      \omit BarNumber
    }
  }
}

