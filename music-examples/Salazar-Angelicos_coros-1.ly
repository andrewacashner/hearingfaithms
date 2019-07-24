% SALAZAR: ANGELICOS COROS CON GOZO CANTAD
% Example 1, opening, first 18 compases

\version "2.19"
\include "villancico.ly"
\include "vcbook-example.ly"

%%****************************************
%% MUSIC

%% CHORUS I
MusicSIi = {
  \clef "treble"
  \MeterTriple
  \CantusMollis
  | r2 r2 f'2
  | c''2. c''4 bes'2 
  | a'2. g'4 f'2
  | g'2 g'2 c''2 
  | c''1 c''2
  | c''1.~\color
  | c''2 c''1\endcolor
  | c''2 r2 r2 
  | R1.
  \break
  | R1.*3
  | r2 r2 a'2
  | c''1 bes'2 
  | a'1 a'2
  | c''1 c''2 
  | c''1 a'2
  | g'1 g'2 
}

MusicSIii = {
  \clef "treble"
  \MeterTriple
  \CantusMollis
  | R1.*2
  | r2 r2 f'2
  | c''2. c''4 bes'2 
  | a'2. g'4 f'2
  | g'2. a'4 bes'2 
  | a'1 a'2
  | g'1 c''2 
  | c''2 r2 r2
  | R1.*3
  | r2 r2 c''2
  | c''1 c''2 
  | c''1 a'2
  | g'1 g'2 
  | a'2\color c''1\endcolor
  | bes'1. 
}

MusicAI = {
  \clef "treble"
  \MeterTriple
  \CantusMollis
  | R1.*2
  | r2 r2 f'2
  | e'2. d'4 e'2 
  | f'2. c'4 d'2
  | e'2. f'4 g'2 
  | f'1 f'2
  | g'1 g'2 
  | f'2 r2 r2
  | R1.*3
  | r2 r2 f'2
  | g'1 g'2 
  | f'1 c'2
  | e'1 d'2 
  | c'1 f'2
  | e'1 e'2
}

%% CHORUS II
MusicSII = {
  \CantusMollis
  \clef "treble"
  \MeterTriple
  | R1.*8
  | r2 r2 f'2
  | c''2. c''4 bes'2 
  | a'2. g'4 f'2
  | g'2. a'4 bes'2 
  | a'1 c''2
  | c''1 c''2 
  | c''1.~\color
  | c''2 c''1\endcolor 
  | c''1 c''2
  | c''1. 
}

MusicAII = {
  \CantusMollis
  \clef "treble"
  \MeterTriple
  | R1.*8
  | r2 r2 f'2
  | e'2. d'4 e'2 
  | f'2. c'4 d'2
  | e'2. f'4 g'2 
  | f'1 c'2
  | e'1 d'2 
  | c'1 f'2
  | g'1 g'2
  | f'1 c'2
  | e'1. 
}

MusicTII = {
  \clef "treble_8"
  \MeterTriple
  \CantusMollis
  | R1.*6
  | r2 r2 f2
  | c'2. c'4 bes2 
  | a2. g4 f2
  | g2 g2 c'2 
  | c'1.~\color
  | c'2 c'1\endcolor 
  | c'1 a2
  | g1 g2 
  | a1 c'2
  | c'1 bes2 
  | a1 f2
  | g1. 
}

MusicBII = {
  \clef "bass"
  \MeterTriple
  \CantusMollis
  | R1.*6
  | r2 r2 f2
  | e2. d4 e2 
  | f2. e4 d2
  | c2 c2 c2 
  | f,1 f2
  | c1 c2 
  | f1 f,2
  | c1 c2 
  | f,1 f2
  | e1 e2 
  | f1 f,2
  | c1. 
}

