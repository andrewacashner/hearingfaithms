% Custom class for villancico book, based on memoir
\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{vcbook}[2015/08/29 Cashner custom class for villancico book]
\LoadClassWithOptions{memoir}

%%% PACKAGES %%%
%% Font and general typesetting
\RequirePackage{lmodern}
\RequirePackage[T1]{fontenc}
\RequirePackage[utf8]{inputenc}
\RequirePackage{microtype}
%% Localization
\RequirePackage[american]{babel}
\RequirePackage{csquotes}

%% Bibliography
\RequirePackage[notes,backend=biber]{biblatex-chicago}
\addbibresource{master.bib}

%% For custom formats
\RequirePackage{multicol}

%%% FLOATS %%%
%% Musical Example floats
\newcommand{\musicexamplename}{Music example}
\newcommand{\listmusicexamplename}{List of Music Examples}
\newlistof{listofmusicexamples}{lom}{\listmusicexamplename}
\newfloat{musicexample}{lom}{\musicexamplename}
\newlistentry{musicexample}{lom}{0}
\newcommand{\musicexamplerefname}{Music example}
\newcommand{\musicref}[1]{\musicexamplerefname~\ref{#1}}

%% Poem Example floats
\newcommand{\poemexamplename}{Poetry example}
\newcommand{\listpoemexamplename}{List of Poetry Examples}
\newlistof{listofpoemexamples}{lop}{\listpoemexamplename}
\newfloat{poemexample}{lop}{\poemexamplename}
\newlistentry{poemexample}{lop}{0}
\newcommand{\poemexamplerefname}{Poetry example}
\newcommand{\poemref}[1]{\poemexamplerefname~\ref{#1}}

%%% ENVIRONMENTS %%%
%% Text & translation in parallel columns
\newenvironment{texttranslation}
  {\begin{multicols}{2}} % from multicol
  {\end{multicols}}
\newenvironment{original}
  {\obeylines} 
  {\columnbreak}
\newenvironment{translation}
  {\obeylines}
  {}

%% Input floats from external files
\newcommand{\poemexamplepath}{poem_examples}
\newcommand{\inputpoemexample}[1]{%
  \input{\poemexamplepath/#1}%
}

%%% GRAPHICS
%% Musical score graphics
\newcommand{\musicexamplepath}{music_examples}
\newcommand{\includescore}[1]{%
  \includegraphics[\width=\linewidth]{\musicexamplepath/#1}%
}

%%% SEMANTIC MARKUP %%%
%% TEI-style aliases
\let\term\emph
\let\mentioned\emph
\let\foreign\emph
\let\worktitle\emph
\let\parttitle\enquote % from csquotes
\let\socalled\enquote
%% Music accidentals
\newcommand{\fl}{$\flat$}
\newcommand{\sh}{$\sharp$}
\newcommand{\na}{$\natural$}

\endinput
