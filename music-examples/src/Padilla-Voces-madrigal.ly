% Padilla, Voces, estribillo beginning

\version "2.19"
\include "villancico.ly"
\include "example.ly"

MusicSI = {
  \clef "treble"
  \CantusMollis
  \MeterDuple
  % m. 45
%  | R1 
%  | \ShowThisEmptyStaff R1
%  | R1
  \set Score.currentBarNumber = #48
  | r2 r4 d''4 
  | c''8 c''8 c''8 d''8 e''4 f''8 f''8 

  % m. 50
  | f''8 f''8 d''8 d''8 cis''4 d''4 
  | d''4 es''8 d''8 c''4 bes'8 a'8 
  | g'4 a'4 r2 
  | R1 | R1
  | R1 | R1
  | r4 d''8 \ficta cis''!8 d''2 
  | r4 bes'8 bes'8 c''4 d''8 d''8 
  | c''4 a'4 r2 

%  % m. 60
%  \MeterChangeTriple
%  | R1. | R1.
%  | R1. | R1. 
%  | R1. | R1. 
 
}

MusicAI = {
  \clef "treble"
  \CantusMollis
  \MeterDuple
  % m.45
%  | R1 
%  | \ShowThisEmptyStaff R1 
%  | R1
  | r4 a'4 f'8 e'8 f'8 g'8 
  | a'4 a'8 a'8 g'8 g'8 f'8 f'8 

  % m. 50
  | f'8 f'8 f'8 g'8 a'4 f'4 
  | bes'4 c''8 bes'8 a'4 g'8 f'8 
  | e'4 f'4 r2 
  | R1 
  | r8 bes'8 bes'8 a'8 bes'4 r4 
  | r4 g'8 g'8 a'4 bes'4 
  | g'4 a'4 bes'4 g'8 g'8 
  | a'4 f'8 e'8 f'8 bes'8 bes'8 a'8 
  | bes'4 g'8 g'8 f'2  
  | R1 
  
  % m. 60
%  \MeterChangeTriple
%  | R1. | R1. 
%  | R1. | R1. 
%  | R1. | R1. 
 
}

MusicTI = {
  \clef "treble_8"
  \CantusMollis
  \MeterDuple
  % m. 45
%   | R1 
%   | \ShowThisEmptyStaff R1
%   | R1
  | r4 a4 d'8 \ficta cis'!8 d'8 e'8 
  | f'4 c'4 r4 c'4 

  % m. 50
  | d'8 d'8 d'8 d'8 e'4 d'4 
  | g'4 c'8 c'8 f'4 bes8 bes8 
  | c'4 f4 r2 
  | R1 
  | r8 g8 g8 \ficta fis!8 g4 r4 
  | r2 r4 d'8 d'8 
  | e'4 f'4 d'4 e'4 
  | f'4 d'8 a8 d'8 g'8 g'8 \ficta fis'!8 
  | g'2 r2 
  | R1 
  
  % m. 60
%  \MeterChangeTriple
%  | R1. | R1.
%  | R1. | R1.
%  | R1. | R1.
 
}

MusicAII = {
  \clef "treble_8"
  \CantusMollis
  \MeterDuple
  % m. 45
%  | R1 
%  | r4 a'4 f'8 e'8 f'8 g'8 
%  | a'4 f'8 f'8 g'8 a'8 bes'8 g'8 
  | a'4 f'4 r2 
  | r4 f'4 e'8 e'8 a'8 a'8 

  % m. 50
  | a'2 a'2 
  | R1 
  | r2 a'4 f'8 f'8 
  | g'4 f'8 f'8 f'4 bes'8 a'8 
  | bes'4 r4 r8 bes'8 bes'8 a'8 
  | bes'2 r2 
  | R1 | R1 
  | r2 r4 d'8 d'8 
  | e'4 f'8 f'8 g'4 a'4 

  % m. 60
%  \MeterChangeTriple
%  | bes'2 bes'2 bes'2 
%  | bes'2 a'2 g'2 
%  | fis'2 g'2 g'2 
%  | f'2 f'2 f'2 
%  | g'2\color a'1\endcolor 
%  | bes'1. 
 
}

MusicTII = {
  \clef "treble_8"
  \CantusMollis
  \MeterDuple
  % m. 45
%  | r4 d'4 bes8 a8 bes8 c'8 
%  | d'4 c'8 c'8 d'8 c'8 bes8 bes8 
%  | a4 d'8 d'8 bes8 bes8 bes8 bes8 
  | c'4 d'4 r4 bes4 
  | a8 g8 a8 bes8 c'4 a8 a8 

  % m. 50
  | a8 a8 a8 a8 a4 a4 
  | R1 
  | r2 c'4 d'8 d'8 
  | bes4 c'8 c'8 d'4 g'8 \ficta fis'!8 
  | g'4 r4 r8 g'8 g'8 \ficta fis'!8 
  | g'2 r2 
  | R1 | R1 
  | r4 g8 g8 a4 bes8 bes8 
  | c'4 d'8 d'8 c'4 c'4 

  % m. 60
%  \MeterChangeTriple
%  | d'2 d'2 d'2 
%  | d'2 c'2 bes2 
%  | a2 b!2 b2 
%  | c'2 d'2 d'2 
%  | es'2\color c'1\endcolor 
%  | d'1. 
 
}

