include make/Makefile

V_SLIDES_PDF=-V template:Madrid -V colortheme:dolphin


# This depreceated:

TSPDF=--template templates/slides.tex -V template:Madrid -V colortheme:dolphin

ABSTRACT=$(shell cat abstract)
KEYWORDS=$(shell cat keywords)

VMETA=-V abstract:'${ABSTRACT}' -V keywords:'${KEYWORDS}'

TPHTM=--template templates/htmlpaper.html --css templates/paper.css ${VMETA}
TPPDF=--template templates/paper.tex -V documentclass:llncs --include-before-body=templates/affiliation.tex ${VMETA}

# citations are not linked anyway :-(
#BIB=--bibliography=bibliography.bib --csl templates/lncs.csl
BIB=

# TODO: Use Pandoc citations and replace them to BibTeX citations for LaTeX:
#  sed 's/\[@\([^]]*\)\]/\\cite{\1}/g' # plus remove '@'

htmlpaper:
	@pandoc -N paper.md -o paper.html ${BIB} ${TPHTM}

pdfpaper: clean
	./filters/texrefs.pl paper.md | pandoc -N -t latex ${BIB} ${TPPDF} > paper.tex
	@pdflatex paper
#	@bibtex paper
	@pdflatex paper
#	@./filters/texrefs.pl paper.md | pandoc -N -o paper.pdf ${TPPDF}

paper: htmlpaper pdfpaper
