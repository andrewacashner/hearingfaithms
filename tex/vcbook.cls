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
\RequirePackage{morewrites}

% Custom package for semantic markup
\RequirePackage{tex/vcbook-macros}  

% TYPEFACE
% Use True-Type Unicode font (Brill)
\RequirePackage{fontspec}           
\setmainfont{Brill}
\RequirePackage{microtype}
\frenchspacing % Single space between sentences

% Use same font for urls
\RequirePackage{url}
\urlstyle{same}

% PAGE LAYOUT
\sloppy         % Allow horizontal word spacing to be less than perfect
\raggedbottom   % Don't stretch things vertically to fill page

% Hide page numbers on \part pages
\patchcmd{\part}{\thispagestyle{plain}}{\thispagestyle{empty}}{}{}

% LANGUAGE, HYPHENATION
\RequirePackage[spanish, es-noquoting, american]{babel}
% Avoid conflict between `babel' and `quoting' package
\let\quoting\relax
\let\endquoting\relax

% BIBLIOGRAPHY
% Chicago notes-bibliography style with automatic hyphenation by language
\RequirePackage[autolang=hyphen]{biblatex-chicago}
\addbibresource{tex/master.bib} % My bibliography

% INDEX
\RequirePackage{makeidx}
\RequirePackage[totoc]{idxlayout} % Add index to table of contents

% Custom shorthands for unwieldy terms with accented characters
\input{tex/index} 

% Keep biblio, index at top level in hierarchy
\NewDocumentCommand{\mybackmatter}{}{%
    \backmatter
    \bookmarksetup{startatroot}%
}

