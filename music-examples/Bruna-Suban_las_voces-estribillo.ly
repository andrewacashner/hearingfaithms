% BRUNA, SUBAN LAS VOCES, E-BBC: M/759/4
% Example starting at change of meter

\version "2.19"
\include "villancico.ly"
\include "vcbook-example.ly"

MusicSi = {	
  \clef "treble"
  \CantusMollis
  \MeterDuple
  \partial 2
  r4 bes'8 c''8
  d''4 es''4 d''8 d''8 f''8 f''8
  f''8[ e''8] d''8 d''8 c''8 c''8 c''8 c''8 
  a'8[ bes'8] c''8 d''8 c''4 c''4
  e''8 e''8 e''8 e''8 d''4 d''4 
  g''8 g''8 g''8 g''8 f''4\sh f''4
  r4 d''2 c''4~
  c''8 c''8 f''4 r4 f''4
  c''4 d''4 r4 d''4~
  d''4 es''4. es''8 d''4 
  r4 f''4 f''2
  f''2 d''4 d''4 
  es''4 es''4 es''2 
  d''2 g''2 
  f''2\sh r2
  r2 r4 bes''4 
  a''4. g''8 a''4 bes''4
  a''2 a''4 g''4
  f''4\sh f''4 r4 g''4
  g''2 f''2\sh 
  R1
  a''4 g''8 f''8 e''4 f''4
}

MusicSii = {
  \clef "treble"
  \CantusMollis
  \MeterDuple
  \partial 2
  r4 d''8 d''8 
  d''4 c''8 bes'8 a'8 a'8 d''8 d''8
  d''8[ e''8] f''8 g''8 f''8 f''8 f''8 f''8
  f''4 f''8 f''8 e''4 e''4
  g''8 g''8 g''8 g''8 g''4 g''4
  d''8 d''8 d''8 d''8 d''4 d''4
  r2 r4 es''4~
  es''4 d''4. d''8 c''4
  r4 f''4 f''4 bes'4
  f''2 f''2 
  bes'4 d''4 c''2 
  d''2 bes'4 bes'4
  bes'4 bes'4 bes'2
  bes'2 e''2\fl d''2 r2
  r2 r4 g''4 
  fis''4. e''8 fis''4 g''4
  d''2 d''4 d''4 
  d''4 d''4 r4 d''4 
  d''4( c''4) d''2
  r2 d''4 c''8 bes'8 
  a'4 bes'4 c''4 c''4
}