MusicAc = {
  \clef "bass"
  \MeterTriple
  \CantusMollis
  | r2 r2 f2
  | e2. d4 e2 
  | f2. e4 d2
  | c2 c2 c2 
  | f,1 f,2
  | c1 c2 
  | f,1 f2
  | c1 c2 
  | f2. e4 d2
  | c2 c2 c2 
  | f,1 f2
  | c1 c2 
  | f1 f,2
  | c1 c2 
  | f,1 f2
  | e1 e2 
  | f1 f,2
  | c1 c2 
}


%% SALAZAR: ANGELICOS COROS CON GOZO CANTAD
%% lyrics input file: lyrics.ly

%%**************************************
%% LYRICS: ESTRIBILLO
%%**************************************

%% CHORUS I

LyricsSIi = \lyricmode {
  An -- gé -- li -- cos  co -- ros con go -- zo can --  tad,
  can -- tad, __ can -- tad, can -- tad,
  \EdLyrics {  can -- tad, can --  tad, }
  can -- tad, \EdLyrics {  can -- tad }
  la 
}

LyricsSIii = \lyricmode {
  An -- gé -- li -- cos co -- ros con go -- zo can -- tad,
  can -- tad, \EdLyrics {  can -- tad, }
  can -- tad, \EdLyrics {  can -- tad, }
  can -- tad, \EdLyrics {  can -- tad, } can -- tad
}

LyricsAI = \lyricmode {
  An -- gé -- li -- cos co -- ros con go -- zo can -- tad,
  can -- tad, \EdLyrics {  can -- tad, }
  can -- tad, \EdLyrics {  can -- tad, }
  can -- tad, \EdLyrics {  can -- tad, } can -- tad
  la 
}

%% CHORUS II
LyricsSII = \lyricmode {
  An -- gé -- li -- cos co -- ros con go -- zo can -- tad,
  can -- tad, __ \EdLyrics {  can -- tad, __ can -- tad, can -- tad. }
}

LyricsAII = \lyricmode {
  An -- gé -- li -- cos co -- ros con go -- zo can -- tad, can -- tad,
  \EdLyrics {  can -- tad, } can -- tad,
  \EdLyrics {  can -- tad, can -- tad, }
}

LyricsTII = \lyricmode {
  An -- gé -- li -- cos co -- ros con go -- zo can -- tad, __
  can -- tad, can -- tad,
  \EdLyrics {  can -- tad, can -- tad, can -- tad, can -- tad, }
}

% SSA, SATB, Ac
\score {
  <<
    \new ChoirStaff
    <<
      \new Staff = "SIi"
      <<
        \InstrumentName "Ti. I-1" ""
        \new Voice = "SIi" { \MusicSIi }
        \new Lyrics \lyricsto "SIi" { \LyricsSIi }
      >>
      \new Staff = "SIiiAI"
      <<
        \InstrumentName
        \TwoLineName "Ti. I-2" "A. I"
        ""
        \new Voice = "SIii" { \voiceOne \MusicSIii }
        \new Voice = "AI" { \LowerVoice \voiceTwo \MusicAI }
        \new Lyrics \lyricsto "AI" { \LyricsAI }
      >>
    >>
    \new ChoirStaff
    <<
      \new Staff = "SAII"
      <<
        \InstrumentName
        \TwoLineName "Ti. II" "A. II"
        ""
        \new Voice = "SII" { \voiceOne \MusicSII }
        \new Voice = "AII" { \LowerVoice \voiceTwo \MusicAII }
        \new Lyrics \lyricsto "AII" { \LyricsAII }
      >>
      \new Staff = "TBII"
      <<
        \InstrumentName
        \TwoLineName "T. II" "B. II [instr.]"
        ""
        \new Voice = "TII" { \voiceOne \MusicTII }
        \new Lyrics \with {
          alignAboveContext = "TBII" 
        } \lyricsto "TII" { \LyricsTII }

        \new Voice = "BII" { \LowerVoice \voiceTwo \MusicBII }
      >>
    >>
    \new ChoirStaff
    <<
      \ShowChoirStaffBracket
      \new Staff = "Ac"
      <<
        \InstrumentName "Ac." ""
        \new Voice = "Ac" { \MusicAc }
      >>
    >>
  >>
}


