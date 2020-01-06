%% lyrics-editorial.ly
%% Andrew Cashner, 2016/12/07
%%
%% Editorial lyric additions in italics

\version "2.19"

EdLyrics =
#(define-scheme-function
  (text) (scheme?)
  #{
  \override Lyrics.LyricText.font-shape = #'italic
  $text
  \revert Lyrics.LyricText.font-shape
  #})
