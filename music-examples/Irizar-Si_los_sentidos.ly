% IRIZAR, SI LOS SENTIDOS
% EXAMPLE, MM. 22--32

\version "2.19"
\include "villancico.ly"
\include "vcbook-example.ly"

%****************************************
% MUSIC
%****************************************

MusicSIi = \relative c'' {
    \set Score.currentBarNumber = #29
        \ShowFirstBarNumber
        \MeterDuple
        e2 d8 d d d |
        d4 d4. d8 d4 |
        e4 e r4 a,8 a| 

        % m. 25
        b4 c8 c bes4 bes8 a8~ |
        a8 a8 a4 a2 | 
        r2 cis4 cis8 cis |
        cis4 d4 r2 |
        r2 r4 cis4 |

        % m. 30 
        d2 r4 cis8 cis |
        d4 e8 e c4 d8 d~ |
        d c8 b4 c2 |
}

MusicSIii = \relative c'' {
    \MeterDuple
        g4 g g8 g g g |
        g4 g4. g8 f4 |
        a4 a r4 f8 f |

        % m. 25
        g4 a8 a f4 g8 g~ |
        g8 f e4 f2 |
        r2 a4 a8 a |
        a4 a r2 |
        r2 r4 a4 |

        % m. 30
        a2 r4 a8 a |
        a4 c8 c a4 b8 gis8~ |
        gis8 a gis4 a2 |
}

MusicAI = \relative c' {
    \MeterDuple
        c4 g b8 b b b |
        b4 b4. b8 d4 |
        cis4 cis r4 d8 d |

        % m. 25
        d4 f8 f d4 e8 cis~ |
        cis8 d cis4 d2 |
        r2 e4 e8 e |
        e4 f r2 |
        r2 r4 e |

        % m. 30
        f2 r4 e8 e |
        f4 g8 g f4 f8 e~ |
        e8 e e4 e2 |
}

MusicTI = \relative c {
    \MeterDuple
        c2 g'8 g g g |
        g4 g4. g8 d4 |
        a'4 a r4 d,8 d |

        % m. 25
        g4 f8 f bes4 g8 a~ |
        a8 d, a'4 d,2 |
        r2 a'4 a8 a |
        a4 d, r2 |
        r2 r4 a'4 |

        % m. 30
        d,2 r4 a'8 a |
        d,4 c8 c f4 d8 e~ |
        e8 a e4 a2 |
}

MusicSII = \relative c'' {
    \MeterDuple
        c2 b8 b b b |
        b4 b4. b8 a4 |
        cis4 cis r2 |

        % m. 25
        R1
        r2 a4 a8 a |
        a4 a r2 |
        r4 f8 f g4 a8 a |
        bes4 bes8 a4 a8 a4 |

        % m. 30
        f4 f e2 |
        R1 |
        r2 a4 a8 a |
}

MusicAII = \relative c' {
    \MeterDuple
        e4 c d8 d d d |
        d4 d4. e8 f4 |
        e4 e r2

        % m. 25
        R1 |
        r2 f4 f8 f |
        f4 e r2 |
        r4 d8 d d4 f8 f |
        f4 g8 g4 f8 e4 |

        % m. 30
        d4 d cis2 |
        R1 |
        r2 e4 e8 e |
}

MusicTII = \relative c' {
    \MeterDuple
        g2 g8 g g g |
        g4 g4. g8 a4 |
        a4 a r2

        % m. 25
        R1 |
        r2 d4 d8 d |
        d4 cis r2 |
        r4 a8 a b4 c8 c |
        d4 d8 cis4 d8 cis4 |

        % m. 30
        a4 a a2 |
        R1
        r2 c4 c8 c |
}

MusicBII = \relative c {
    \MeterDuple
        c2 g8 g g g |
        g4 g4. g8 d'4 |
        a4 a r2 |

        % m. 25
        R1 |
        r2 d4 d8 d |
        d4 a r2 |
        r4 d8 d g4 f8 f |
        bes4 g8 a4 d,8 a4 |

        % m. 30
        d4 d a2 |
        R1
        r2 a'4 a8 a |
}

MusicAc = \relative c' {
    \MeterDuple
        c,2 g'2 |
        g4 g2 d4 |
        a2 d2 |

        % m. 25
        g4 f bes g8 a8~ |
        a8 d,8 a4 d2 |
        d4 a'4 a2~ |
        a4 d, g f |
        bes4 g8 a4 d,8 a'4 |

        % m. 30
        d,2 a'2 |
        d,4 c f d8 e~ |
        e8 a8 e4 a2 |
}

%****************************************
% LYRICS
%****************************************

LyricsSIii = \lyricmode {
    -dos, hoy to -- dos con la fe se -- an o -- í -- dos,
        no se den por sen -- ti -- dos los __ sen -- ti -- dos,
        se -- an o -- í -- dos, no, no,
        no se den por sen -- ti -- dos los __ sen -- ti -- dos,
}

LyricsAI = \lyricmode {
    -dos, hoy to -- dos con la fe se -- an o -- í -- dos,
        no se den por sen -- ti -- dos los __ sen -- ti -- dos,
        se -- an o -- í -- dos, no, no
            no se den por sen -- ti -- dos los __ sen -- ti -- dos,
}

LyricsAII = \lyricmode {
    -dos, hoy to -- dos con la fe se -- an o -- í -- dos,
        se -- an o -- í -- dos,
        no se den por sen -- ti -- dos los sen -- ti -- dos, no, no,
        se -- an o-
}

%****************************************
% SCORE
%****************************************

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
        \new Voice = "SIi"  { \voiceOne \clef "treble" \MusicSIi }
    \new Voice = "SIii" { \voiceTwo \MusicSIii }
    \new Lyrics \lyricsto "SIii" { \LyricsSIii }
    >>
        \new Staff = "ATI"
        <<
        \InstrumentName
        \TwoLineName "A. I" "T. I" 
        ""
        \new Voice = "AI" {  \voiceOne \clef "treble_8" \MusicAI }
    \new Voice = "TI" {  \voiceTwo \MusicTI }
    \new Lyrics \lyricsto "AI" { \LyricsAI }
    >>
        >>
        \new ChoirStaff = "ChII"
        <<
        \new Staff = "SAII"
        <<
        \InstrumentName 
        \TwoLineName "Ti. II" "A. II" 
        ""
        \new Voice = "SII" {  \voiceOne \clef "treble" \MusicSII }
    \new Voice = "AII" {  \voiceTwo \MusicAII }
    \new Lyrics \lyricsto "AII" { \LyricsAII }
    >>
        \new Staff = "TBII"
        <<
        \InstrumentName 
        \TwoLineName "T. II" "B. II" 
        ""
        \new Voice = "TII" {  \voiceOne \clef "bass" \MusicTII }
    \new Voice = "BII" {  \voiceTwo \MusicBII }
    >>
        >>
        \new Staff = "Ac"
        <<
        \InstrumentName "Ac." ""
        \new Voice = "Ac" {  \clef "bass" \MusicAc }
    >>
        >>
        \layout { 
            short-indent = 0\in
        }
}

