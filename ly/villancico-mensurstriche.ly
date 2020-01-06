\version "2.19"

%%*******************
%% BARLINES

MiddleBarSign = { \bar "||" }
FinalBarSign = { \bar "|." }
RepeatBarStartSign = { \bar ".|:-||" }
RepeatBarEndSign = { \bar ":|." }
RepeatBarSign = \RepeatBarEndSign
RepeatBarEndStartSign = { \bar ":|.|:" } %% end of one repeat, start of another

%%*******************
%% MENSURSTRICHE (within StaffGroup not ChoirStaff)

Mensurstriche = {
  \hide Staff.BarLine
}
MensurDrawFullBarLine = {
  \once\revert Staff.BarLine.transparent
}
MensurFinalBar = {
  \MensurDrawFullBarLine
  \FinalBarSign
}
MensurMiddleBar = {
  \MensurDrawFullBarLine
  \MiddleBarSign
}
MensurRepeatBar = {
  \MensurDrawFullBarLine
  \RepeatBarSign
}
FinalBar = \MensurFinalBar
MiddleBar = \MensurMiddleBar
RepeatBar = \MensurRepeatBar

\layout {
  \context {
    \Score
    \Mensurstriche
  }
}


