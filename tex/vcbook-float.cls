\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{tex/vcbook-float}[2020/02/10
Standalone floats for inclusion in villancico book]
% Compile with XeLaTeX

\LoadClass{book}

\RequirePackage{tex/vcbook-macros}
\RequirePackage{tex/vcbook-format}

% Keep Tikz graphics under maximum width by putting them in this environment
\RequirePackage{environ}
\NewEnviron{textwidthbox}{%
    \resizebox{\textwidth}{!}{\BODY}%
}

\pagestyle{empty}
\AtBeginDocument{\footnotesize}

\endinput
