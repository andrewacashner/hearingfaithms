%% CasedaJ Que musica divina

\version "2.19"
\include "villancico.ly"
\include "vcbook-example.ly"

MusicSi = {
  \clef "treble"
  \MeterDuple
  \CantusMollis
  | r4 d''4 g''8. a''16 g''4
  | r4 fis''4 bes''2~
  | bes''4 a''4 r4 f''4
  | g''4 f''4 r8 f''8 f''8 f''8
  | f''4( es''4) d''2
  | r4 f''8 f''8 g''2
  | fis''2 r4 fis''4
}
MusicSii = {
  \clef "treble"
  \MeterDuple
  \CantusMollis
  | r2 r4 d''4
  | d''8. c''16 d''4 r4 f''?4
  | f''4 f''4 r4 d''4
  | c''4 c''4 d''4 d''4
  | c''8[ d''8 c''8 bes'8] a'2
  | r4 d''8 d''8 d''4( c''4)
  | d''2 r2
}
MusicA = {
  \clef "treble"
  \MeterDuple
  \CantusMollis
  | r2 r4 bes'4 
  | a'8. g'16 a'4 r4 d''4
  | c''4 c''4 a'4 bes'4~
  | bes'4 a'4 r8 bes'8 bes'8 bes'8
  | a'4( g'4) fis'2
  | a'8 a'8 bes'2 a'8[ g'8]
  | a'2 a'4 d''4\HalfTie
}
MusicT = {
%  \clef "treble_8"
  \MeterDuple
  \CantusMollis
  | r2 r4 g4 
  | d'8. es'16 d'4 r4 bes4
  | f'4 f'4 r4 d'4
  | e'4 f'4 bes4 bes4
  | c'2 d'2
  | r4 d'8 d'8 es'2
  | d'2 r4 d'4 
}
MusicB = {
  \clef "bass"
  \MeterDuple
  \CantusMollis
  | r4 g4 g8. \ficta fis!16 g4
  | d4 d4 bes2
  | f2 f4 bes4
  | c'4 f4 bes4 bes4 
  | c'2 d'2
  | d4 d4 es2
  | d2. d4 
}

LyricsSi = \lyricmode {
  Qué mú -- si -- ca di -- vi -- na,
  a -- cor -- de y so -- be -- ra -- na, so -- be -- ra -- na,
  a-
}
LyricsSii = \lyricmode {
  Qué mú -- si -- ca di -- vi -- na,
  a -- cor -- de~|y so -- be -- ra -- na, so -- be -- ra -- na,
  a-
}
LyricsA = \lyricmode {
  Qué mú -- si -- ca di -- vi -- na, 
  a -- cor -- de y so -- be -- ra -- na, so -- be -- ra -- _ na,
  a -- fren-
}
LyricsT = \lyricmode {
  Qué mú -- si -- ca di -- vi -- na,
  a -- cor -- de~|y so -- be -- ra -- na, so -- be -- ra -- na,
  a-
}

\score {
  <<
    \new ChoirStaff = "Chorus"
    <<
      \new Staff = "Si-ii"
      <<
        \InstrumentName \TwoLineName "Ti. I" "Ti. II" ""
        \new Voice = "Si" { \voiceOne \MusicSi }
        \new Voice = "Sii" { \LowerVoice \MusicSii }
        \new Lyrics \with {
          alignAboveContext = "Si-ii"
        } \lyricsto "Si" { \LyricsSi }
        \new Lyrics \lyricsto "Sii" { \LyricsSii }
      >>
      \new Staff = "AT"
      <<
        \InstrumentName \TwoLineName "A." "T." ""
        \new Voice = "A" { \voiceOne \MusicA }
        \new Voice = "T" { \LowerVoice \MusicT }
        \new Lyrics \with {
          alignAboveContext = "AT"
        } \lyricsto "A" { \LyricsA }
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






