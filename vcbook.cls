\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{vcbook}[2018/05/21 Andrew Cashner's book on villancicos]

\newif\ifdraft
\draftfalse
\DeclareOption{draft}{\drafttrue}

\ProcessOptions\relax

\ifdraft
\LoadClass[12pt,oneside]{book}
\else
\LoadClass{book}
\fi

\RequirePackage{xparse}
\RequirePackage[subpreambles,mode=buildnew]{standalone}

% FONT AND TYPOGRAPHY
\RequirePackage{luatexbase}
\RequirePackage{microtype}

\RequirePackage[libertine]{newtxmath}
\RequirePackage{fontspec}
\setmainfont{Brill}
\RequirePackage{mathastext}
\newfontfamily\hebrewfont[Script=Hebrew]{SBL Hebrew}

\RequirePackage{url}
\urlstyle{same}
\RequirePackage[defaultlines=2,all]{nowidow}
\RequirePackage{semantic-markup}
\RequirePackage{musicography-unicode}
\RequirePackage{octave}
\RequirePackage{poemtranslation}

% PAGE LAYOUT
\frenchspacing
\raggedbottom

\RequirePackage[textwidth=5.5in]{geometry}
\ifdraft
    \RequirePackage[doublespacing]{setspace}
    \RequirePackage[none]{hyphenat}
    \RequirePackage[document]{ragged2e}
    \setlength{\RaggedRightParindent}{0.5in}
    \sloppy
    \hbadness=10000
\fi

% TABLES
\RequirePackage{tabulary}
\RequirePackage{tabularx}
\RequirePackage{longtable}
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
\RequirePackage{etoolbox}
\NewDocumentCommand{\liningfigures}{}{\addfontfeatures{Numbers={Lining}}}
\AtBeginEnvironment{tabular}{\liningfigures}
\AtBeginEnvironment{tabulary}{\liningfigures}
\AtBeginEnvironment{tabularx}{\liningfigures}
\AtBeginEnvironment{tikzpicture}{\liningfigures}


% SECTION & TOC NUMBERING
\setcounter{secnumdepth}{1}
\setcounter{tocdepth}{2}

% PAGE HEADERS
\RequirePackage{fancyhdr}
\pagestyle{fancy}
\fancyhf{}
%\setlength{\headheight}{16pt}

\ifdraft
    \fancyhead[LO]{Cashner, \emph{Hearing Faith}, DRAFT}
    \fancyhead[RO]{\thepage}
\else
    \renewcommand{\chaptermark}[1]{\markboth{#1}{}}
    \fancyhead[LE,RO]{\thepage}
    \fancyhead[RE]{\scshape{Hearing Faith}}
    \fancyhead[LO]{\emph{\leftmark}}
\fi

% PAGE NUMBERING
% No number on part pages (use empty page style, not plain)
\RequirePackage{etoolbox}
\patchcmd{\part}
{\thispagestyle{plain}}{\thispagestyle{empty}}{}{}

% BIBLIOGRAPHY
\RequirePackage[autolang=none]{biblatex-chicago}
\addbibresource{master.bib}

% ENDNOTES OR FOOTNOTES
\ifdraft
    \renewcommand\@makefntext[1]{% 
        \setlength{\parindent}{0.5in}% 
        \noindent\makebox[0.5in][r]{\@thefnmark.\,\,}#1%
    }
\fi
% Keep footnotes at bottom of page
\RequirePackage{fnpos} 

% FLOATS
\RequirePackage{graphicx}
\graphicspath{ 
    {figures/} 
    {build/music-examples/} 
}

\RequirePackage{newfloat}

\DeclareFloatingEnvironment[
    fileext=mux,
    listname={List of Music Examples},
    name={Music example},
    placement={t},
    within=chapter,
    chapterlistsgaps=off
]{musicexample}

\DeclareFloatingEnvironment[
    fileext=pox,
    listname={List of Poem Examples},
    name={Poem example},
    placement={t},
    within=chapter,
    chapterlistsgaps=off
]{poemexample}

\DeclareFloatingEnvironment[
    fileext=dia
    listname={List of Diagrams},
    name={Diagram},
    placement={t},
    within=chapter,
    chapterlistsgaps=off
]{diagram}


% FLOAT FORMATTING AND FILE INCLUSION
\NewDocumentEnvironment{floatContents}{}
    {\begin{center}\footnotesize}
    {\end{center}}

% All floats are compiled via Makefile from separate LaTeX or Lilypond
% files, cropped, and placed in subdirectories under build/
% So we just need to include the PDF

\RequirePackage{adjustbox}

% Adjust float image to no larger than full page with room for caption;
% do not adjust if it already fits
\NewDocumentCommand{\includeFloatPDF}{ m }{%
    \ifdraft
        \fbox{Insert float \detokenize{#1}}\centering
    \else
        \begin{floatContents}
            \adjincludegraphics[ 
            max width=\linewidth,
            max height=\dimexpr\textheight-5\baselineskip,
            keepaspectratio
            ]{#1}%
        \end{floatContents}
    \fi
}

\NewDocumentCommand{\includePoem}{ m }{%
    \includeFloatPDF{build/poem-examples/#1}%
}
\NewDocumentCommand{\includeMusic}{ m }{%
    \includeFloatPDF{build/music-examples/#1}%
}
\NewDocumentCommand{\includeFigure}{ m }{%
    \includeFloatPDF{figures/#1}%
}

\NewDocumentCommand{\insertFloat}{ m m m m }{%
    \begingroup
    \def\@id{\detokenize{#3}}
    \begin{#1}[!t]
        \caption{#4}
        \label{#2:\@id}
        \ifdraft
            \fbox{Insert #1 (\@id)}\centering
        \else
            \csname @include#1\endcsname{\@id}
        \fi
    \end{#1}
    \endgroup
}

\NewDocumentCommand{\insertTable}{ m m }{%
    \insertFloat{table}{tab}{#1}{#2}%
}
\NewDocumentCommand{\insertPoem}{ m m }{%
    \insertFloat{poemexample}{poem}{#1}{#2}%
}
\NewDocumentCommand{\insertMusic}{ m m }{%
    \insertFloat{musicexample}{mux}{#1}{#2}%
}
\NewDocumentCommand{\insertFigure}{ m m }{%
    \insertFloat{figure}{fig}{#1}{#2}%
}
\NewDocumentCommand{\insertDiagram}{ m m }{%
    \begin{floatContents}
    \begin{diagram}[!t]
        \caption{#2}
        \label{dia:#1}
        \includestandalone{diagrams/#1}
    \end{diagram}
    \end{floatContents}%
}
\NewDocumentCommand{\@includetable}{ m }{%
    \begin{floatContents}
        \input{tables/#1}
    \end{floatContents}%
}
\NewDocumentCommand{\@includepoemexample}{ m }{%
    \begin{floatContents}
        \input{poem-examples/#1}
    \end{floatContents}%
}

\NewDocumentCommand{\@includemusicexample}  {}{\includeMusic}
\NewDocumentCommand{\@includefigure}        {}{\includeFigure}

% Use for figures that need to be scaled up
\NewDocumentCommand{\includeBigFigure} { m }{%
    \begin{floatContents}
        \includegraphics[
            width=\linewidth,
            height=\dimexpr\textheight-5\baselineskip,
            keepaspectratio 
        ]{figures/#1}%
    \end{floatContents}
}

\NewDocumentCommand{\includeChapter}{ m }{%
    \include{chapters/#1}%
}
\NewDocumentCommand{\includeonlyChapter}{ m }{%
    \includeonly{chapters/#1}%
}

% INLINE ENVIRONMENTS
% Inline poems and translation in parallel columns
\RequirePackage{quoting}
\NewDocumentCommand{\quotepoemfont}{}{\small}

\NewDocumentEnvironment{quotepoemContents}{}
{\quotepoemfont
 \quotingsetup{rightmargin=0pt}
 \begin{quoting}}
{\end{quoting}}

\NewDocumentEnvironment{quotepoem}{}
{\begin{quotepoemContents}
 \begin{tabular}{ll}}
{\end{tabular}
 \end{quotepoemContents}}

\NewDocumentEnvironment{quotepoemlong}{}
{\begin{quotepoemContents}
 \begin{longtable}{ll}}
{\end{longtable}
 \end{quotepoemContents}}

% Epigraphs
\NewDocumentCommand{\epigraphTable}{ m }{%
    \begin{tabular}{l}
        #1
    \end{tabular}%
}
\NewDocumentCommand{\epigraphTranslation}{ m m m }{%
    \begin{flushright}
        \begin{tabular}{l}
            {\itshape\epigraphTable{#1}}\tabularnewline
            \addlinespace
            \epigraphTable{#2}\tabularnewline
            \addlinespace 
            \epigraphTable{---#3}
        \end{tabular}
    \end{flushright}
    \bigskip
}

% SEMANTIC MACROS
\NewDocumentCommand{\range}     { m m } {#1.~#2}
\NewDocumentCommand{\measure}   { m }   {\range{m}{#1}}
\NewDocumentCommand{\measures}  { m }   {\range{mm}{#1}}
\NewDocumentCommand{\poemline}  { m }   {\range{l}{#1}}
\NewDocumentCommand{\poemlines} { m }   {\range{ll}{#1}}
\NewDocumentCommand{\itemnum}   { m }   {\range{no}{#1}}
\NewDocumentCommand{\pagenum}   { m }   {\range{p}{#1}}
\NewDocumentCommand{\pagenums}  { m }   {\range{pp}{#1}}

\NewDocumentCommand{\sv}        { m }   {s.v.~\mentioned{#1}}
\NewDocumentCommand{\addorig}   { m }   {\add{\foreign{#1}}}
\NewDocumentCommand{\sig}       { m m } {\mbox{#1}: \mbox{#2}} % archival signature
\NewDocumentCommand{\speaker}   { m }   {\textsc{#1}: }
\NewDocumentCommand{\et}        {}      {\&}
\NewDocumentCommand{\scripture} { m m } {#1~#2}
\NewDocumentCommand{\circa}     { m }   {ca.~#1}
\NewDocumentCommand{\tabitem}   {}      {\textbullet\enspace}
\NewDocumentCommand{\tabindent} {}      {\hspace{1em}}
\NewDocumentCommand{\strophe}   {}      {\tabindent}

% UNICODE MACROS
\RenewDocumentCommand{\Dots}{}{\add{…}} % U+2026
\NewDocumentCommand{\charAlpha}{}{α}

% HYPERLINKS
\RequirePackage[
    hidelinks,
    pdfpagelabels
]{hyperref}

\hypersetup{%
    pdfauthor={Andrew A. Cashner},
    pdftitle={Hearing Faith (DRAFT)},
    pdfsubject={Music: history and interpretation, Spain, Mexico, 17th cent.;
    Religion: devotion, popular culture, Spain, Mexico, 17th cent.;
    Spanish literature: poetry (low Baroque);
    Villancicos (part songs): history and interpretation}
}
\pdfstringdefDisableCommands{%
    \def\quoted#1{"#1"}
}

\RequirePackage[numbered]{bookmark}

% AUTOMATIC CROSS-REFERENCES (must be loaded after hyperref)
\RequirePackage[noabbrev]{cleveref}
\crefname{musicexample}{music example}{music examples}
\crefname{poemexample}{poem example}{poem examples}
\crefname{diagram}{diagram}{diagrams}

\let\oldtableofcontents\tableofcontents
\RenewDocumentCommand{\tableofcontents}{}{%
    \hypersetup{pageanchor=true}
    \oldtableofcontents
}

\endinput
