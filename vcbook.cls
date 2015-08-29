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

%%% ENVIRONMENTS %%%
%% Poem text & translation in parallel columns
\newenvironment{poemtranslation}
  {\begin{multicols}{2}} % from multicol
  {\end{multicols}}
\newenvironment{original}
  {\obeylines}
  {\columnbreak}
\newenvironment{translation}
  {\obeylines}
  {\columnbreak}

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