% Use a delimited list to add multiple index entries in one command
% Split first argument at semicolons, then apply command `\index` to each one
\NewDocumentCommand{\addtoindex}{ > { \SplitList {;} } m }{%
    \ProcessList{#1}{\index}%
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
\RequirePackage{graphicx}
\RequirePackage{adjustbox}
\RequirePackage{quoting}
\RequirePackage{longtable}

\RequirePackage{newfloat}
\RequirePackage{tocloft}

% Command to create all needed elements for a new float type
% #1 environment command name
% #2 file extension for storing float info
% #3 name of float to be used in labels
% #4 string used in title of list of floats
\NewDocumentCommand{\@NewFloatAndList}{ m m m m }{%
    \DeclareFloatingEnvironment[
        fileext=#2,
        name=#3,
        listname={List of #4},
        within=chapter
    ]{#1}%
}

% Create the float types
\@NewFloatAndList{musicexample} {mus}  {Music example} {Music Examples}
\@NewFloatAndList{poemexample}  {poem} {Poem example}  {Poem Examples}
\@NewFloatAndList{diagram}      {dia}  {Diagram}       {Diagrams}
\@NewFloatAndList{map}          {map}  {Map}           {Maps}

% Command to create reference labels, uppercase and lowercase
% = substitute for cleveref
% #1 lowercase abbreviation, used in command: `fig` -> `\figref`
% #2 lowercase label
% #3 uppercase abbreviation 
% #4 uppercase label
\NewDocumentCommand{\@NewRefCommand}{ m m m m }{%
    \expandafter\NewDocumentCommand\csname#1ref\endcsname{ m }{#2~\ref{##1}}
    \expandafter\NewDocumentCommand\csname#3ref\endcsname{ m }{#4~\ref{##1}}
}

% Create the labels
\@NewRefCommand{part}   {part}          {Part}  {Part}
\@NewRefCommand{chap}   {chapter}       {Chap}  {Chapter}
\@NewRefCommand{sec}    {section}       {Sec}   {Section}
\@NewRefCommand{note}   {note}          {Note}  {Note}
\@NewRefCommand{fig}    {figure}        {Fig}   {Figure}
\@NewRefCommand{tab}    {table}         {Tab}   {Table}
\@NewRefCommand{mus}    {music example} {Mus}   {Music example}
\@NewRefCommand{poem}   {poem example}  {Poem}  {Poem example}
\@NewRefCommand{dia}    {diagram}       {Dia}   {Diagram}
\@NewRefCommand{map}    {map}           {Map}   {Map}

\NewDocumentCommand{\floatfontsize}{}{\footnotesize}

% FLOAT FORMATTING AND FILE INCLUSION
% Command to create commands for inserting TeX-generated floats 
% #1 Command to insert float type
% #2 name of float type
% #3 abbreviation used in label prefix
% #4 directory to input from
\NewDocumentCommand{\@NewTeXfloatCmd}{ m m m m }{%
    \expandafter\NewDocumentCommand\csname#1\endcsname{ m m }{%
        % ##1 file basename = label basename
        % ##2 caption text
        \begin{#2}[!t]
            \caption{##2}
            \label{#3:##1}
            \floatfontsize
            \input{#4/##1}
        \end{#2}%
    }%
}

% Same idea, now for externally-generated image files
% #1 Command to insert float type
% #2 name of float type
% #3 abbreviation used in label prefix
% #4 directory to input from
\NewDocumentCommand{\@NewIMGfloatCmd}{ m m m m }{%
    \expandafter\NewDocumentCommand\csname#1\endcsname{ m m }{%
        % ##1 file basename = label basename
        % ##2 caption text
        \begin{#2}[!t]
            \caption{##2}
            \label{#3:##1}
            \includegraphics{#4/##1}%
        \end{#2}%
    }%
}

% Set defaults for graphics commands used in above command
% Graphics size: Width and height can be as large as \textwidth and the
% \textheight minus enough room for the caption and some text at the bottom of
% the page
\newlength{\figureheight}
\setlength{\figureheight}{\dimexpr\textheight-8\baselineskip}
\setkeys{Gin}{%
    width=\textwidth,
    height=\figureheight,
    keepaspectratio
}

% Now create the float-insertion commands
% TeX floats
\@NewTeXfloatCmd{insertTable}   {table}        {tab}  {tables}
\@NewTeXfloatCmd{insertPoem}    {poemexample}  {poem} {poem-examples}
\@NewTeXfloatCmd{insertDiagram} {diagram}      {dia}  {diagrams}

% Image floats
\@NewIMGfloatCmd{insertFigure}  {figure}       {fig}  {build/figures}
\@NewIMGfloatCmd{insertMusic}   {musicexample} {mus}  {build/music-examples}
\@NewIMGfloatCmd{insertMap}     {map}          {map}  {build/maps}

% Keep Tikz graphics under maximum width by putting them in this environment
\RequirePackage{environ}
\NewEnviron{textwidthbox}{%
    \resizebox{\textwidth}{!}{\BODY}%
}

% INLINE ENVIRONMENTS
% Inline poems and translation in parallel columns
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
\NewDocumentEnvironment{quotepoemlong}{}{%
    \begin{quotepoemContents}
        \begin{longtable}{ll}%
}{% 
        \end{longtable}%
    \end{quotepoemContents}%
}

% TABLES
\RequirePackage{tabulary,tabularx}
\RequirePackage{booktabs}
\RequirePackage[normalem]{ulem} % Underlining

% Set up and use lining figures for all tables and diagrams
\NewDocumentCommand{\liningfigures}{}{%
    \addfontfeatures{Numbers={Lining}}%
}

\AtBeginEnvironment{tabular}    {\liningfigures}
\AtBeginEnvironment{tabulary}   {\liningfigures}
\AtBeginEnvironment{tabularx}   {\liningfigures}
\AtBeginEnvironment{tikzpicture}{\liningfigures}


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

% FLOAT STYLE
% Put all float captions above floats and center them
\RequirePackage[capposition=top]{floatrow} 
\DeclareFloatFont{Small}{\floatfontsize}
\floatsetup{font=Small}

% OTHER PACKAGES NEEDED FOR FLOATS
% For all poem examples
\RequirePackage{tex/poemtranslation} 
% For diagrams
\RequirePackage{tex/solfa} 
\RequirePackage{tex/cosmos}
\RequirePackage{tikz-qtree}

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
