%% font-libertine.ly
%% Use Libertine font

\version "2.19"

%% GLOBAL FONT
\paper { 
  #(define fonts
    (make-pango-font-tree 
     "Linux Libertine O"
     "Linux Biolinum O"
     "Linux Libertine Mono O"
     (/ staff-height pt 20)))
  %% leave this at 20 regardless of staff size
}


