# Hearing Faith: Music as Theology in the Spanish Empire

| Monograph by Andrew A. Cashner
| Brill Series in the History of Christian Traditions
| Copyright © 2020 Andrew A. Cashner

| Assistant professor of music
| College Department of Music
| University of Rochester
| `acashner@ur.rochester.edu`


## Requirements

- [LaTeX, Full TeXLive 2019 distribution](http://www.tug.org)
- [Lilypond, Version 2.19+](http://www.lilypond.org)
- [Brill font](https://brill.com/page/1228?lang=en)
- Linux utilities: BASH shell, GNU Make:
  I am using [Fedora 31](https://getfedora.org/)

## Installation

Clone the Git repository to a local directory:

````
git clone git@bitbucket.org:andrewacashner/vcbook.git
````

## Compilation (LaTeX -> PDF)

The Makefile compiles each music example as a separate cropped PDF using
Lilypond and stores these in `build/music-examples`.
It copies the figures into `build/figures`.

Then it compiles the whole document using LaTeX including all chapters and
included floats (tables, poem examples, diagrams) and stores the result in
`build`.

All necessary configuration files for LaTeX and Lilypond are included in the
`tex/` and `ly/` directories, respectively.

1. Start fresh: `make reset`
2. Compile whole document including separately compiled floats: `make`
  (`make -B -j4` to quickly recompile everything with 4 processor cores)
  - To compile the Lilypond PDFs only, `make ly`.
3. Count words: `make count`
4. View PDF: `make view`

## Components

The master file is `main.tex`, and it includes the full outline of parts and
chapters.

Table of contents, lists of floats, bibliography, and index are automatically
generated by LaTeX.
 
## History

### Dissertation 

------------    -----------------------------------------------
2011-09-11      First draft of dissertation proposal in Hegewisch, Chicago, IL
2012-01-12      Dissertation proposal defended
2012-06         Archival research in Puebla and Mexico City
2012-11         Archival research in Barcelona, Montserrat, Madrid, Escorial, Segovia
2012-11-21      Began dissertation writing (on Gutiérrez de Padilla)
                in Hyde Park, Chicago, IL
2013-01-24      Began Segovia chapter
2013-02-08      Began Zaragoza chapter
2014-01-18      Began intro chapter
2014-02-12      Began Puebla chapter
2014-06-30      Began theology chapter on ACLS/Mellon Diss. Completion Fellowship
2015-03-18      Dissertation defended at University of Chicago
------------    -----------------------------------------------

### Monograph

------------    -----------------------------------------------
2015-08         Began book manuscript (in TEI XML) in Los Angeles, CA
2016-08-31      Began ch 2 revision 
2017-05-01      Began ch 3 revision in Montrose, CA
2017-01-27      Book proposal with ch 2 to University of California Press
2017-11-13      Converted to Markdown in Rochester, NY
2018-02-14      Ch 2 presented in UR Humanities Center Work-in-Progress Session
2018-04-10      Ch 3 presented to UR Grupo working group
2018-05-16      Converted back to LaTeX
2018-06-01      Proposal with ch 2-3 sent to Bob Kendrick
2018-06-12      Began ch 4 revision
2018-07-24      Book proposal with ch 2-3 sent to Univ. of California Press
2018-11         Proposal turned down by UC Press
2019-04-17      New proposals with ch 2-3 sent to Brill, Oxford, Princeton, 
                Yale, Toronto, Reichenberger
2019-04-18      Finishing ch 4 revision
2019-05         Accepted advance contract from Brill, 2019-12-01 deadline
2019-05-28      Begin revising ch 5
2019-07-08      Begin new ch 1
2019-08-09      Draft complete, begin cutting and revising whole book
2019-09-16      Complete draft sent to Brill for peer review
2019-12-27      Manuscript accepted by Brill without required revisions
2020-02-10      Submitted to Brill for publication
------------    -----------------------------------------------



