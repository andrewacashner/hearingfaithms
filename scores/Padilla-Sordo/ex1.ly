% OYEME, TORIBIO (EL SORDO)
% JUAN GUTIERREZ DE PADILLA (MEX-Pc: Leg. 1/2)
% EDITED BY ANDREW CASHNER

% EXAMPLE 1 FOR THEOLOGY CHAPTER
% INTRO

\version "2.19"
\include "villancico.ly"
\include "example.ly"

%****************************************
% MUSIC
%****************************************

MusicEstribilloAI = \relative c' {
    \CantusMollis
	\MeterTriple
	r2 a'2 a2 
    | f2. f4 g1\color a1\endcolor 
    | R1. 
	| R1. | R1.
	| r2 a2 a2 
    | g2. f4 e1\color fis1\endcolor 
    | R1.
	| R1. | R1.
	| R1. 
    | r2 a2 a2 
    | a2. g4 a1\color g1\endcolor
	| r2 f2 f2 
    | f2\color g1\endcolor 
	| a1 a2 
    | R1.
    | R1. | R1.
	| r2 a2 a 
    | g2. f4 e1\color fis1\endcolor 
    | R1. 
	| R1. | R1. 
	| r2 g2. g4 
    | fis2 g1 
	| e2 fis1\colorOne 
    | f2 g1 
	| a2 f1 
    | g2\color a1\endcolor 
	| R1. | R1.
    | R1. | R1.
    | R1. | R1.
	| r2 a2 a2
    | bes2\color a1\endcolor 
	| g2\color a1\endcolor 
    | R1. | R1.
    | R1. | R1.
    | R1. | R1.
    | R1.
}	

MusicEstribilloBII = \relative c {
    \CantusMollis
    R1. | R1.
    | R1._\markup "[T. I Lyrics]" 
    | r2 f2 f2
	| c'2 a1 
    | g2\color c,1\endcolor |
	| R1. | R1.
	| R1. 
    | r2 c'1\color |
	| r2 g1\endcolor 
    | r2 g2 g |
	| bes2\color f1\endcolor 
    | R1. 
	| R1. | R1.
    | R1. | R1.
	| R1. 
    | r2 a2 a2 
	
    | a2. d,4\color a'1 d,1\endcolor 

    | R1. | R1.
	| R1. 
    | r2 bes'2 bes 
	| a2 bes1 
    | g2 c1 
	| R1. | R1.
    | R1. | R1. 
    | R1. | R1.
	| r2 f,1 
    | bes2 c2. bes4 
	| g2\color c,1\endcolor 
    | r2 c'2 c 

	| d2. g,4 a1\color d,1\endcolor 

    | R1. | R1. 
	| R1. 
    
    | r2 f1.\color g1. c1 

    | r2 f,1. bes,1. c1. f1\fermata\endcolor 
}

%****************************************
% LYRICS: ESTRIBILLO
%****************************************

LyricsEstribilloAI = \lyricmode {
	Ó -- ye -- me, To -- ri -- 
	bio.
	% 1m rest
	Glo -- ria~es to -- do~el va --

	% m. 5
	lle.
	% 1m rest
	Ya~es la 
	tie -- rra cie -- lo,
	y|~has -- ta~él, llan -- to~es
	
	% m. 10
	go -- zo.
	% 1m rest
	Pon -- dré -- me des -- o -- 
	tro.
	% 1m rest

	% m. 15
	Tú~e -- res lin -- do
	ton -- to, yo más
	que te~es -- cu -- cho…
	% 2m rest

	% m. 20
	% 1m rest
	…que me vuel -- ves
	lo -- co.
	% 3mm rest
}

LyricsEstribilloBII = \lyricmode {
	% 1m rest
	¿Hab -- las 
	me, cha -- mo -- rro?
	% 1m rest

	% m. 5
	¿E?
	¿E? que no
	te~oi -- go.
	% 2mm rest

	% m. 10
	No~oi -- go
	de~e -- se~o -- í -- do.
	% 1m rest
	Des -- o --
	tro~oi -- go me -- nos.
	
	% m. 15
	% 3mm rest
	¿Si ten -- go bo --
	chor -- no? ¿Qué_es lo 

	% m. 20
	que me di -- ces?
}

%****************************************************************************
% SCORE
%****************************************************************************

\score {
	<<
			% AI
			\new Staff = "AI" 
			<<
				\InstrumentName "A. I" "" 
				\new Voice = "AI" {
					\clef "treble"
					\MusicEstribilloAI
				}
				\new Lyrics \lyricsto "AI" {
					\LyricsEstribilloAI
				}
			>>
			% BII
			\new Staff = "BII" 
			<<
				\InstrumentName 
                    \TwoLineName "B. II" "[Bajón]" 
                    ""
				\new Voice = "BII" {
					\clef "bass"
					\MusicEstribilloBII
				}
				\new Lyrics \lyricsto "BII" {
					\LyricsEstribilloBII
				}
			>>
	>>	
	\layout {
		indent = 0.75\in
	}
}