% lower voice on same staff as Sii
MusicA = {
  \clef "treble"
  \CantusMollis
  \MeterDuple
  \partial 2
  r4 g'8 g'8 
  g'4 g'4 f'8 f'8 bes'8 bes'8 
  bes'4 bes'8 bes'8 a'8 g'8 a'8 bes'8
  c''8[ bes'8] a'8 a'8 g'4 g'4
  c''8 c''8 c''8 c''8 bes'4 bes'4
  bes'8 bes'8 bes'8 bes'8 a'4 a'4
  R1
  r4 bes'2 a'4~
  a'8 a'8 bes'4 r2
  r4 c''4 c''4 f'4
  r4 bes'4 a'2 
  bes'2 f'4 f'4 
  g'4 g'4 g'2 
  f'2 bes'2 
  a'2 r4 bes'4
  a'4. g'8 a'4 bes'4
  d''4 d''4 r4 d''4
  d''8 a'8 c''2 bes'4
  a'4 a'4 r4 bes'4
  bes'4 a'8[ g'8] a'2
  R1 
  r2 c''4 bes'8 a'8
}

MusicT = {
  \clef "treble_8"
  \CantusMollis
  \MeterDuple
  \partial 2
  r4 g8 a8 
  bes4 c'4 d'8 d'8 bes8 c'8 
  d'8[ c'8] d'8 e'8 f'8 f'8 f8 g8 
  a8[ g8] a8 bes8 c'4 c'4 
  c'8 d'8 e'8 f'8 g'4 g'4
  g8 a8 bes8 c'8 d'4 d'4
  r4 bes2 a4~
  a8 a8 bes4 r4 f'4
  f'4 bes4 r4 bes4~
  bes4 a4. a8 bes4
  r4 bes4 f'2 
  bes2 bes4 bes4
  es'4 es'4 es'2
  bes2 c'2 
  d'2 r4 g'4
  fis'4. e'8 fis'4 g'4
  d'4 d'4 r4 g'4 
  fis'4. e'8 fis'4 g'4 
  d'4 d'4 r4 g4 
  es'2 d'2
  g'4 f'8 e'8 d'4 e'4
  f'4 es'8 d'8 c'4 d'4
}


LyricsSi = \lyricmode {
  Y mu -- dan -- do~el ai -- re 
  en ve -- lo --  ces cor -- che -- as, 
  en ve -- lo --  ces cor -- che -- as, 
  vue -- len, vue -- len jun -- tas, 
  vue -- len, vue -- len jun -- tas
  en sín -- co -- pas que~e -- le -- van, 
  en __ sín -- co -- pas que~e -- le -- van 
  y|~en be -- mo -- les blan -- dos, blan -- dos,
  tri -- na -- dos que sus -- pen -- dan, 
  sus -- pen -- dan, sus -- pen -- dan,
  di -- gan en pa -- so 
}

LyricsSii = \lyricmode {
  _ _ _ _ _ _
  _ _ _ _ _ _ _
  _ _ _ _ _ _  _ _
  _ _ _ _ _ _ 
  _ _ _ _ _ _ 
  en __ sín -- co -- pas que~e -- le -- van, 
  que_e -- le -- van,
  _ _ _
  _ _ _ _ _ _ _ _
  tri -- na -- dos que sus -- pen -- dan, 
  _ _ _ _ _ _ 
  di -- gan en pa -- so to -- das, 
}

LyricsA = \lyricmode {
  Y mu -- dan -- do~el ai -- re 
  en ve -- lo -- ces cor -- che -- as, 
  en ve -- lo --  ces cor -- che -- as,
  vue -- len, vue -- len jun -- tas, 
  vue -- len, vue -- len jun -- tas
  en sín -- co -- pas que~e -- le -- van, que~e -- le -- van 
  y|~en be -- mo -- les blan -- dos, blan -- dos,
  tri -- na -- dos que sus -- pen -- dan, 
  tri -- na -- dos que sus -- pen -- dan, sus -- pen -- _ dan,
  di -- gan en 
}

LyricsT = \lyricmode {
  Y mu -- dan -- do~el ai -- re 
  en ve -- lo --  ces cor -- che -- as, 
  en ve -- lo --  ces cor -- che -- as,
  vue -- len, vue -- len jun -- tas, 
  vue -- len, vue -- len jun -- tas
  en sín -- co -- pas que~e -- le -- van, 
  en sín -- co -- pas que~e -- le -- van, 
  y|~en be -- mo -- les blan -- dos, blan -- dos,
  tri -- na -- dos que sus -- pen -- dan, 
  tri -- na -- dos que sus -- pen -- dan, sus -- pen -- dan,
  di -- gan en pa -- so to -- das, en pa -- so
}

\score {
  <<
    \new ChoirStaff
    <<
      \new Staff = "Si"
      <<
        \InstrumentName "Ti. 1" ""
        \new Voice = "Si" { \MusicSi }
        \new Lyrics \lyricsto "Si" { \LyricsSi }
      >>
      \new Staff = "Sii-A"
      <<
        \InstrumentName \TwoLineName "Ti. 2" "A." ""
        \new Voice = "Sii" { \voiceOne \MusicSii }
        \new Voice = "A" { \LowerVoice \MusicA }
        \new Lyrics \with {
          alignAboveContext = "Sii-A"
        } \lyricsto "Sii" { \LyricsSii }
        \new Lyrics \lyricsto "A" { \LyricsA }
      >>
      \new Staff = "T"
      <<
        \InstrumentName "T." ""
        \new Voice = "T" { \MusicT }
        \new Lyrics \lyricsto "T" { \LyricsT }
      >>
    >>
  >>
}

