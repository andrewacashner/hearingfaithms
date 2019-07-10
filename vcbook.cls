{\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{vcbook}[2019/06/24 
Andrew Cashner's book on villancicos, typescript style text with camera-ready
floats]

\newif\ifmanuscript
\manuscriptfalse
\DeclareOption{ms}{\manuscripttrue}
\ProcessOptions\relax

\ifmanuscript
\LoadClass{vcbook-manuscript} % Custom class for simple typescript style
\else
\LoadClass{memoir}
\fi


% CUSTOM COMMANDS
\RequirePackage{xparse}         % Improved command programming
\RequirePackage{vcbook-macros}  % Custom package for semantic markup

\RequirePackage{memoir-subtitle} % Add subtitle to memoir class

% TYPEFACE
\RequirePackage{fontspec}
\setmainfont{Brill}

\RequirePackage{url}
\urlstyle{same} % Same face for URLs
\RequirePackage{microtype}

% LANGUAGE, HYPHENATION
\RequirePackage{polyglossia}
\setdefaultlanguage[variant=american]{english}
\setotherlanguage{spanish}

% BIBLIOGRAPHY
% Chicago notes-bibliography style with automatic hyphenation by language
\RequirePackage[autolang=hyphen]{biblatex-chicago}
\addbibresource{master.bib} % My bibliography

% FLOATS
% Create new environments for music examples, poem examples, diagrams
% Using commands from memoir class and cleveref
\RequirePackage[noabbrev]{cleveref}

% Command to create all needed elements for a new float type
% #1 environment command name
% #2 file extension for storing float info
% #3 name of float to be used in labels
% #5 string used in title of list of floats
\NewDocumentCommand{\@NewFloatAndList}{ m m m m }{%
    \newfloat[chapter]{#1}{#2}{#3}        % New float type
    \newlistof{listof#1s}{#2}{List of #4} % New TOC list entry type
    \newlistentry{#1}{#2}{0}              % Initialize TOC list
    \crefname{#1}{#3}{#3s}                % New auto cross-references
}

% Create the float types
\@NewFloatAndList{musicexample} {mux} {Music example} {Music Examples}
\@NewFloatAndList{poemexample}  {pox} {Poem example}  {Poem Examples}
\@NewFloatAndList{diagram}      {dia} {Diagram}       {Diagrams}

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

% Floats (tables, music examples, diagrams) have smaller textblock size so they
% can be camera-ready for publication print layout
\newlength{\floatwidth}
\newlength{\floatheight}
\setlength{\floatwidth}{\textwidth} % {12.5cm}
\setlength{\floatheight}{\dimexpr\textheight-6\baselineskip} % {15cm}

% Adjust float image to no larger than full page with room for caption;
% do not adjust if it already fits
\RequirePackage{adjustbox}
\NewDocumentCommand{\@includeFloatPDF}{ m }{%
    \centerfloat
    \adjincludegraphics[ 
    max width=\floatwidth,
    max height=\floatheight,
    keepaspectratio
    ]{#1}%
}

% Command to create commands for inserting float types
% [!t] command ensures placement at top of page
% #1 Command to insert float type (e.g., insertTable)
% #2 name of float type (defined above)
% #3 abbreviation used in label prefix (e.g., tab)
\NewDocumentCommand{\@NewFloatCmd}{ m m m }{%
    \expandafter\NewDocumentCommand\csname#1\endcsname{ m m }{%
        % ##1 file basename = label basename
        % ##2 caption text
        \begin{#2}[!t]
            \caption{##2}
            \label{#3:##1}
            \@includeFloatPDF{##1}
        \end{#2}%
    }%
}

% Now create the commands
\@NewFloatCmd{insertTable}   {table}        {tab}
\@NewFloatCmd{insertPoem}    {poemexample}  {poem}
\@NewFloatCmd{insertMusic}   {musicexample} {mux}
\@NewFloatCmd{insertFigure}  {figure}       {fig}
\@NewFloatCmd{insertDiagram} {diagram}      {dia}


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

\endinput
