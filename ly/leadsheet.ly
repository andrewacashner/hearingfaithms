\version "2.19"
\include "standard-extensions.ly"

#(set-global-staff-size 18)
%\include "font-venturis.ly"

LyricsItalic = \override Lyrics.LyricText.font-shape = #'italic

\header {
  tagline = ##f
}


\paper {
  #(set-paper-size "letter")
  left-margin = 1\in
  right-margin = 1\in
  ragged-bottom = ##t

  markup-system-spacing.padding = #4
  system-system-spacing.padding = #4
}

\layout {
  \context { 
    \Lyrics
    \override StanzaNumber.font-series = #'medium
    \override VerticalAxisGroup.nonstaff-relatedstaff-spacing.padding = #2
  }
}

