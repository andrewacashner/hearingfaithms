\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{tex/vcbook}[2020/02/10
Andrew Cashner's book on villancicos for Brill]
% Compile with XeLaTeX

\ProcessOptions\relax
\LoadClass{memoir}

% CUSTOM COMMANDS
\RequirePackage{xparse}         % Improved command programming
\RequirePackage{tex/vcbook-macros}  % Custom package for semantic markup

% TYPEFACE
\RequirePackage{fontspec}  % Use True-Type Unicode font
\setmainfont{Brill}
\RequirePackage{mathastext} % Use same font for math-mode numbers

\RequirePackage{url}
\urlstyle{same} % Same face for URLs
\RequirePackage{microtype}
\feetbelowfloat
\raggedbottom

% LANGUAGE, HYPHENATION
\RequirePackage{polyglossia}
\setdefaultlanguage[variant=american]{english}
\setotherlanguage{spanish}

% BIBLIOGRAPHY
% Chicago notes-bibliography style with automatic hyphenation by language
\RequirePackage[autolang=hyphen]{biblatex-chicago}
\addbibresource{tex/master.bib} % My bibliography

% CAPTION FORMAT 
\captiondelim{.\enspace} % separate label and text with period and space

% FOOTNOTE FORMAT
\footmarkstyle{#1.\,} % No superscript footnote number marks (= Chicago style)

% FLOATS
% Create new environments for music examples, poem examples, diagrams
% Using commands from memoir class 
\RequirePackage{graphicx}
\RequirePackage{adjustbox}
\RequirePackage{quoting}
\RequirePackage{longtable}

% Command to create all needed elements for a new float type
% #1 environment command name
% #2 file extension for storing float info
% #3 name of float to be used in labels
% #5 string used in title of list of floats
\NewDocumentCommand{\@NewFloatAndList}{ m m m m }{%
    \newfloat[chapter]{#1}{#2}{#3}        % New float type
    \newlistof{listof#1s}{#2}{List of #4} % New TOC list entry type
    \newlistentry{#1}{#2}{0}              % Initialize TOC list
}

% Create the float types
\let\poemtitle\relax % Memoir already defined this command
\@NewFloatAndList{musicexample} {mus}  {Music example} {Music Examples}
\@NewFloatAndList{poemexample}  {poem} {Poem example}  {Poem Examples}
\@NewFloatAndList{diagram}      {dia}  {Diagram}       {Diagrams}

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
\@NewRefCommand{part}{part}         {Part}{Part}
\@NewRefCommand{chap}{chapter}      {Chap}{Chapter}
\@NewRefCommand{sec}{section}       {Sec}{Section}
\@NewRefCommand{note}{note}         {Note}{Note}
\@NewRefCommand{fig}{figure}        {Fig}{Figure}
\@NewRefCommand{tab}{table}         {Tab}{Table}
\@NewRefCommand{mus}{music example} {Mus}{Music example}
\@NewRefCommand{poem}{poem example} {Poem}{Poem example}
\@NewRefCommand{dia}{diagram}       {Dia}{Diagram}

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
            \includegraphics{#4/##1}
        \end{#2}%
    }%
}

% Set defaults for graphics commands used in above command
% Graphics size: Width and height can be as large as \textwidth and the
% \textheight minus enough room for the caption and some text at the bottom of
% the page
\newlength{\figureheight}
\setlength{\figureheight}{\dimexpr\textheight-10\baselineskip}
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
\RequirePackage[normalem]{ulem}

% Set up and use lining figures for all tables and diagrams
\NewDocumentCommand{\liningfigures}{}{%
    \addfontfeatures{Numbers={Lining}}%
}
\RequirePackage{etoolbox}
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
% Reduced size for floats
\setfloatadjustment{figure}         {\centering}
\setfloatadjustment{table}          {\footnotesize\centering}
\setfloatadjustment{poemexample}    {\footnotesize}

% OTHER PACKAGES NEEDED FOR FLOATS
% For all poem examples
\RequirePackage{tex/poemtranslation} 
% For diagrams
\RequirePackage{tex/solfa} 
\RequirePackage{tex/cosmos}
\RequirePackage{tikz-qtree}
\endinput
