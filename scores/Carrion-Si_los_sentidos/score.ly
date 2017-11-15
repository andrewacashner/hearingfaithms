%% Carrión, Si los sentidos, E-SE: 28/25
%% example

\version "2.19"
\include "../ly/villancico.ly"
\include "../ly/example.ly"

\include "music.ly"
\include "lyrics.ly"

\score {
  <<
    \new Staff
    <<
      \InstrumentName "SOLO" ""
      \new Voice = "Solo" {\EstribilloSolo }
      \new Lyrics \lyricsto "Solo" { \LyricsEstribilloSolo }
    >>
    \new Staff
    <<
      \InstrumentName "ACOMP." ""
      \new Voice = "Acomp" { \EstribilloAcomp }
      \new FiguredBass { \EstribilloFiguresAcomp }
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



