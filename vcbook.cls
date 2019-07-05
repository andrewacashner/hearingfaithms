\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{vcbook}[2019/06/24 
Andrew Cashner's book on villancicos, typescript style text with camera-ready
floats]
\LoadClass[12pt]{memoir}

% CUSTOM FORMAT AND COMMANDS
\RequirePackage{xparse} % Improved command programming
\RequirePackage{vcbook-macros}
\NewDocumentCommand{\thebooktitle}{}{Hearing Faith}

\setlrmarginsandblock{1in}{1in}{*}
\setulmarginsandblock{1in}{1in}{*}
\checkandfixthelayout

\newlength{\floatwidth}
\newlength{\floatheight}
\setlength{\floatwidth}{12.5cm}
\setlength{\floatheight}{15cm}

\frenchspacing
\raggedbottom
\feetbelowfloat
\DoubleSpacing
\pagestyle{plain}

\RequirePackage{fontspec}
\setmainfont{Brill}

\RequirePackage{url}
\urlstyle{same}

\RequirePackage{microtype}

\RequirePackage{polyglossia}
\setdefaultlanguage[variant=american]{english}
\setotherlanguage{spanish}

% SECTION & TOC NUMBERING
\setcounter{secnumdepth}{1} % Don't number < subsections
\setcounter{tocdepth}{2}    % Don't include < subsubsections in TOC

% BIBLIOGRAPHY
% Chicago notes-bibliography style with automatic hyphenation for entries by
% language
\RequirePackage[autolang=hyphen]{biblatex-chicago}
\addbibresource{master.bib} % My bibliography

\footmarkstyle{#1.\,}

% FLOATS
% Create new environments for music examples, poem examples, diagrams
\RequirePackage{newfloat}
\NewDocumentCommand{\NewFloatAndList}{ m m m m m }{%
    \def\env{#1} 
    \def\ext{#2} 
    \def\labelname{#3}
    \def\listcmd{#4} 
    \def\listname{#5}
    \newfloat[chapter]{\env}{\ext}{\labelname}
    \newlistof{\listcmd}{\ext}{\listname}
    \newlistentry{\env}{\ext}{0}
}

\NewFloatAndList{musicexample}{mux}{Music example}
{listofmusicexamples}{List of Music Examples}

\NewFloatAndList{poemexample}{pox}{Poem example}
{listofpoemexamples}{List of Poem Examples}

\NewFloatAndList{diagram}{dia}{Diagram}
{listofdiagrams}{List of Diagrams}

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
            max width=\floatwidth,
            max height=\floatheight,
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

% HYPERLINKS
\RequirePackage[
    hidelinks,
    pdfpagelabels
]{hyperref}

% PDF metadata
\hypersetup{%
    pdfauthor={Andrew A. Cashner},
    pdftitle={Hearing Faith: Music as Theology in the Spanish Empire (DRAFT)},
    pdfsubject={%
        Music: history and interpretation, Spain, Mexico, 17th cent.;
        Religion: devotion, popular culture, Spain, Mexico, 17th cent.;
        Spanish literature: poetry (low Baroque);
        Villancicos (part songs): history and interpretation
    }%
}
% PDF bookmarks
% Use simpler formatting in bookmarks 
\pdfstringdefDisableCommands{%
    \def\quoted#1{"#1"}
    \def\wtitle#1{\emph{#1}}
    \def\term#1{\emph{#1}}
}
\RequirePackage[numbered]{bookmark}

% AUTOMATIC CROSS-REFERENCES (must be loaded after hyperref)
\RequirePackage[noabbrev]{cleveref}
\crefname{musicexample} {music example} {music examples}
\crefname{poemexample}  {poem example}  {poem examples}
\crefname{diagram}      {diagram}       {diagrams}

\endinput
