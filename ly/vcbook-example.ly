%% vcbook-example.ly
%% Andrew Cashner 
%%
%% Altered geometry & settings for in-text example
%% For villancico book

\version "2.19"

#(set-default-paper-size "letter")
#(set-global-staff-size 10)

\include "vcbook-font.ly"

\layout {
  indent = 0.5\in
  short-indent= 0\in
  line-width = 5\in
  top-margin=1\in
  bottom-margin=1\in
}

\paper{
  ragged-right = ##f
  ragged-bottom = ##t
  ragged-last-bottom = ##t
  oddFooterMarkup=##f
  oddHeaderMarkup=##f
  bookTitleMarkup = ##f
  scoreTitleMarkup = ##f
  system-system-spacing.basic-distance = #12 % default
  system-system-spacing.minimum-distance = #8 % default
  system-system-spacing.padding = #3 % default = #1
  system-system-spacing.stretchability = #60
}

ShowFirstBarNumber = {
  \set Score.barNumberVisibility = #all-bar-numbers-visible
  \bar ""
}

%%***********************
%% INCOMPLETE TIE 
%% (as in example clips)
%%***********************

HalfTie = \laissezVibrer

%% Coloration brackets under the staff
ColorBracketsUnder = \layout {
  \context { 
    \Staff \DrawColorBracketsUnder 
  }
}



