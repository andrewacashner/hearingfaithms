\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{vcbook}[2018/05/21 Andrew Cashner's book on villancicos]
\LoadClass{book}

\RequirePackage{xparse} % Improved command programming
\NewDocumentCommand{\thebooktitle}{}{Hearing Faith}

% CUSTOM FORMAT AND COMMANDS
\RequirePackage{vcbook-format}
\RequirePackage{vcbook-macros}

% SECTION & TOC NUMBERING
\setcounter{secnumdepth}{1} % Don't number < subsections
\setcounter{tocdepth}{2}    % Don't include < subsubsections in table of contents

% PAGE NUMBERING
% No number on part pages (use empty page style, not plain)
\RequirePackage{etoolbox}
\patchcmd{\part} {\thispagestyle{plain}} {\thispagestyle{empty}}{}{}

% PAGE HEADINGS
\RequirePackage{titleps}
\newpagestyle{vcbook}{
    \sethead
    [\textsc{\thebooktitle}][][] % book title on left
    {}{}{\chaptertitle}          % chapter title on right
    \setfoot{}{\thepage}{}       % page number centered at bottom
}
\pagestyle{vcbook}


% BIBLIOGRAPHY
\RequirePackage[autolang=hyphen]{biblatex-chicago}
\addbibresource{master.bib}

% FLOATS
% Create new environments for music examples, poem examples, diagrams
\RequirePackage{newfloat}

\DeclareFloatingEnvironment[
    fileext=mux,
    listname={List of Music Examples},
    name={Music example},
    placement={!t},
    within=chapter,
    chapterlistsgaps=off
]{musicexample}

\DeclareFloatingEnvironment[
    fileext=pox,
    listname={List of Poem Examples},
    name={Poem example},
    placement={!t},
    within=chapter,
    chapterlistsgaps=off
]{poemexample}

\DeclareFloatingEnvironment[
    fileext=dia
    listname={List of Diagrams},
    name={Diagram},
    placement={!t},
    within=chapter,
    chapterlistsgaps=off
]{diagram}

% FLOAT FORMATTING AND FILE INCLUSION
% All floats are compiled via Makefile from separate LaTeX or Lilypond
% files, cropped, and placed in subdirectories under build/ (found automatically
% via \graphicspath; so we just need to include the PDF
\RequirePackage{graphicx}
\graphicspath{ 
    {build/diagrams/}
    {build/figures/}
    {build/music-examples/} 
    {build/poem-examples/}
    {build/tables/}
}
\RequirePackage{adjustbox}

% Internal commands
\NewDocumentEnvironment{floatContents}{}
    {\begin{center}}
    {\end{center}}

% Adjust float image to no larger than full page with room for caption;
% do not adjust if it already fits
\NewDocumentCommand{\@includeFloatPDF}{ m }{%
    \begin{floatContents}
        \adjincludegraphics[ 
            max width=\linewidth,
            max height=\dimexpr\textheight-5\baselineskip,
            keepaspectratio
        ]{#1}%
    \end{floatContents}%
}

% Generic command for inserting any float 
% #1 name of float type (defined above)
% #2 abbreviation used in label (e.g., tab, mux)
% #3 file basename = label basename
% #4 caption text
\NewDocumentCommand{\@insertFloat}{ m m m m }{%
    \begin{#1}[!t]
        \caption{#4}
        \label{#2:#3}
        \@includeFloatPDF{#3}
    \end{#1}%
}

% User commands
% #1 file basename = label basename
% #2 caption text
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

% CHAPTER INCLUSION
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

 % Poem that goes over one page
\RequirePackage{longtable}
\NewDocumentEnvironment{quotepoemlong}{}
{\begin{quotepoemContents}
 \begin{longtable}{ll}}
{\end{longtable}
 \end{quotepoemContents}}

% EPIGRAPHS
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

% PDF metadata
\hypersetup{%
    pdfauthor={Andrew A. Cashner},
    pdftitle={Hearing Faith (DRAFT)},
    pdfsubject={Music: history and interpretation, Spain, Mexico, 17th cent.;
    Religion: devotion, popular culture, Spain, Mexico, 17th cent.;
    Spanish literature: poetry (low Baroque);
    Villancicos (part songs): history and interpretation}
}
% PDF bookmarks
% Use simpler formatting in bookmarks 
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

\endinput
