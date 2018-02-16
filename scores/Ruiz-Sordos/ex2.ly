% RUIZ, SORDOS, EXAMPLE 2
% CONCLUSION OF ESTRIBILLO MM 76--83
% example 2 for theology chapter
% revised 2017-01-19

\version "2.19"
\include "villancico.ly"
\include "example.ly"

MoveBarRestUp = \once \override MultiMeasureRest.staff-position = #7

%*******************
% MUSIC
%*******************

MusicSIi = {
  \MeterTriple	
  R1. 
  | R1.
  | r2 e''2 g''2~\color
  | g''2 fis''1\endcolor
  | g''1. 
  | g''2 g''2 g''2
  | g''2 g''2 g''2 
  | a''1\color g''2~
  | g''2 g''1\endcolor 
  | g''1.
  | g''2 g''2 g''2 
  | g''2 g''2 g''2
  | a''1\color g''2~
  | g''2 g''1\endcolor
  | g''1.~
  | g''1.
  \FinalBar
}

MusicSIii = {
  | r2 a'2 c''2~\color
  | c''2 b'1\endcolor
  | c''2 g'2 d''2~\color
  | d''2\endcolor d''2( c''2)
  | b'1. 
  | d''2 c''2 b'2 
  | c''2\color c''1 
  | c''1 c''2~
  | c''2 b'2 b'2\endcolor 
  | c''1.
  | d''2 c''2 b'2 
  | c''2 c''2 c''2 
  | c''1\color c''2~
  | c''2 b'1\endcolor
  | c''1.~
  | c''1.
}

MusicAI = {
  
  | \MoveBarRestUp R1. 
  | \MoveBarRestUp R1. 
  | r2 c''2 b'2~\color
  | b'2 a'1\endcolor
  | g'1.  
  | g'2 g'2 g'2
  | g'2 g'2 e'2 
  | f'1\color g'2~
  | g'2 g'1\endcolor 
  | e'1.
  | g'2 g'2 g'2 
  | g'2 g'2 e'2
  | f'1\color g'2~
  | g'2 g'1\endcolor
  | e'1.~
  | e'1.
}

MusicBI = {
  | r2 f'2 e'2~\color
  | e'2 d'1\endcolor
  | c'2 c'2 g2~\color 
  | g2 d1\endcolor
  | g1. 
  | g2 g2 g2 
  | c'2 c'2 c'2 
  | f1\color c'2~
  | c'2 g1\endcolor 
  | c'1.
  | g2 g2 g2 
  | c'2 c'2 c'2
  | f1\color c'2~
  | c'2 g1\endcolor
  | c'1.~
  | c'1.
}

%***

MusicSII = {
  | c''2 r2 r2 
  | R1.
  | R1. | R1.
  | R1. 
  | d''2 d''2 d''2 
  | e''2 e''2 g''2 
  | f''1\color e''2~
  | e''2 d''1\endcolor 
  | e''2 r2 r2
  | d''2 d''2 d''2 
  | e''2 e''2 g''2 
  | f''1\color e''2~
  | e''2 d''1\endcolor
  | e''1.~
  | e''1.
}

MusicAII = {
  | a'2 r2 r2 
  | R1. | R1.
  | R1. | R1.
  | d'2 e'2 f'2 
  | e'2 e'2 e'2 
  | c'1 e'2
  | c'2( d'1) 
  | c'2 r2 r2
  | d'2 e'2 f'2 
  | e'2 e'2 e'2
  | c'1 e'2( 
  | c'2)\color d'1\endcolor
  | c'1.~
  | c'1.
}

MusicTII = {
  | f'2 r2 r2 
  | r1. 
  | R1. | R1. 
  | R1. 
  | b2 c'2 d'2 
  | c'2 c'2 b2 
  | a1 c'2 
  | g2(\color b1)\endcolor 
  | g1.
  | b2 c'2 d'2 
  | c'2 c'2 b2 
  | a1 c'2( 
  | g2)\color b1\endcolor
  | g1.~
  | g1.
}

MusicBII = {
  | f2 r2 r2 
  | R1. | R1.
  | R1. | R1.
  | g2 g2 g2
  | c2 c2 c2 
  | f1\color c2~
  | c2 g1\endcolor 
  | c1.  
  | g2 g2 g2 
  | c2 c2 c2 
  | f1\color c2~
  | c2 g1\endcolor
  | c1.~
  | c1.
}

%***

MusicAc = {
  | f2\color f'2 e'2~
  | e'2 d'1
  | c'2 c'2 g2~
  | g2 d1\endcolor
  | g1. 
  | g1. 
  | c1. 
  | f1\color c2~
  | c2 g1\endcolor 
  | c1. 
  | g1. 
  | c1.
  | f1\color c2~
  | c2 g1\endcolor
  | c1.~
  | c1.
}


%*******************
% LYRICS
%*******************

LyricsSIii = \lyricmode {
  que sor -- dos son, que \EdLyrics{ sor -- dos son }
  los que no~es -- cu -- chan ni~en -- tien -- den el son,
  los que \EdLyrics{ no~es -- cu -- chan ni~en -- tien -- den el son. __ }
}

LyricsBI = \lyricmode {
  que sor -- dos son, que \EdLyrics{ sor -- dos son }
  los que no~es -- cu -- chan ni~en -- tien -- den el son,
  los que \EdLyrics{ no~es -- cu -- chan ni~en -- tien -- den el son. __ }
}

LyricsAII = \lyricmode {
  son,
  los que no~es -- cu -- chan ni~en -- tien -- den el son,
  los que \EdLyrics{ no~es -- cu -- chan ni~en -- tien -- den el son. __ }

}

%*******************
% SCORE
%*******************
\paper {
  page-count = #1
}

\score {
  <<
    \new ChoirStaff = "ChI" 
    <<
      \new Staff = "SIi-ii"
      <<
        \InstrumentName 
        \TwoLineName "Ti. I-1" "Ti. I-2" 
        ""
        \new Voice = "SIi" { \voiceOne \clef "treble" \MusicSIi }
        \new Voice = "SIii" { \DrawColorBracketsUnder \voiceTwo \MusicSIii }
        \new Lyrics \lyricsto "SIii" { \LyricsSIii }
      >>
      \new Staff = "ABI"
      <<
        \InstrumentName 
        \TwoLineName "A. I" "B. I" 
        ""
        \new Voice = "AI" { \voiceOne \clef "treble_8" \MusicAI }
        \new Voice = "BI" { \DrawColorBracketsUnder \voiceTwo \MusicBI }
        \new Lyrics \lyricsto "BI" { \LyricsBI }
      >>
    >>
    \new ChoirStaff = "ChII"
    <<
      \new Staff = "SAII"
      <<
        \InstrumentName 
        \TwoLineName "Ti. II" "A. II" 
        ""
        \new Voice = "SII" { \voiceOne \clef "treble" \MusicSII }
        \new Voice = "AII" { \DrawColorBracketsUnder \voiceTwo \MusicAII }
        \new Lyrics \lyricsto "AII" { \LyricsAII }
      >>
      \new Staff = "TBII"
      <<
        \InstrumentName 
        \TwoLineName "T. II" "B. II" 
        ""
        \new Voice = "TII" { \voiceOne \clef "bass" \MusicTII }
        \new Voice = "BII" { \DrawColorBracketsUnder \voiceTwo \MusicBII }
      >>
    >>
    \new Staff = "Ac"
    <<
      \InstrumentName "Ac." ""
      \new Voice = "Ac" { \clef "bass" \MusicAc }
    >>
  >>
  \layout { 
    \context { 
      \Score
      \omit BarNumber
    }
  }

}


