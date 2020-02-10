\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{tex/vcbook}[2020/02/10
Andrew Cashner's book on villancicos for Brill]
% Compile with XeLaTeX

% Pass on any options to the class
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{book}}
\ProcessOptions\relax
\LoadClass{book}

% CUSTOM COMMANDS
\RequirePackage{xparse}             
\RequirePackage{etoolbox}

% Custom package for semantic markup
\RequirePackage{tex/vcbook-macros}  

% Custom formatting
\RequirePackage{tex/vcbook-format}

% PAGE LAYOUT
% Hide page numbers on \part pages
\patchcmd{\part}{\thispagestyle{plain}}{\thispagestyle{empty}}{}{}

% Avoid widow and orphan lines
\RequirePackage[defaultlines=4, all]{nowidow}

% LANGUAGE, HYPHENATION
% BIBLIOGRAPHY
% Chicago notes-bibliography style with automatic hyphenation by language
\RequirePackage[autolang=hyphen]{biblatex-chicago}
\addbibresource{tex/master.bib} % My bibliography

% INDEX
\RequirePackage{makeidx}
\RequirePackage[totoc]{idxlayout} % Add index to table of contents
\input{tex/index} % Custom shorthands for unwieldy terms 

% Keep biblio, index at top level in hierarchy
\NewDocumentCommand{\mybackmatter}{}{%
    \backmatter
    \bookmarksetup{startatroot}%
}

% FOOTNOTES
% Keep footnotes at bottom of page
\RequirePackage{fnpos}              

% CAPTION FORMAT 
% Separate label and text with period and space
\RequirePackage{caption}
\captionsetup{labelsep=period}

% LIST FORMAT
\RequirePackage{enumitem}
\setlist{noitemsep} % No extra space between list items

% EPIGRAPHS
\RequirePackage{epigraph}

% FLOATS
% Create new environments for music examples, poem examples, diagrams
\RequirePackage{newfloat}
\RequirePackage{tocloft}

\DeclareFloatingEnvironment[
    fileext=mus,
    name={Music example},
    listname={List of Music Examples},
    within=chapter
]{musicexample}

\DeclareFloatingEnvironment[
    fileext=poem,
    name={Poem example},
    listname={List of Poem Examples},
    within=chapter
]{poemexample}

\DeclareFloatingEnvironment[
    fileext=dia,
    name=Diagram,
    listname={List of Diagrams},
    within=chapter
]{diagram}

\DeclareFloatingEnvironment[
    fileext=map,
    name=Map,
    listname={List of Maps},
    within=chapter
]{map}

% Cross-reference labels
\NewDocumentCommand{\partref}{ m }{part~\ref{#1}}
\NewDocumentCommand{\Partref}{ m }{Part~\ref{#1}}

\NewDocumentCommand{\chapref}{ m }{chapter~\ref{#1}}
\NewDocumentCommand{\Chapref}{ m }{Chapter~\ref{#1}}

\NewDocumentCommand{\secref}{ m }{section~\ref{#1}}
\NewDocumentCommand{\Secref}{ m }{Section~\ref{#1}}

\NewDocumentCommand{\noteref}{ m }{note~\ref{#1}}
\NewDocumentCommand{\Noteref}{ m }{Note~\ref{#1}}

\NewDocumentCommand{\figref}{ m }{figure~\ref{#1}}
\NewDocumentCommand{\Figref}{ m }{Figure~\ref{#1}}

\NewDocumentCommand{\tabref}{ m }{table~\ref{#1}}
\NewDocumentCommand{\Tabref}{ m }{Table~\ref{#1}}

\NewDocumentCommand{\musref}{ m }{music example~\ref{#1}}
\NewDocumentCommand{\Musref}{ m }{Music example~\ref{#1}}

\NewDocumentCommand{\poemref}{ m }{poem example~\ref{#1}}
\NewDocumentCommand{\Poemref}{ m }{Poem example~\ref{#1}}

\NewDocumentCommand{\diaref}{ m }{diagram~\ref{#1}}
\NewDocumentCommand{\Diaref}{ m }{Diagram~\ref{#1}}

\NewDocumentCommand{\mapref}{ m }{map~\ref{#1}}
\NewDocumentCommand{\Mapref}{ m }{Map~\ref{#1}}

% Set defaults for graphics commands used in above command
% Graphics size: Width and height can be as large as \textwidth and the
% \textheight minus enough room for the caption and some text at the bottom of
% the page
\RequirePackage{graphicx}
\graphicspath{
    {build/figures/}
    {build/music-examples/}
    {build/tables/}
    {build/diagrams/}
    {build/poem-examples/}
    {build/maps/}
}

\RequirePackage{adjustbox}
\newlength{\figureheight}
\setlength{\figureheight}{\dimexpr\textheight-10\baselineskip}

\NewDocumentCommand{\includefloat}{ m }{%
        \adjincludegraphics[
                max width=\textwidth,
                max height=\figureheight,
                keepaspectratio
            ]{#1}%
}

% INLINE ENVIRONMENTS
% Inline poems and translation in parallel columns

% Avoid conflict between `babel' and `quoting' package
\let\quoting\relax
\let\endquoting\relax
\RequirePackage{quoting}

\NewDocumentCommand{\quotepoemfont}{}{\small}

\NewDocumentEnvironment{quotepoemContents}{}{%
    \quotepoemfont
    \quotingsetup{rightmargin=0pt}
    \begin{quoting}%
}{%
    \end{quoting}%
}

\NewDocumentEnvironment{quotepoem}{}{%
    \begin{quotepoemContents}
        \begin{tabular}{ll}%
}{%
        \end{tabular}%
    \end{quotepoemContents}%
}

 % Poem that goes over one page
\RequirePackage{longtable}
\NewDocumentEnvironment{quotepoemlong}{}{%
    \begin{quotepoemContents}
        \begin{longtable}{ll}%
}{% 
        \end{longtable}%
    \end{quotepoemContents}%
}

% FLOAT STYLE
% Put all float captions above floats and center them
\RequirePackage[capposition=top]{floatrow} 

% CROSS REFERENCES and LINKS
\RequirePackage[
    xetex,
    pdfencoding=auto,
    unicode=true,
    hidelinks,
    hyperfootnotes=false,
    hyperindex=false
]{hyperref}
% Set PDF metadata in document with \hypersetup

% Substitute simpler format for bookmark text
\pdfstringdefDisableCommands{%
    \def\quoted#1{"#1"}
    \let\wtitle\emph
    \let\term\emph
}

\RequirePackage[numbered]{bookmark}

\endinput
