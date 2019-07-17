% JUAN GUTIERREZ DE PADILLA
% MIRABA EL SOL
% MEX-Pc: Leg. 34 (MS anthology)

% Edited by Andrew A. Cashner, 2014-09-09

% VC de concepción, a duo y a 4
% Only tenor part extant

\version "2.18.2"
\include "../ly/phd.ly"

%****************************************
% HEADER
%****************************************

\header {
	title			= "Miraba el sol el águila bella"
	subtitle 	= "De Concepción."
	composer	= "JUAN GUTIÉRREZ DE PADILLA"
	dates			= "(c. 1590–1664)"
	source		= "“Villançicos dibinos, i umanos de diversos autores,” MEX-Pc: Leg. 34 (Tenor partbook only/Tenor partichela sólo)"
	editor 		= "Andrew A. Cashner"
	copyright = "Copyright © 2014 Andrew A. Cashner"
	license 	= \CCBY
	tagline 	= ##f
}

%****************************************
% MUSIC
%****************************************

% INCIPIT

IncipitT = {
	\IncipitStyle
	\MeterCZ
	\CantusMollis
	\clef "alto"
	a1
}

% MAIN
MusicT = {
	\CantusMollis
	\clef "treble_8"

	% INTRODUCCION a duo
	\time 3/2
	r1.^\markup \bold \raise #4 \fontsize #2 "[INTRODUCCIÓN] a duo" 
	\time 6/2
	r2 a1 g2 f1 |
	c'2 d'1 c'2 bes2. bes4  |
	a2 g2 g2 d'2 es'2. es'4  |
	d'2 c'1 bes2 a1 |
	g2( \i d'1) \o c'1. | 
	\bar "||" 

		% signum congruentiae: estribillo next
	\Segno r2 c'1.^\markup \bold \raise #4 \fontsize #2 "[ESTRIBILLO]" \i d'1 \o |
	c'2 bes1 a2 g1 |
	f2 g2. a4 bes2 a2. a4 |
	g2 a2. bes4 c'2 d'2. d'4 |
	g2 c'1 f'2 d'2. d'4 |
	e'2 \i fis'1 \o g'1. 
	r2 c'2 c'1 d'2 d'4 d'4 |
	c'2 bes1 a2 \i c'1 |
	r2 d'1 r2 c'1 |
	r2 a1 \o g2 a2 a2 |
	c'\breve. |
	d'2 \i bes1 \o a1. |
	g2 \i bes1. a2 a2~ |
	a2 \o g2 c'2 r2 bes1~ \i |
	bes2 a1 \o r2 d'2. d'4 |
	b2 \i b1 \o c'1. |
	r2 a2. a4 d'2 d'4( c'4 bes4 a4) |
	bes2 a1 c'2 bes2. d'4 |
	a2 g1 d'2 g2. d'4 |
	a2 \i d'1  r2 g'1~ |
	g'2 fis'1 g'2 e'1 \o |
	d'1.  g2 \i c'1 \o  |
	r2 d'2. d'4 a1. |
	g1.  r2 g2 \i c'2~ |
	c'2 b1 \o c'2 f4( g4 a4 bes4)^\markup \bold \raise #4 \fontsize #2 "Coplas/Fine" |
	c'\breve.\fermata |
	\bar "|." \break

	% RESPONSION A4 del duo
	r2^\markup \bold \raise #4 \fontsize #2 "RESPONSIÓN a 4 del duo" f'1. \i e'2 e'2~ 
	e'2 d'1 \o c'1.
	r2 g'2. f'4 e'2 f'1
	r2 d'2. d'4 e'2 \i a1~
	a2 g2 c'1 b1 \o 
	c'1. r2 d'2. d'4
	b2 \i b1 \o c'1.
	a2 a1 a2 d'2 d'2 
	d'2 \i a1 \o r2 a2. a4
	d'2 d'4( c'4 bes4 a4) bes2 \i f1 \o
	c'2 c'1 a2 a2 a2
	a2 \i d'1 r2 a1~ 
	a2 d'1 \o c'2 d'2. d'4
	e'!2 d'1 d'2 g1
	c'2 \i a1 \o g1.~
	g1. g'2 \i fis'1 
	g'2 e'1 \o d'2 g1
	c'\breve.
	r1. r2 d'2. d'4
	a2 \i d'1 \o c'1.
	r2 c'2. d'4 e'2 f'1 
	g'2 \i f'1 \o e'1.~
	\time 3/2
	e'1.\fermata \bar "||" \break

	% COPLAS a duo
	\time 6/2
	r2^\markup \bold \raise #4 \fontsize #2 "COPLAS a duo" f'1 d'2 g'2. f'4 
	e'2 f'1 d'2( e'1) 
	f'2 d'1 c'2 a4( g4 a4 bes4)
	c'2 c'2. d'4 c'2 bes2. a4
	bes1. a1.
	r1. d'2 d'2 d'2
	b2 b2 b2 c'1.~ \i
	c'2 d'1 \o c'2 bes1
	a2 \i g1 \o d'2 es'1
	d'2 c'1 bes2 a1
	bes2( c'1) f1.\fermata
	r1. r2 c'1 
	f'2 d'1 e'2 fis'2. fis'4 
	g'2 e'2. e'4 fis'2 \i g'1~ 
	g'2 \o f'2. e'4 f'2 d'2 d'2~
	d'2 b2. b4 c'1.
	\time 3/2 
	r1.^\DS | 
	\bar "||" \break

	% COPLA 2
	\time 6/2
	r2 f'1 d'2 g'2. f'4
	e'2 \i f'1 \o d'2( e'1)
	f'2 d'1 c'2 a4( g4 a4 bes4)
	c'2 c'2. d'4 c'2 bes2. a4
	bes1. a1.
	r1. d'2 d'4 c'4( bes4 a4)
	bes2 \i bes1 c'1.~
	c'2 d'1 \o c'2 bes1
	a2 g1 d'2 es'1
	d'2 c'1 bes2 a1 
	bes2( \i c'1) \o f1.
	r1. r2 c'1
	f'2 d'1 e'2 f'2. f'4
	g'2 e'!1 f'2 g'2 g'2~
	g'2 f'2. e'4 f'2 d'2 d'2~
	d'2 b!2. b4 c'1.
	\time 3/2
	r1.^\DS | 
	\bar "||" \break

}

%****************************************
% LYRICS
%****************************************

LyricsT = \lyricmode {

	% INTRODUCCION
	Mi -- ra -- ba~el sol el á -- gui -- la
	be -- lla, y vién -- do -- la yo
	su lim -- pio cri -- sol, 

	% ESTRIBILLO
	en la sol -- fa mi -- re,
	pues a -- gra -- cia -- da~en un pun -- to,~en
	un pun -- to se ve 
	con tan -- ta re -- mi -- fa -- sol,
	que so -- la a la luz de mi sol la
	ad -- mi -- re de mi sol,
	la ad -- mi -- re.
	A -- ve,  mi -- ra -- sol, A -- ve, 
	y la gra -- cia fue que~el mi -- la -- no __ nun -- ca,
	nun -- ca la mi -- re, nun -- ca la mi -- re,
	y~e -- lla~al sol mi re, al sol, y la mi -- re, 
	el sol, __ el sol, el __ sol.

	% RESPONSION
	A -- ve, mi -- ra -- sol, A -- ve, A -- ve, A -- ve, mi mi -- ra -- 
	sol, A -- ve, y la gra -- cia fue, gra -- cia fue, y la gra -- cia
	que~el mi -- la -- no __ nun -- ca, nun -- ca, nun -- ca la mi -- re, nun -- ca,
	nun -- ca la mi -- re __ y~e -- lla~al sol mi re, y~e -- lla~al sol mi -- re al
	sol, y la mi -- re~el sol, y la mi -- re~el sol, el sol. __

	% COPLA 1
	\set stanza = #"1. "
	A~el cie -- lo su can -- to~a -- le -- gra pues que~el sol la  a  -- cri -- 
	so -- la,~a -- cri -- so -- la, ni~u -- na se mí -- ni -- ma so -- la, tu -- vo de la no -- ta
	ne -- gra, no -- ta ne -- gra, can -- ta -- ba~en dul -- ce be -- mol sin que~A -- 
	dán to -- no le de. Su lim -- pio cri -- sol,

	% COPLA 2
	\set stanza = #"2. "
	Al ni -- do y pun -- to de voz en -- tró de~ins -- 
	tan -- tes sin te -- dio, sin te -- dio, que no hay __ tiem -- po de por
	me -- dio en la má -- _ xi -- ma de Dios, de __ Dios, so -- bre~un e --
	rran -- te fa -- rol, e -- co~el com -- pás con el pie. Su lim -- pio cri -- sol,

}

%****************************************
% SCORE
%****************************************

\score {
	<<
	\new Staff 
		<<
		\InstrumentIncipit #"TENOR" #"" ##{\IncipitT#}
		\new Voice = "T" { \MainStyle \MusicT }
		\new Lyrics \lyricsto "T" { \LyricsT }
		>>
	>>
	\layout { 
		\LayoutStyle 
		indent = 1.5\in
	}
}




