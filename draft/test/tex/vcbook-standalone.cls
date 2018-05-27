\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{vcbook}[2018/05/21 Andrew Cashner's book on villancicos]

\newif\ifendshift
\endshiftfalse
\DeclareOption{endshift}{\endshifttrue}
\ProcessOptions\relax

\LoadClass[12pt,oneside]{book}

\RequirePackage{libertine}
\RequirePackage[libertine]{newtxmath}
\RequirePackage[utf8]{inputenc}
\RequirePackage[T1]{fontenc}
\RequirePackage{microtype}
\RequirePackage{url}
\urlstyle{same}

\frenchspacing
\raggedbottom

\setcounter{secnumdepth}{1}
\setcounter{tocdepth}{1}

%***********************************************************************
\RequirePackage[margin=1in]{geometry}
\RequirePackage[doublespacing]{setspace}
\RequirePackage[bigger]{musicography}

\RequirePackage[none]{hyphenat}
\RequirePackage[document]{ragged2e}
\setlength{\RaggedRightParindent}{0.5in}
\sloppy
\hbadness=10000

\RequirePackage{fancyhdr}
\fancyhf{}
\fancyhead[LO]{Cashner, \emph{Hearing Faith}, DRAFT}
\fancyhead[RO]{\thepage}
\setlength{\headheight}{16pt}
\pagestyle{fancy}

\RequirePackage{etoolbox}
\patchcmd{\part}
{\thispagestyle{plain}}{\thispagestyle{empty}}{}{}% Use empty page style, not plain


\ifendshift
    % These options shift footnotes to endnotes and put floats at the end
    \RequirePackage[footmarkoff,autolang=none]{biblatex-chicago}
    \RequirePackage[endnotes]{semantic-markup}
    % Indent endnotes and style non-superscript
    \patchcmd{\enoteformat}{1.8em}{0.5in}{}{}
    \patchcmd{\theendnotes}
        {\makeatletter}
        {\makeatletter\renewcommand\makeenmark{\theenmark.\ }}
        {}{}
    \RequirePackage{morewrites}
    \RequirePackage[nolists]{endfloat}
\else
    \RequirePackage[autolang=none]{biblatex-chicago}
    \RequirePackage{semantic-markup}
    \renewcommand\@makefntext[1]{% 
        \setlength\parindent{0.5in}% 
        \noindent\makebox[0.5in][r]{\@thefnmark.\,\,}#1%
    }
    \RequirePackage{fnpos}
\fi


%***********************************************************************

\RequirePackage{booktabs}
\RequirePackage{tabulary}
\RequirePackage{longtable}
\RequirePackage[normalem]{ulem}
\RequirePackage[defaultlines=2,all]{nowidow}

\RequirePackage{poemtranslation}
\RequirePackage{octave}

\RequirePackage{standalone}
\standaloneconfig{%
     obeyclassoptions,
     mode=buildnew,
     build={latexoptions={
         -shell-escape -output-dir=aux 
         -jobname \quote \buildjobname \quote }}
}

\RequirePackage{graphicx}
\graphicspath{ 
    {img/music-examples/} 
    {img/figures/} 
}

\RequirePackage{newfloat}


\addbibresource{master.bib}

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

\ifendshift
    \DeclareDelayedFloat{musicexample}{Music Examples}
    \SetupDelayedFloat{musicexample}{list=false}

    \DeclareDelayedFloat{poemexample}{Poem Examples}
    \SetupDelayedFloat{poemexample}{list=false}
\fi



\newenvironment{floatContents}
{\begin{center}}
{\end{center}}

\newcommand{\includeFigure}[1]{%
    \begin{floatContents}
    \includegraphics[
        width=\linewidth,
        height=\dimexpr\textheight-6\baselineskip,
        keepaspectratio
    ]{#1}
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

\newcommand{\includeChapter}[1]{%
    \include{chapters/#1}%
}
\newcommand{\includeonlyChapter}[1]{%
    \includeonly{chapters/#1}%
}

% inline poems and translation in parallel columns
\RequirePackage{quoting}
\newcommand{\quotepoemfont}{\small}

\newenvironment{quotepoemContents}
{\quotepoemfont
 \quotingsetup{rightmargin=0pt}
 \begin{quoting}}
{\end{quoting}}

\newenvironment{quotepoem}
{\begin{quotepoemContents}
 \begin{tabular}{ll}}
{\end{tabular}
 \end{quotepoemContents}}

\newenvironment{quotepoemlong}
{\begin{quotepoemContents}
 \begin{longtable}{ll}}
{\end{longtable}
 \end{quotepoemContents}}

\newcommand{\epigraphTable}[1]{%
    \begin{tabular}{l}
        #1
    \end{tabular}%
}
\newcommand{\epigraphTranslation}[3]{%
    \begin{singlespacing}
        \begin{flushright}
            \begin{tabular}{l}
                {\itshape\epigraphTable{#1}}\tabularnewline
                \addlinespace
                \epigraphTable{#2}\tabularnewline
                \addlinespace 
                \epigraphTable{---#3}
            \end{tabular}
        \end{flushright}
    \end{singlespacing}\par
    \bigskip
}


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
\newcommand{\scripture} [2]{#1~#2}

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

\RequirePackage[noabbrev]{cleveref}

\crefname{musicexample}{music example}{music examples}
\crefname{poemexample}{poem example}{poem examples}

\endinput