MusicBI = {
  \clef "bass"
  \CantusMollis
  \MeterDuple
  % m. 45
%  | r4 d4 g8[ \ficta fis!8 g8 a8] 
%  | bes4 f8 f8 bes,8 c8 d8 e8 
%  | f4 d8 d8 g8 g8 g8 g8 
  | f4 d4 r4 bes,4 
  | f8 f8 f8 f8 c4 f8 f8 

  % m. 50
  | d8 d8 d8 d8 a,4 d4 
  | R1 
  | r2 f4 d8 d8 
  | g4 a8 a8 bes4 g8 d8 
  | g4 r4 r2 
  | R1 
  | R1
  | R1 
  | R1
  | r4 d8 d8 e4 f4 
 
  % m. 60
%  \MeterChangeTriple
%  | bes,2 bes,2 bes,2 
%  | bes,2 c2 c2 
%  | d2 g2 g2 
%  | a2 bes2 bes2 
%  | es2\color f1\endcolor 
%  | bes,1. 
 
}

%****************

LyricsSI = \lyricmode {
  y|~a tre -- chos las dis -- tan -- cias 
  en u -- no y|~o -- tro co -- ro,
  gra -- ve, su -- a -- ve~|y so -- no -- ro,
  tres a tres, dos a dos, u -- no~a u -- no,
}

LyricsAI = \lyricmode { 
  y|~a tre -- chos las dis -- tan -- cias 
  en u -- no y|~o -- tro co -- ro, y|~o -- tro co -- ro,
  gra -- ve, su -- a -- ve~|y so -- no -- ro,
  y dos a dos, u -- no~a u -- no~|y dos a dos, dos a dos,
  tres a tres y dos a dos, dos a dos,
}

LyricsTI = \lyricmode { 
  y|~a tre -- chos las dis -- tan -- cias 
  en u -- no y|~o -- tro co -- ro, 
  gra -- ve, su -- a -- ve~|y so -- no -- ro,
  y dos a dos, u -- no~a u -- no~|y dos a dos, 
  tres a tres y dos a dos, 
}

LyricsAII = \lyricmode {
%  y|~a tre -- chos las dis -- tan -- cias 
%  en u -- no y|~o -- tro 
   co -- ro,
  en u -- no y|~o -- tro co -- ro,

  hom -- bres y bru -- tos y Dios, 
  tres a tres y dos a dos, dos a dos, u -- no~a u -- no,
%  y|~a -- guar -- dan tiem -- po~o -- por -- tu -- no,
%  quien an -- tes del tiem -- po fue,
}

LyricsTII = \lyricmode {
%  y|~a tre -- chos las dis -- tan -- cias 
%  en u -- no y|~o -- tro co -- ro, 
%  \EdLyrics { en u -- no y|~o -- tro 
  \EdLyrics { co -- ro, }
  en u -- no y|~o -- tro co -- ro, 
  \EdLyrics { en u -- no y|~o -- tro co -- ro, }
  hom -- bres y bru -- tos y Dios, 
  tres a tres y dos a dos,
  tres a tres, dos a dos, u -- no~a u -- no,
%  y|~a -- guar -- dan tiem -- po~o -- por -- tu -- no,
%  quien an -- tes del tiem -- po fue,
}

%****************
\score {
  <<
    \new ChoirStaff = "ChI"
    <<
      \new Staff = "SAI"
      <<
        \InstrumentName
        \TwoLineName "Ti. I" "A. I"
        ""
        \new Voice = "SI" { \voiceOne \MusicSI }
        \new Voice = "AI" { \DrawColorBracketsUnder \voiceTwo \MusicAI }
        \new Lyrics \with { alignAboveContext = #"SAI" }
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
        \InstrumentName 
        \TwoLineName "A. II" "T. II"
        ""
        \new Voice = "AII" { \voiceOne \MusicAII }
        \new Voice = "TII" { \DrawColorBracketsUnder \voiceTwo \MusicTII }
        \new Lyrics \with { alignAboveContext = #"ATII" }
            \lyricsto "AII" { \LyricsAII }
        \new Lyrics \lyricsto "TII" { \LyricsTII }
      >>
      \new Staff = "BI" 
      <<
        \InstrumentName 
        \TwoLineName "B. I" "[instr.]"
        ""
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
    #'((basic-distance . 15)
       (minimum-distance . 12))
}




