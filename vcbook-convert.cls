\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{vcbook-convert}[2018/07/26 
Andrew Cashner's book on villancicos, for conversion with tex4ht]

\LoadClass{book}

\RequirePackage{xparse}

% FONT AND TYPOGRAPHY
\RequirePackage[T1]{fontenc}
\RequirePackage{url}
\urlstyle{same}
\RequirePackage{semantic-markup}
\RequirePackage{octave}

% TABLES
\RequirePackage{booktabs}
\RequirePackage{longtable}

% SECTION & TOC NUMBERING
\setcounter{secnumdepth}{1}
\setcounter{tocdepth}{2}

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

% FLOAT FORMATTING AND FILE INCLUSION
\NewDocumentEnvironment{floatContents}{}
    {\begin{center}}
    {\end{center}}

\NewDocumentCommand{\includeFloatPDF}{ m }{%
    \begin{floatContents}
        \add{Insert float \url{#1} here}
    \end{floatContents}
}

\NewDocumentCommand{\includeMusic}  {}{\includeFloatPDF}
\NewDocumentCommand{\includePoem}   {}{\includeFloatPDF}
\NewDocumentCommand{\includeTable}  {}{\includeFloatPDF}
\NewDocumentCommand{\includeFigure} {}{\includeFloatPDF}
\NewDocumentCommand{\includeBigFigure} {}{\includeFloatPDF}

\NewDocumentCommand{\includeChapter}{ m }{%
    \include{chapters/#1}%
}
\NewDocumentCommand{\includeonlyChapter}{ m }{%
    \includeonly{chapters/#1}%
}

% INLINE ENVIRONMENTS
% Inline poems and translation in parallel columns
\RequirePackage{quoting}

\NewDocumentEnvironment{quotepoemContents}{}
{\begin{quoting}}
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
        \end{flushright}\par
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

% Simple alternatives to incompatible `musicography' commands
\NewDocumentCommand{\meterC}    {}      {\textbf{C}}
\NewDocumentCommand{\meterCThree}{}     {\textbf{C3}}
\NewDocumentCommand{\meterCZ}   {}      {\textbf{CZ}}

% AUTOMATIC CROSS-REFERENCES 
\RequirePackage[noabbrev]{cleveref}
\crefname{musicexample}{music example}{music examples}
\crefname{poemexample}{poem example}{poem examples}

\endinput