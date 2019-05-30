\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{vcbook-float}[2019/05/29 
Class for standalone floats for Cashner villancico monograph]
\LoadClass{article}

% Load different packages and commands depending on what kind of float we are
% making
% POEM EXAMPLE
\newif\ifpoem
\poemfalse
\DeclareOption{poem}{\poemtrue}

% DIAGRAM
\newif\ifdia
\diafalse
\DeclareOption{dia}{\diatrue}

% TABLE
\newif\iftable
\tablefalse
\DeclareOption{table}{\tabletrue}

\ProcessOptions\relax

% Import standard format and commands
\RequirePackage{vcbook-format}
\RequirePackage{vcbook-macros}

% No indent, no page numbers, smaller text
\setlength{\parindent}{0pt}
\pagestyle{empty}
\AtBeginDocument{\footnotesize}

% Custom requirements for different types (passed as package options)
\ifpoem
    \RequirePackage{poemtranslation}
\fi
\ifdia
    \RequirePackage{tikz}
\fi
\iftable
    \RequirePackage{tabulary,tabularx}
    \RequirePackage{booktabs}
    \RequirePackage{xparse}
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
