\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{vcbook}[2018/05/10 Andrew Cashner's book on villancicos]

\newif\ifms
\msfalse

\newif\ifendshift
\endshiftfalse

\DeclareOption{ms}{\mstrue}
\DeclareOption{endshift}{\endshifttrue}
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

\setcounter{secnumdepth}{1}

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
    
    \RequirePackage{fancyhdr}
    \fancyhead{}
    \fancyfoot{}
    \fancyhead[LO]{Cashner, \emph{Hearing Faith}, DRAFT}
    \fancyhead[RO]{\thepage}
    \setlength{\headheight}{16pt}
    \pagestyle{fancy}

\else
    % For non-manuscript style
    \RequirePackage{geometry}
    \RequirePackage{fnpos}
\fi

\ifendshift
    % These options shift footnotes to endnotes and put floats at the end (TODO)
    \RequirePackage[footmarkoff]{biblatex-chicago}
    \RequirePackage[endnotes]{semantic-markup}
    \RequirePackage{etoolbox}
    % Indent endnotes and style non-superscript
    \patchcmd{\enoteformat}{1.8em}{0.5in}{}{}
    \patchcmd{\theendnotes}
        {\makeatletter}
        {\makeatletter\renewcommand\makeenmark{\theenmark.\ }}
        {}{}
\else
    \RequirePackage{biblatex-chicago}
    \RequirePackage{semantic-markup}
\fi

\ifms
    \ifendshift
    \else
        % Do this if ms=true and endshift=false
        \renewcommand\@makefntext[1]{% 
            \setlength\parindent{0.5in}% 
            \noindent\makebox[0.5in][r]{\@thefnmark.\,\,}#1%
        }
        \fi
\fi



%***********************************************************************
\addbibresource{master.bib}

\RequirePackage[defaultlines=2,all]{nowidow}

\RequirePackage{booktabs}
\RequirePackage{tabulary}
\RequirePackage{longtable}
\RequirePackage[normalem]{ulem}

\RequirePackage{poemtranslation}
\RequirePackage{octave}
\RequirePackage{musicography}



\RequirePackage{standalone}
\standaloneconfig{%
    obeyclassoptions,
    mode=buildnew,
    build={latexoptions={
        -shell-escape -output-dir=aux 
        -jobname \quote \buildjobname \quote }}
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

\RequirePackage[noabbrev]{cleveref}
\crefname{musicexample}{music example}{music examples}
\crefname{poemexample}{poem example}{poem examples}

\RequirePackage{graphicx}
\graphicspath{ 
    {img/music-examples/} 
    {img/figures/} 
}

\newcommand{\floatfontsize}{\small}

\newenvironment{floatContents}
{\setlength{\RaggedRightParindent}{0pt}
 \begin{center}}
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
        \includestandalone{poem-examples/#1}
    \end{floatContents}
}

\newcommand{\includeTable}[1]{%
    \begin{floatContents}
        \includestandalone{tables/#1}
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

\newenvironment{epigraph}
{\begin{flushright}
 \begin{tabular}{l}}
{\end{tabular}
 \end{flushright}}



\newcommand{\wtitle}{\worktitle}
\newcommand{\ptitle}{\parttitle}

\newcommand{\range}     [2]{#1.~#2}
\newcommand{\measure}   [1]{\range{m}{#1}}
\newcommand{\measures}  [1]{\range{mm}{#1}}
\newcommand{\poemline}  [1]{\range{l}{#1}}
\newcommand{\poemlines} [1]{\range{ll}{#1}}
\newcommand{\itemnum}   [1]{\range{no}{#1}}
\newcommand{\pagenum}   [1]{\range{p}{#1}}
\newcommand{\pagenums}  [1]{\range{pp}{#1}}

\newcommand{\sv}        [1]{s.v.~\mentioned{#1}}
\newcommand{\addorig}   [1]{\add{\foreign{#1}}}
\newcommand{\sig}       [2]{\mbox{#1}: \mbox{#2}} % archival signature
\newcommand{\speaker}   [1]{\textsc{#1}: }
\newcommand{\et}{\&}


\endinput
