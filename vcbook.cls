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

\RequirePackage{vcbook-format}
\RequirePackage{vcbook-macros}

% TABLES

% SECTION & TOC NUMBERING
\setcounter{secnumdepth}{1}
\setcounter{tocdepth}{2}

% PAGE NUMBERING
% No number on part pages (use empty page style, not plain)
\RequirePackage{etoolbox}
\patchcmd{\part}
{\thispagestyle{plain}}{\thispagestyle{empty}}{}{}

% BIBLIOGRAPHY
\RequirePackage[autolang=none]{biblatex-chicago}
\addbibresource{master.bib}

% FLOATS
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
    {\begin{center}}
    {\end{center}}

% All floats are compiled via Makefile from separate LaTeX or Lilypond
% files, cropped, and placed in subdirectories under build/
% So we just need to include the PDF
\RequirePackage{graphicx}
\graphicspath{ 
    {build/diagrams/}
    {build/figures/}
    {build/music-examples/} 
    {build/poem-examples/}
    {build/tables/}
}
\RequirePackage{adjustbox}

% Adjust float image to no larger than full page with room for caption;
% do not adjust if it already fits
\NewDocumentCommand{\@includeFloatPDF}{ m }{%
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

\NewDocumentCommand{\@insertFloat}{ m m m m }{%
    \begingroup
    \def\@id{\detokenize{#3}}
    \begin{#1}[!t]
        \caption{#4}
        \label{#2:\@id}
        \ifdraft
            \fbox{Insert #1 (\@id)}\centering
        \else
            \@includeFloatPDF{\@id}
        \fi
    \end{#1}
    \endgroup
}

\NewDocumentCommand{\insertTable}{ m m }{%
    \@insertFloat{table}{tab}{#1}{#2}%
}
\NewDocumentCommand{\insertPoem}{ m m }{%
    \@insertFloat{poemexample}{poem}{#1}{#2}%
}
\NewDocumentCommand{\insertMusic}{ m m }{%
    \@insertFloat{musicexample}{mux}{#1}{#2}%
}
\NewDocumentCommand{\insertFigure}{ m m }{%
    \@insertFloat{figure}{fig}{#1}{#2}%
}
\NewDocumentCommand{\insertDiagram}{ m m }{%
    \@insertFloat{diagram}{dia}{#1}{#2}%
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

\RequirePackage{longtable}
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
    \def\wtitle#1{\emph{#1}}
}

\RequirePackage[numbered]{bookmark}

% AUTOMATIC CROSS-REFERENCES (must be loaded after hyperref)
\RequirePackage[noabbrev]{cleveref}
\crefname{musicexample}{music example}{music examples}
\crefname{poemexample}{poem example}{poem examples}
\crefname{diagram}{diagram}{diagrams}

% \let\oldtableofcontents\tableofcontents
% \RenewDocumentCommand{\tableofcontents}{}{%
%     \hypersetup{pageanchor=true}
%     \oldtableofcontents
% }

\endinput
