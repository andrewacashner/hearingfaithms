\version "2.19"
\include "villancico.ly"
\include "vcbook-example.ly"

MusicS = {
  \CantusMollis
  \time 4/1
  \clef "treble"
  g'2 a'2 fis'2 g'1 fis'2 g'1
  \FinalBar
}

MusicA = {
  \CantusMollis
  es'1 d'\breve d'1
}

MusicT = {
  \CantusMollis
  r2 c'1 bes2 a1 g1
}

MusicB = {
  \CantusMollis
  \clef "bass"
  c1 d\breve g,1
}

\score {
  <<
    \new ChoirStaff
    <<
      \new Staff
      <<
        \InstrumentName \TwoLineName "Netodus" "Mesodus" ""
        \new Voice { \voiceOne \MusicS }
        \new Voice { \voiceTwo \MusicA }
      >>
      \new Staff
      <<
        \InstrumentName \TwoLineName "Hypatodus" "Proslambanomenon" ""
        \new Voice { \voiceOne \MusicT }
        \new Voice { \voiceTwo \MusicB }
      >>
    >>
  >>
  \layout {
%    ragged-right = ##t
    line-width=3\in
    indent = 1\in
    \context {
      \Score
      \omit TimeSignature
    }
  }
}

