\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{vcbook}[2018/05/10 Andrew Cashner's book on villancicos]
\LoadClass{book}

\RequirePackage[utf8]{inputenc}
\frenchspacing
\raggedbottom
\RequirePackage{geometry}
\RequirePackage{booktabs}
\RequirePackage{fnpos}

\RequirePackage{biblatex-chicago}
\addbibresource{master.bib}

\RequirePackage{semantic-markup}
\RequirePackage{poemtranslation}
\RequirePackage{octave}

\newcommand{\wtitle}{\worktitle}
\newcommand{\ptitle}{\parttitle}

\newcommand{\range}     [2]{#1.~#2}
\newcommand{\measure}   [1]{\range{m}{#1}}
\newcommand{\measures}  [1]{\range{mm}{#1}}
\newcommand{\poemline}  [1]{\range{l}{#1}}
\newcommand{\poemlines} [1]{\range{ll}{#1}}

\newcommand{\sv}        [1]{s.v.~\mentioned{#1}}
\newcommand{\addorig}   [1]{\add{\foreign{#1}}}

\newcommand{\et}{\&}


% inline poems and translation in parallel columns
\newenvironment{quotepoem}
{\begin{quote}\small \begin{tabular}{ll}}
{\end{tabular} \end{quote}}

% new floats
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

\newcommand{\inputpoem}[1]{%
    {\small\input{poem-examples/#1}}%
}

\RequirePackage{graphicx}
\graphicspath{ 
    {img/music-examples/} 
    {img/figures/} 
}

\newcommand{\includeWideGraphic}[1]{%
    \includegraphics
    [width=\textwidth,height=0.75\textheight,keepaspectratio]{#1}%
}

\endinput
