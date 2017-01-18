% OYEME, TORIBIO (EL SORDO)
% JUAN GUTIERREZ DE PADILLA (MEX-Pc: Leg. 1/2)
% EDITED BY ANDREW CASHNER

% EXAMPLE 1 FOR THEOLOGY CHAPTER
% MM. 1--22

\version "2.18.2"
\include "../ly/phd.ly"
\include "../ly/example.ly"

%****************************************
% MUSIC
%****************************************

MusicEstribilloSI = \relative c'' {
	% INTRODUCCION DUO CON BAJON, METER 6/2
	\Section #"[INTRODUCCIÓN] Dúo con bajón"
	R\breve.*25 |
	\break

	% m. 26, ESTRIBILLO SOLO
	R\breve.*10 |
	
	% m. 36, METER 3/2
	R1. | 
	\break

	% m. 37 RESPONSION a 5, METER 6/2
	\Section #"RESPONSIÓN a 5"
	r2 c2. \i c4 d2 c2. \o c4 |
	c1. c2 d2. d4 |
	e2 e2. e4 f2 d2. d4 |

	% m. 40
	e2 \i c1 \o r2 d2 d |
	r2 f1 \i r2 e1 |
	r2 f1 \o r2 f f |
	r2 d1 \i r2 e1 |
	r2 c1 r2 d1 |

	% m. 45
	r2 cis1 r2 d1 \o |
	r2 d2 d2. d4 d1^\io |
	d2 e2 e2. e4 d1 \i |
	e2 c1 \o c1. |
	c2 a2. a4 d2 e2. e4 |
	f2 e2. d4 c2 \i e e~ |
	e2 d1 \o r1. |
	r2 f2 \i f1 e \o |
	g1. e2 \i g g~ |
	g d1 \o f1. |
	c1. es1. |
	bes2 \i d1 \o g,2 a( bes) |
	c2 c4( bes a g) a1.\fermata 
	\bar "|."
	\break
}


MusicEstribilloAI = \relative c' {
	% INTRODUCCION DUO CON BAJON, METER 6/2
	\time 6/2
	r2 a'2 a f2. f4 g2~ \i |
	g2 a1 \o r1. |
	R\breve.
	r2 a2 a g2. f4 e2~ \i |

	% m. 5
	e2 fis1 \o r1. |
	R\breve.
	r1. r2 a2 a |
	a2. g4 a1 \i g1 \o |
	r2 f2 f f \i g1 \o |

	% m. 10
	a1 a2 r1. |
	R\breve. |
	r2 a2 a g2. f4 e2~ \i |
	e2 fis1 \o r1. |
	R\breve. |

	% m. 15
	r2 g2. g4 fis2 g1 |
	e2 fis1^\io fis2^\naQ g1 |
	a2 f1 g2 \i a1 \o |
	R\breve.*2 |

	% m. 20
	R\breve. |
	r2 a2 a bes \i a1 \o |
	g2 \i a1 \o r1. |
	R\breve.*3 |
	
	% m. 26 ESTRIBILLO SOLO
	r2 f2. f4 d2 e2. e4 |
	f2 \i e1 \o r2 g2 g |
	r2 a1 \i r2 bes1 |
	r2 a1 \o r2 g2 g~ |

	% m. 30
	g4 g fis1 g2 d2. d4 |
	g2 a2. a4 bes2 \i a1 \o |
	r2 c2 \i c1 g1~ |
	g2 bes1. f1 |
	r2 a2 a1 e1~ |
	e2 f1.( e1) \o |
	
	% m. 36 METER 3/2
	\time 3/2
	f1. |

	% m. 37 RESPONSION A 5, METER 6/2
	\time 6/2
	r2 a2. a4 bes2 g2. g4 |
	a2 g2. g4 a2 f2. d4 |
	g1 g2 r2 bes2. bes4 |

	% m. 40
	g2 a2. a4 f2 bes2. bes4 |
	bes2 \i a1 \o g1. |
	a\breve. |
	r2 g2 g r2 c1 \i |
	r2 a1 r2 f1 |

	% m. 45
	r2 a2 a1 a \o |
	r2 bes2 bes2. bes4 a1^\io |
	bes2 c c2. c4 b1 |
	c2 a a2. a4 g1^\io |
	a2 c2. c4 bes2 a2. a4 |

	% m. 50 
	a2 c2. bes4 a2 c c~ |
	c2 a a bes2 \i a1 \o |
	f1 f2 r2 c'2 \i c~ |
	c2 g1. bes1 \o |
	bes1. r2 a2 \i a~ |

	% m. 55
	a2 g1 r2 g2 g~ |
	g2 f1 e2( f1~ |
	f2 e1) \o f1.\fermata |
}

