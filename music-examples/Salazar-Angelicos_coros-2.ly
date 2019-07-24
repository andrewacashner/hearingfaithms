% Salazar Angelicos coros "Bajad" ex 2
% two mm. before meter change, then 9 mm after

\version "2.19"
\include "villancico.ly"
\include "vcbook-example.ly"

%****************************************
% MUSIC

%% CHORUS I
MusicSIi = {
  \clef "treble"
  \MeterTriple
  \CantusMollis

  | d''2. d''4 c''2
  | c''1 c''2 

  % m. 45
  \MeterChangeDuple
  | R1
  | r4 d''4 c''4. c''8 
  | bes'4. bes'8 a'4 bes'4 
  | g'4. g'8 g'2 
  | R1*4

  | r4 r8 g'8 a'8 a'8 a'8 a'8 
}

MusicSIii = {
  \clef "treble"
  \MeterTriple
  \CantusMollis
  | r2 f'2 a'2
  | c''1 a'2 

  % m. 45
  \MeterChangeDuple
  | r4 f''4 e''4. e''8 
  | d''4 bes'4 c''4 f''4 
  | d''2. bes'4 
  | c''4 g'4 g'2 
  | R1*4

  | r4 r8 c''8 c''8 c''8 c''8 c''8 
}

MusicAI = {
  \clef "treble"
  \MeterTriple
  \CantusMollis
  | f'2. f'4 f'2
  | e'1 f'2

  % m. 45
  \MeterChangeDuple
  | R1
  | r2 r4 a'4 
  | g'4. g'8 f'4. f'8 
  | e'4. e'8 d'2 
  | R1*4

  | r4 r8 e'8 f'8 f'8 f'8 f'8 
}

%% CHORUS II
MusicSII = {
  \CantusMollis
  \clef "treble"
  \MeterTriple
  | bes'2. bes'4 a'2
  | g'1 a'2 

  % m. 45
  \MeterChangeDuple
  | R1*2
  | r2 r4 d''4 
  | c''4. c''8 bes'4. bes'8 
  | a'4 f'4 c''4. c''8 

  % m. 50
  | d''4 a'4 c''4. c''8 
  | bes'4. bes'8 a'4. a'8 
  | g'2. f'4 
  | e'2 r2 
}

MusicAII = {
  \CantusMollis
  \clef "treble"
  \MeterTriple
  | d'2. bes4 c'2
  | c'1 c'2 

  % m. 45
  \MeterChangeDuple
  | R1*4
  | r4 a'4 g'4. g'8 

  % m. 50
  | f'4 d'4 g'2~
  | g'4 g'4 e'4 f'4 
  | d'2 c'2 
  | c'2 r2 
}

MusicTII = {
  \clef "treble_8"
  \MeterTriple
  \CantusMollis
  | f2. f4 f2
  | g1 f2 

  % m. 45
  \MeterChangeDuple
  | R1*5

  % m. 50
  | r4 f'4 e'4. e'8 
  | d'4. d'8 c'4. c'8 
  | bes2. a4 
  | g2 r2 
}

MusicBII = {
  \clef "bass"
  \MeterTriple
  \CantusMollis
  | bes,2. bes,4 f,2
  | c1 f,2 

  % m. 45
  \MeterChangeDuple
  | R1*3
  | r2 r4 g4 
  | f4. f8 e4. e8 

  % m. 50
  | d4. d8 c4. c8 
  | g,4. g,8 a,4 f,4 
  | g,4 g4 e4 f4 
  | c2 r2 
}

MusicAc = {
  \clef "bass"
  \MeterTriple
  \CantusMollis
  | bes,2. bes,4 f,2
  | c1 f,2 

  % m. 45
  \MeterChangeDuple
  | r4 f,4 c4. c8 
  | bes,4. bes,8 a,4 f,4 
  | g,4 g4 d4 bes,4 
  | c4. c8 g,4 g4 
  | f4. f8 e4. e8 

  % m. 50
  | d4. d8 c4. c8 
  | g,4. g,8 a,4 f,4 
  | g,4 g4 e4 f4 
  | c4. c8 f8[ f8 f8 f8] 
}

%%**************************************
%% LYRICS

%% CHORUS I
LyricsSIi = \lyricmode {
  \EdLyrics {  -tre -- llas y lu -- ces, }
  ba -- jad, ba --  jad,
  \EdLyrics {  ba -- jad, } ba -- jad,
  \EdLyrics {  ba -- jad, }
  y|~el cie -- lo de la tie -- rra de glo -- ria lle -- nad,
}

LyricsSIii = \lyricmode {
  lu -- ces, \EdLyrics {  lu -- ces, }
  ba -- jad, ba -- jad,
  \EdLyrics {  ba -- jad, } ba -- jad,
  \EdLyrics {  ba -- jad, } ba -- jad,
}

LyricsAI = \lyricmode {
  \EdLyrics {  -tre -- llas y lu -- ces, }
  ba -- jad, ba -- jad,
  \EdLyrics {  ba -- jad, ba -- jad, }
  y|~el cie -- lo de la  tie -- rra de glo -- ria lle -- nad, 
}

%% CHORUS II
LyricsSII = \lyricmode {
  _ _ _ _ _
  ba -- jad, ba -- jad,
  \EdLyrics {  ba -- jad, ba -- jad, ba -- jad, ba -- jad, ba -- jad, }
  ba -- jad, \EdLyrics {  ba -- jad, ba -- jad, }
  y|~el cie -- lo de la tie -- ra de glo -- ria lle -- nad,
}

LyricsAII = \lyricmode {
  lu -- ces, y lu -- ces.
  ba -- jad, ba -- jad,
  \EdLyrics {  ba -- jad, ba -- jad, ba -- jad, }
  ba -- jad, 
  y|~el cie -- lo de la tie -- rra de glo -- ria lle -- nad,
}

LyricsTII = \lyricmode {
  _ _ _ _ _
  ba -- jad, ba -- jad,
  \EdLyrics {  ba -- jad, ba -- jad, ba -- jad, }
  y|~el cie -- lo de la tie -- rra de glo -- ria lle -- nad,
}

%********************************
% SCORE

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
        \new Lyrics \with {
          alignAboveContext = "SIiiAI"
        } \lyricsto "SIii" { \LyricsSIii }

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
        \new Lyrics \with {
          alignAboveContext = "SAII"
        } \lyricsto "SII" { \LyricsSII }

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


