\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{vcbook-float}[2019/05/29 
Class for standalone floats for Cashner villancico monograph]
\LoadClass{article}

\newif\ifpoem
\poemfalse
\DeclareOption{poem}{\poemtrue}

\newif\ifdia
\diafalse
\DeclareOption{dia}{\diatrue}

\newif\iftable
\tablefalse
\DeclareOption{table}{\tabletrue}

\ProcessOptions\relax

\RequirePackage[float]{vcbook-format}
\RequirePackage{vcbook-macros}

\ifpoem
    \RequirePackage{poemtranslation}
\fi
\ifdia
    \RequirePackage{tikz}
\fi
\iftable
    \RequirePackage{tabulary,tabularx}
    \RequirePackage{booktabs}
    % Custom minipage environment for use inside tables with ruled tabulars
    % Eliminates footnoterule to avoid clash with \bottomrule
    \NewDocumentEnvironment{tableminipage}{}
    {%
        \let\oldendminipage\endminipage 
        \def\endminipage{\let\footnoterule\relax\oldendminipage}%
        \begin{minipage}{\linewidth}%
    }{% 
        \centering\end{minipage}\par
    }
\fi

\endinput