MusicEstribilloBII = \relative c {
	% INTRODUCCION DUO CON BAJON, METER 6/2
	R\breve. |
	r1. r2 f2 f |
	c'2 a1 g2 \i c,1 \o |
	R\breve. |

	% m. 5
	r1. r2 c'1 \i |
	r2 g1 \o r2 g2 g |
	bes2 \i f1 \o r1. |
	R\breve.*2

	% m. 10
	r1. r2 a2 a |
	a2. d,4 \i a'1 d,1 \o |
	R\breve. |
	r1. r2 bes'2 bes |
	a2 bes1 g2 c1 |

	% m. 15
	R\breve.*3 |
	r2 f,1 bes2 c2. bes4 |
	g2 \i c,1 \o r2 c'2 c |

	% m. 20
	d2. g,4 a1 \i d,1 \o |
	R\breve. |
	r1. r2 f1~ \i |
	f2 g1. c1 |
	r2 f,1. bes,1~ |
	bes2 c1. f1\fermata \o |

	% m. 26 ESTRIBILLO SOLO
	R\breve.*10

	% m. 36 METER 3/2
	R1.

	% m. 37 RESPONSION A 5, METER 6/2
	R\breve. |
	r2 c'2.^\io c4 a2 bes2. bes4 |
	c1. a2 d2. d4 |

	% m. 40
	c2 a2. a4 bes1. |
	g2 a a c \i bes1 \o |
	f2 a a r2 a1 \i |
	r2 b1 r2 c1 \o |
	r2 f,2 f r2 d1 \i |

	% m. 45
	r2 a1 r2 d1 \o |
	R\breve. |
	r2 c2 c2. c4 g'1^\io |
	c,2 c'2 a2. f4 g1^\io |
	f1. r2 a a |

	% m. 50
	f2 g g a g g |
	c2 \i d d1 c |
	r2 f,2 f1 c |
	r2 c'2 c1 g1~ |
	g2 bes1. a1 |
	r2 c2 c1 g1~ |
	g2 bes1. a1 \o |
	g1. f1.\fermata |
}



%****************************************
% MUSIC: COPLAS
%****************************************

MusicCoplasAI = \repeat volta 2 {
	% m. 58 ODD COPLAS
	\set Score.currentBarNumber = #58
	\relative c' {
	\Section #"COPLAS [A]"
	r2^\markup "[Bassus I accompaniment missing]" a'2 a f f1 |
	g2 \i a1 \o r2 a2 a~ |

	% m. 60
	a2 g2. f4 e2 \i fis1 \o |
	r2 d d e g1 |
	fis2 \i g1 \o r2 g2 f |
	e2 f1 e2 \i f1 \o 
	\bar "||"
	\break

	% m. 64
	%R\breve.*6 |
	}
}

MusicCoplasBII = \repeat volta 2 {
	\relative c {
	% m. 58
	R\breve.*6 |
	% m. 64 EVEN COPLAS
	\set Score.currentBarNumber = #64
	\Section #"COPLAS [B]"
	r2^\markup "[Tenor I solo missing]" f2 f bes d1 |
	c2 \i f,1 \o r2 f f~ |
	f2 g g a \i d,1 \o | 
	r2 g g c, c1 |
	d2 \i g1 \o r2 g2 g |
	c2 \i d1 c2 f,1 \o |
	\RepeatMsg #"[D.S. after copla 6, 12?]"
	}
}

%****************************************
% LYRICS: ESTRIBILLO
%****************************************

LyricsEstribilloSI = \lyricmode {
	% INTRODUCCION DUO (TACET)
	% 25mm rest 
	% m. 26 ESTRIBILLO SOLO (TACET)
	% 10mm rest

	% m. 36 METER 3/2
	% 1m rest

	% m. 37 RESPONSION 
	De la~au -- ro -- ra la
	ri -- sa, \it de la~au -- 
	ro --ra la ri -- sa, la

	% m. 40
	ri -- sa, \rm se -- rán
	so -- llo -- 
	zos, se -- rán
	so -- llo --
	zos, so --

	% m. 45
	llo -- zos,
	si ven sus o --
	jos, \it si ven sus o --
	jos, \rm sus o -- jos,
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
	que te~es -- cu -- cho—
	% 2m rest

	% m. 20
	% 1m rest
	—que me vuel -- ves
	lo -- co.
	% 3mm rest

	% m. 26 ESTRIBILLO
	De la~au -- ro -- ra la 
	ri -- sa se -- rán
	so -- llo -- 
	zos, si ven __
	
	% m. 30
	sus o -- jos, al na -- 
	cer la pa -- la -- bra, 
	los hom -- bres __
	sor -- dos,
	los hom -- bres __

	% m. 35
	sor -- 
	dos.

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
	jos, \it si ven sus o -- 
	jos, \rm si ven sus o --
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
	chor -- no? ¿Qué~es lo 

	% m. 20
	que me di -- ces?
	% 5mm, 7 perfect semibreves notes without lyrics 
	% (no lyrics in mm. 22--25)
	\skip 1. \skip 1.  \skip 1. \skip 1.  
	\skip 1. \skip 1.  \skip 1. 
	
	% m. 26 ESTRIBILLO AI SOLO
	% 10mm rest
	

	% m. 36 METER 3/2
	% 1m rest

	% m. 37 RESPONSION
	% 1m rest
	De la~au -- ro -- ra la 

	% m. 40
	ri -- sa, \it de la~au -- 
	ro -- ra la ri -- 
	sa \rm
}

