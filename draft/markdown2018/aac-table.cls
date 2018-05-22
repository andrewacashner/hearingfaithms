\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{aac-table}[2018/03/27 Tables for Cashner monograph]
\LoadClass{book}
\RequirePackage{fontspec}
\setmainfont{Libertinus Serif}
\RequirePackage[hmargin=1in, vmargin=2in]{geometry}
\RequirePackage{tabulary}
\RequirePackage{booktabs}
\RequirePackage{longtable}
\RequirePackage{microtype}
\RequirePackage[document]{ragged2e}
\setlength{\RaggedRightParindent}{0pt}
\setlength{\parindent}{0pt}
\pagestyle{empty}
\RequirePackage[normalem]{ulem}
\RequirePackage{xparse}
\NewDocumentCommand{\speaker}{ m }{\textsc{#1}: }
\endinput
