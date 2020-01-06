\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{vcbook-manuscript}[2019/07/08
Simple typescript style for book manuscript draft]

\LoadClass[letterpaper,12pt,oneside]{memoir}

\newlength{\MSindent}
\newlength{\MSmargin}
\setlength{\MSmargin}{1in}
\setlength{\MSindent}{0.5in}

\setlrmarginsandblock{\MSmargin}{\MSmargin}{*}
\setulmarginsandblock{\MSmargin}{\MSmargin}{*}
\setlength{\topskip}{1.6\topskip}
\sloppybottom

\frenchspacing
\DoubleSpacing*
\setlength{\ragrparindent}{\MSindent}
\sloppy
\raggedyright
\raggedbottom
\feetbelowfloat
\checkandfixthelayout

\pagestyle{plain}

% Indent footnotes same as text, double space text and between notes
\setlength{\footmarkwidth}{\MSindent}
\setlength{\footmarksep}{-\MSindent}
\setlength{\footparindent}{\MSindent}
\setlength{\footnotesep}{2\footnotesep}
\setfootins{2\bigskipamount}{2\bigskipamount} % Leave room before footnotes
\footmarkstyle{#1.\,} % No superscript footnote number marks
\renewcommand{\@makefntext}[1]{\makefootmark\raggedyright#1}

\setcounter{secnumdepth}{1} % Number only sections
\setcounter{tocdepth}{2}    % Include only sections in TOC

\endinput
