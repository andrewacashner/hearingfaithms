\NeedsTeXFormat{LaTeX2e}
\ProvidesPackage{aac-poem}[2018/03/28 Poem examples for Cashner monograph]
\LoadClass[10pt]{book}

\RequirePackage{xparse}

\RequirePackage{fontspec}
\setmainfont{Libertinus Serif}

\RequirePackage[hmargin=1in,vmargin=2in]{geometry}

\RequirePackage[document]{ragged2e}
\setlength{\RaggedRightParindent}{0pt}

\setlength{\parindent}{0pt}
\frenchspacing
\pagestyle{empty}

\RequirePackage[normalem]{ulem}

\RequirePackage{semantic-markup}
\RequirePackage{poemtranslation}

\RenewDocumentCommand{\critnote}{ m o m }{#1}

\NewDocumentCommand{\speaker}{ m }{\textsc{#1}: }

