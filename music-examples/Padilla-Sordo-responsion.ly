% OYEME, TORIBIO (EL SORDO)
% JUAN GUTIERREZ DE PADILLA (MEX-Pc: Leg. 1/2)
% EDITED BY ANDREW CASHNER

% EXAMPLE 2 2 
% Responsión

\version "2.19"
\include "villancico.ly"
\include "vcbook-example.ly"

%****************************************
% MUSIC
%****************************************

MusicEstribilloSI = \relative c'' {
\clef "treble"
\MeterTriple
\CantusMollis
| r2 c2.\color c4 
| d2 c2.\endcolor c4 
| c1. 
| c2 d2. d4 
| e2 e2. e4 
| f2 d2. d4 
| e2\color c1\endcolor 
| r2 d2 d 
| r2 f1\color 
| r2 e1 
| r2 f1\endcolor 
| r2 f f 
| r2 d1\color 
| r2 e1 
| r2 c1 
| r2 d1 
| r2 cis1 
| r2 d1\endcolor 
| r2 d2 d2~
| d4 d4 d1\colorOne 
| d2 e2 e2~
| e4 e4 d1\color 
| e2 c1\endcolor 
| c1. 
| c2 a2. a4 
| d2 e2. e4 
| f2 e2. d4 
| c2\color e2 e2~
| e2 d1\endcolor 
| r1. 
| r2 f2\color f2~
| f2 e1\endcolor 
| g1. 
| e2\color g2 g2~
| g2 d1\endcolor 
| f1. 
| c1. 
| es1. 
| bes2\color d1\endcolor 
| g,2 a( bes) 
| c2 c4( bes a g) 
| a1.\fermata 
\FinalBar	
}


MusicEstribilloAI = \relative c'' {
\clef "treble"
\CantusMollis
\MeterTriple
| r2 a2. a4 
| bes2 g2. g4 
| a2 g2. g4 
| a2 f2. d4 
| g1 g2 
| r2 bes2. bes4 
| g2 a2. a4 
| f2 bes2. bes4 
| bes2\color a1\endcolor 
| g1. 
| a1.~
| a1.
| r2 g2 g2
| r2 c1\color 
| r2 a1 
| r2 f1 
| r2 a2 a2~
| a2 a1\endcolor 
| r2 bes2 bes2~
| bes4 bes4 a1\colorOneUnder 
| bes2 c2 c2~
| c4 c4 b1 
| c2 a2 a2~
| a4 a4 g1\colorOneUnder 
| a2 c2. c4 
| bes2 a2. a4 
| a2 c2. bes4 
| a2 c2 c2~ 
| c2 a2 a2 
| bes2\color a1\endcolor 
| f1 f2 
| r2 c'2\color c2~ 
| c2 g1~
| g2 bes1\endcolor 
| bes1. 
| r2 a2\color a2~ 
| a2 g1 
| r2 g2 g2~ 
| g2 f1 
| e2( f1~ 
| f2 e1)\endcolor 
| f1.\fermata 
}

MusicEstribilloBII = \relative c {
\clef "bass"
\CantusMollis
\MeterTriple
% m. 37 RESPONSION A 5, METER 6/2
| R1.
| R1.
| r2 c'2.\colorOne c4 
| a2 bes2. bes4 
| c1. a2 d2. d4 
| c2 a2. a4 
| bes1. 
| g2 a2 a2 
| c2\color bes1\endcolor 
| f2 a2 a2 
| r2 a1\color 
| r2 b1 
| r2 c1\endcolor 
| r2 f,2 f2 
| r2 d1\color 
| r2 a1 
| r2 d1\endcolor 
| R1.
| R1.
| r2 c2 c2~
| c4 c4 g'1\colorOne 
| c,2 c'2 a2~
| a4 f4 g1\colorOne 
| f1. 
| r2 a2 a2 
| f2 g2 g2 
| a2 g2 g2 
| c2\color d2 d2~
| d2 c1
| r2 f,2 f2~
| f2 c1
| r2 c'2 c2~
| c2 g1~ 
| g2 bes1~
| bes2 a1 
| r2 c2 c2~
| c2 g1~ 
| g2 bes1~
| bes2 a1\endcolor 
| g1. 
| f1.\fermata 
}


%****************************************
% LYRICS: ESTRIBILLO
%****************************************

LyricsEstribilloSI = \lyricmode {
	% m. 37 RESPONSION 
	De la~au -- ro -- ra la
	ri -- sa, \EdLyrics{ de la~au -- 
	ro -- ra la ri -- sa, la

	% m. 40
	ri -- sa, } se -- rán
	so -- llo -- 
	zos, se -- rán
	so -- llo --
	zos, so --

	% m. 45
	llo -- zos,
	si ven sus o --
	jos, \EdLyrics{ si ven sus o --
	jos, } sus o -- jos,
	al na -- cer la pa --

	% m. 50
	la -- bra, los hom -- bres sor --
	dos,
	los hom -- bres
	sor -- dos, los hom -- 
	bres sor -- 

	% m. 55
	dos, sor --
	dos, los hom -- bres __ 
	sor -- _ dos.
}

LyricsEstribilloAI = \lyricmode {
	% m. 37 RESPONSION
	De la~au -- ro -- ra la 
	ri -- sa, la ri -- sa, la 
	ri -- sa, de la~au -- 

	% m. 40
	ro -- ra la ri -- sa, se -- 
	rán so -- llo --
	zos,
	se -- rán so --
	llo -- zos,

	% m. 45
	so -- llo -- zos,
	si ven sus o -- 
	jos, \EdLyrics{ si ven sus o -- 
	jos, } si ven sus o --
	jos, al na -- cer la pa --

	% m. 50
	la -- bra, los hom -- bres sor --
	dos, los hom -- bres 
	sor -- dos, los hom --
	bres sor -- 
	dos, los hom -- 

	% m. 55
	bres, los hom --
	bres sor -- 
	dos.
}

LyricsEstribilloBII = \lyricmode {
	% m. 37 RESPONSION
	% 1m rest
	De la~au -- ro -- ra la 

	% m. 40
	ri -- sa, \EdLyrics{ de la~au -- 
	ro -- ra la ri -- 
	sa }
}

%****************************************************************************
% SCORE
\paper { 
    page-count = #1
    system-system-spacing.padding = #4
}
\score {
  <<
    \new Staff = "SI-II" 
    <<
      \InstrumentName 
      \TwoLineName "Ti. I" "A. I" 
      ""
      \new Voice = "EstribilloSI" { \voiceOne \MusicEstribilloSI }
      \new Voice = "EstribilloAI" { 
        \voiceTwo 
        \DrawColorBracketsUnder
        \MusicEstribilloAI 
      }
      \new Lyrics \with { alignAboveContext = "SI-II" }
        \lyricsto "EstribilloSI" { \LyricsEstribilloSI }
      \new Lyrics \lyricsto "EstribilloAI" { \LyricsEstribilloAI }
    >>

    % BII
    \new Staff = "BII" 
    <<
      \InstrumentName 
      \TwoLineName "B. II" "[Bajón]"
      ""
      \new Voice = "EstribilloBII" { \MusicEstribilloBII }
      \new Lyrics \lyricsto "EstribilloBII" { \LyricsEstribilloBII }
    >>
  >>	
  \layout {
    short-indent = 0\in
    \context { 
      \Score 
      \omit BarNumber
    }
  }
}

