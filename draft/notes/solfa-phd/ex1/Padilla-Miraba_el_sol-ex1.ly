% EXAMPLE 1

% JUAN GUTIERREZ DE PADILLA
% MIRABA EL SOL
% MEX-Pc: Leg. 34 (MS anthology)

% Edited by Andrew A. Cashner, 2014-09-09

% VC de concepción, a duo y a 4
% Only tenor part extant

\version "2.18.2"
\include "../../ly/phd.ly"
\include "../../ly/example.ly"

%****************************************
% MUSIC
%****************************************

% MAIN
MusicT = {
	\CantusMollis
	\clef "treble_8"

	% INTRODUCCION a duo
	\time 6/2
	\set Score.currentBarNumber = #2
	r2 a1 g2 f1 |
	c'2 d'1 c'2 bes2. bes4  |
	a2 g2 g2 d'2 es'2. es'4  |
	d'2 c'1 bes2 a1 |
	g2( \i d'1) \o c'1. | 
	\bar "||" \break

	% estribillo
	r2 c'1. \i d'1 \o |
	c'2^\markup {
				\column { \line { \box \line { C (\italic { \bold {sol, fa,} ut}) } } 
									\line { \hspace #0.5 
													\combine 
														\raise #0.5 \draw-line #'(0 . 1.5) 
														\arrow-head #Y #DOWN ##f } 
							}
			}
				bes1 a2 g1 |
	f2 g2. a4 bes2 a2. a4 |
	g2 a2. bes4 c'2 d'2. d'4 | \break
	g2 c'1 f'2 d'2. d'4 |
	e'2 \i fis'1 \o g'1. 
	r2 c'2 c'1 d'2 d'4 d'4 |
	c'2 bes1 a2 \i c'1 |
	r2 d'1 r2 c'1 |
	r2 a1 \o g2 a2 a2 |
	c'\breve. |
	d'2 \i bes1 \o a1. |
	g2 \i bes1. a2 a2~ |
	a2 \o g2 c'2 
}
%****************************************
% LYRICS
%****************************************

LyricsT = \lyricmode {

	% INTRODUCCION
	\bf\it Mi -- ra -- \rm ba~el \bf\it sol \rm el á -- gui -- la
	be -- lla, y vién -- do -- la yo
	su lim -- pio cri -- \bf\it sol, \rm

	% ESTRIBILLO
	en \bf\it la sol -- fa mi -- re, \rm
	pues a -- gra -- cia -- da~en un pun -- to,~en
	un pun -- to se ve 
	con tan -- ta \bf\it re -- mi -- fa -- sol,
	que \bf\it so -- la \rm a \bf\it la \rm luz de \bf\it mi sol la \rm
	ad -- \bf\it mi -- re \rm de \bf\it mi sol,
	\bf\it la \rm ad -- \bf\it mi -- re. \rm
	A -- ve,  \bf\it mi -- ra -- sol, 
}
%****************************************
% SCORE
%****************************************

\score {
	<<
	\new Staff 
		<<
		\Instrument #"TENOR" #""
		\new Voice = "T" { \MainStyle \MusicT }
		\new Lyrics \lyricsto "T" { \LyricsT }
		>>
	>>
	\layout { \LayoutStyle }
}




