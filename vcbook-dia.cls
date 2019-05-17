\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{vcbook-dia}[2019/05/17 Diagrams for villancico book]
\LoadClass{article}

\RequirePackage{xparse}

\RequirePackage[textwidth=5.5in]{geometry}

\RequirePackage{fontspec}
\setmainfont{Brill}
\RequirePackage{mathastext}

\NewDocumentCommand{\liningfigures}{}{\addfontfeatures{Numbers={Lining}}}
\RequirePackage{etoolbox}
\AtBeginEnvironment{tikzpicture}{\liningfigures}

\setlength{\parindent}{0pt}
\pagestyle{empty}
\AtBeginDocument{\footnotesize}
\endinput
