\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{vcbook-float}[2019/05/29 
Class for standalone, camera-ready floats for Cashner villancico monograph]
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

% SIZE OF TYPE BLOCK
\RequirePackage[
    textwidth=12.5cm,
    textheight=15cm
]{geometry}

% TYPEFACE
\RequirePackage{fontspec}  % Use True-Type Unicode font
\setmainfont{Brill}

\RequirePackage{mathastext} % Use same font for math-mode numbers
\RequirePackage{url}        % Same font for URLs
\urlstyle{same} 

\RequirePackage{microtype}  % Enable automatic fine typographic adjustments
\frenchspacing              % Single space between sentences
\raggedbottom               % Do not add space between paragraphs to fill page

\RequirePackage[defaultlines=2,all]{nowidow} % Avoid widow lines
\RequirePackage{fnpos}      % Keep footnotes at bottom of page

\RequirePackage{booktabs}   % Improved table formatting

% Set up and use lining figures for all tables and diagrams
\NewDocumentCommand{\liningfigures}{}{%
    \addfontfeatures{Numbers={Lining}}%
}
\RequirePackage{etoolbox}
\AtBeginEnvironment{tabular}    {\liningfigures}
\AtBeginEnvironment{tabulary}   {\liningfigures}
\AtBeginEnvironment{tabularx}   {\liningfigures}
\AtBeginEnvironment{tikzpicture}{\liningfigures}

% LOCALIZATION, HYPHENATION
\RequirePackage{polyglossia}
\setdefaultlanguage[variant=american]{english}
\setotherlanguage{spanish}


% No indent, no page numbers, smaller text
\setlength{\parindent}{0pt}
\pagestyle{empty}

% Import common custom commands
\RequirePackage{vcbook-macros}

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
