% IRIZAR, QUE MUSICA CELESTIAL (E-SE: 18/36 AND 3/28)
% EXAMPLE: OPENING

\version "2.19"
\include "../ly/phd.ly"
\include "../ly/example.ly"

%*******************
% MUSIC
%*******************

MusicSIi = {
	\clef "treble"
	\time 6/2
	R\breve.*3
	r1. r2^\markup \italic "solo" a''2 a''2~ \i 
	a''2 \o g''2 g''1^\io f''2 f''2 
	f''2 e''2 e''2 e''2 \i d''1 \o
	cis''2 d''2 d''1 \i cis''1 \o
	d''1.
}

MusicAI = {
	\clef "treble"
	\time 6/2
	r2^\markup \italic "solo" d''2 d''1^\io c''2 c''2 
	c''2 bes'2 bes'1^\io a'2 a'2
	a'2 g'2 g'1^\io f'2 f'2~( \i 
	f'2 g'1) \o a'1.
	R\breve.*3
	r1.
}


MusicAc = {
	\clef "bass"
	\time 6/2
	d1. a1. 
	d'1. c'1. 
	bes1. a2 \i d1 \o
	d'2 c'2 bes2 a1.

	d'1. a1.
	g1. f1 g2 
	a2 \i d1 \o a1. 
	d1 d2
}

%*******************
% LYRICS
%*******************

LyricsSIi = \lyricmode {
	¿Qué so -- be -- ra -- na~ar -- mo -- ní -- a~es la que~el o -- í -- do~e -- le -- _ va?
}

LyricsAI = \lyricmode {
	¿Qué mú -- si -- ca ce -- les -- tial es la que~hoy el ai -- re~al -- te -- ra?
}

%*******************
% FIGURES
%*******************

FiguresAc = \figuremode {
	< _ >1. < 4 >1. < 7 >2 < 6 >1 < 7- >1. < 7 >1. < 7 >1.
	< _ >1 < 6 >2 < _ >1.
	< 4 >1. < 7 >1. < 7 >1. < 7 >1. < _ >1. < 4 >1. < _ >1.
}

%*******************
% SCORE
%*******************

\score {
	<<
		\new Staff = "SI1-AI"
		<<
			\Instrument #"Ti. I-1" #"Ti. I-1"
			\new Voice = "SIi" { \MainStyle \MusicSIi }
			\new Lyrics  \lyricsto "SIi" { \LyricsSIi }
		>>
		\new Staff = "AI"
		<<
			\Instrument #"A. I" #"A. I"
			\new Voice = "AI"  { \MainStyle \MusicAI }
			\new Lyrics \lyricsto "AI" { \LyricsAI }
		>>
		\new Staff = "Ac"
		<<
			\Instrument #"Ac." #"Ac."
			\new Voice = "Ac" { \MainStyle \MusicAc }
			\new FiguredBass { \FiguresAc }
		>>
	>>
	\layout {
		\LayoutStyle
		indent = 0.5\in
		short-indent = 0.5\in
	}
}

