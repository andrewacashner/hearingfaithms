# Hearing Faith: Music as Theology in the Spanish Empire

| Monograph by Andrew A. Cashner, copyright 2019
| Assistant professor of music
| College Department of Music
| University of Rochester
| `acashner@ur.rochester.edu`

## Requirements

- (LaTeX, Full TeXLive 2019 distribution)[http://www.tug.org]
- (Lilypond, Version 2.19+)[http://www.lilypond.org]
- GNU Make and command-line utilities 
  (I am using (Fedora 30)[https://getfedora.org/])
- (Brill font)[https://brill.com/page/1228?lang=en]
- (Bravura font)[https://www.smufl.org/fonts/]
- (My LaTeX repository `texmf`)[https://bitbucket.org/andrewacashner/texmf.git]
- (My Lilypond repository `ly`)[https://bitbucket.org/andrewacashner/ly.git]


### Compilation (LaTeX -> PDF)

- Start fresh: `make reset`
- Compile whole document including separately compiled floats: `make`
  (`make -B -j4` to quickly recompile everything with 4 processor cores)
- Count words: `make count`
- View PDF: `make view`

 
