\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{vcbook}[2018/05/10 Andrew Cashner's book on villancicos]

\newif\ifms
\msfalse
\DeclareOption{ms}{\mstrue}
\ProcessOptions\relax

\ifms
    \LoadClass[12pt,oneside]{book}
\else
    \LoadClass{book}
\fi

\RequirePackage{libertine}
\RequirePackage[libertine]{newtxmath}
\RequirePackage[utf8]{inputenc}
\RequirePackage[T1]{fontenc}
\RequirePackage{url}
\urlstyle{same}

\frenchspacing
\raggedbottom


%***********************************************************************
\ifms
% These options produce manuscript style
\RequirePackage[margin=1in]{geometry}
\RequirePackage[doublespacing]{setspace}
\RequirePackage[none]{hyphenat}
\RequirePackage[document]{ragged2e}
\setlength{\RaggedRightParindent}{0.5in}
\sloppy
\hbadness=10000
\newcommand{\floatfontsize}{\footnotesize}

\RequirePackage[footmarkoff]{biblatex-chicago}
\RequirePackage[endnotes]{semantic-markup}
\RequirePackage{etoolbox}
% Indent endnotes and style non-superscript
\patchcmd{\enoteformat}{1.8em}{0.5in}{}{}
\patchcmd{\theendnotes}
    {\makeatletter}
    {\makeatletter\renewcommand\makeenmark{\theenmark.\ }}
    {}{}

\RequirePackage{fancyhdr}
\fancyhead{}
\fancyfoot{}
\fancyhead[LO]{Cashner, \emph{Faith, Hearing, and the Power of Music}, DRAFT}
\fancyhead[RO]{\thepage}
\pagestyle{fancy}

\else
% For non-manuscript style
\RequirePackage{geometry}
\newcommand{\floatfontsize}{\small}
\RequirePackage{semantic-markup}
\RequirePackage{fnpos}
\RequirePackage{biblatex-chicago}

\fi
%***********************************************************************

\RequirePackage[defaultlines=2,all]{nowidow}

\addbibresource{master.bib}

\RequirePackage{booktabs}
\RequirePackage{tabulary}
\RequirePackage{longtable}
\RequirePackage[normalem]{ulem}

\RequirePackage{poemtranslation}
\RequirePackage{octave}
\RequirePackage{musicography}


\newcommand{\wtitle}{\worktitle}
\newcommand{\ptitle}{\parttitle}

\newcommand{\range}     [2]{#1.~#2}
\newcommand{\measure}   [1]{\range{m}{#1}}
\newcommand{\measures}  [1]{\range{mm}{#1}}
\newcommand{\poemline}  [1]{\range{l}{#1}}
\newcommand{\poemlines} [1]{\range{ll}{#1}}
\newcommand{\itemnum}   [1]{\range{no}{#1}}

\newcommand{\sv}        [1]{s.v.~\mentioned{#1}}
\newcommand{\addorig}   [1]{\add{\foreign{#1}}}
\newcommand{\sig}       [2]{\mbox{#1}: \mbox{#2}} % archival signature
\newcommand{\speaker}   [1]{\textsc{#1}: }
\newcommand{\et}{\&}

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

\RequirePackage[noabbrev]{cleveref}
\crefname{musicexample}{music example}{music examples}
\crefname{poemexample}{poem example}{poem examples}

\RequirePackage{graphicx}
\graphicspath{ 
    {img/music-examples/} 
    {img/figures/} 
}

\newenvironment{floatContents}
{\begin{center}}
{\end{center}}

\newcommand{\includeFigure}[1]{%
    \begin{floatContents}
    \includegraphics[
        width=\textwidth,
        height=\dimexpr\textheight-5\baselineskip,
        keepaspectratio]{#1}
    \end{floatContents}
}

\newcommand{\includeMusic}{\includeFigure}

\newcommand{\includePoem}[1]{%
    \begin{floatContents}
        \floatfontsize
        \input{poem-examples/#1}
    \end{floatContents}
}

\newcommand{\includeTable}[1]{%
    \begin{floatContents}
        \floatfontsize
        \input{tables/#1}
    \end{floatContents}
}

% inline poems and translation in parallel columns
\newenvironment{quotepoem}
{\begin{quote}
 \begin{tabular}{ll}}
{\end{tabular} 
 \end{quote}}

\newenvironment{quotepoemlong}
{\begin{quote}
 \begin{longtable}{ll}}
{\end{longtable} 
 \end{quote}}



\endinput