%****************************************
% LYRICS: COPLAS
%****************************************

LyricsCoplasAI = \lyricmode {
	% m. 58
	\set stanza = #"1. "
	En lo que te
	cuen -- to, ni qui -- 

	% m. 60 
	to ni pon -- go,
	que~hab -- lo mis --
	te -- rio, sin ser 
	por el Cor -- pus.
}

BlockLyricsCoplas = \markup {
	\fontsize #2
	\column {
	\vspace #1
	\fill-line { \bold "Altus I coplas" }
	\vspace #1
	\fill-line { 
		\column {
			"1. En lo que te cuento,"
			"ni quito ni pongo,"
			"que hablo de misterio,"
			"sin ser por el Corpus."

			\vspace #1
			"3. Dios ha dado en tierra"
			"y el cuento es famoso,"
			"que lo dijo un ángel"
			"y lo saben todos."
		}
		\column {
			"5. Gloria es ya la tierra,"
			"de Pascua está el soto,"
			"y hasta un portalillo,"
			"es muy misterioso."
			\italic "[Rep. estribillo?]"
		
			\vspace #1
			"7. El hijo del Padre"
			"sea puesto del lado,"
			"bien que sobre el cielo"
			"ya está nuestro polvo."
		}
		\column {
			"9. Un buey y una mula"
			"se llevan los ojos,"
			"ven que por ser bestia"
			"puedes ser dichoso."
			
			\vspace #1
			"11. A hacer buenas migas,"
			"está con nosotros,"
			"que ya dan papilla,"
			"almas, ingenioso."
			\italic "[Rep. estribillo]"
		}
	}
	}
}

%****************************************************************************
% SCORE: INTRODUCCION, ESTRIBILLO, RESPUESTA
%****************************************************************************

\score {
	<<
		\new ChoirStaff 
		<<
			\ChoirStaffName #"CHORUS I"
			
			% SI
			\new Staff = "SI" 
			<<
				\InstrumentIncipit #"TIPLE I" #"Ti. I" ##{ \IncipitSI #}
				\new Voice = "EstribilloSI" {
					\MainStyle
					\clef "treble"
					\MusicEstribilloSI
				}
				\new Lyrics \lyricsto "EstribilloSI" {
					\LyricsEstribilloSI
				}
			>>

			% AI
			\new Staff = "AI" 
			<<
				\InstrumentIncipit #"ALTUS I" #"A. I" ##{ \IncipitAI #} 
				\new Voice = "EstribilloAI" {
					\MainStyle
					\clef "treble"
					\MusicEstribilloAI
					\MusicCoplasAI
				}
				\new Lyrics \lyricsto "EstribilloAI" {
					\LyricsEstribilloAI
					\LyricsCoplasAI
				}
			>>
		>> % end of CHORUS I choirstaff

		\new ChoirStaff
		<<
			\ChoirStaffName #"CHORUS II"

			% BII
			\new Staff = "BII" 
			<<
				\InstrumentIncipit ##{ \TwoLineName #"BASSUS II" #"[Bajón]" #} 
													#"B. II" ##{ \IncipitBII #}
				\new Voice = "EstribilloBII" {
					\MainStyle
					\clef "bass"
					\MusicEstribilloBII
					\MusicCoplasBII
				}
				\new Lyrics \lyricsto "EstribilloBII" {
					\LyricsEstribilloBII
				}
			>>
		>> % end of CHORUS II choirstaff
	>>	
	\layout {
		\LayoutStyle
		indent = 1.75\in
		short-indent = 0.5\in
	}
}


%**************************************
% COPLAS BLOCK LYRICS
%**************************************

\markup { \BlockLyricsCoplas }
