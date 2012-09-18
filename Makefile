TSPDF=--template templates/slides.tex -V template:Madrid -V colortheme:dolphin

ABSTRACT=$(shell cat abstract)
KEYWORDS=$(shell cat keywords)

VMETA=-V abstract:'${ABSTRACT}' -V keywords:'${KEYWORDS}'

TPHTM=--template templates/htmlpaper.html --css templates/paper.css ${VMETA}
TPPDF=--template templates/paper.tex -V documentclass:llncs --include-before-body=templates/affiliation.tex ${VMETA}

# citations are not linked anyway :-(
#BIB=--bibliography=bibliography.bib --csl templates/lncs.csl
BIB=

pdfslides:
	@rm -f tmp.*
	pandoc slides.md --slide-level 2 --toc -t beamer -o tmp.tex ${TSPDF} 
	@perl -p -i -e 's/^\\caption{}//' tmp.tex
	@pdflatex tmp.tex > /dev/null
	@pdflatex tmp.tex > /dev/null
	@mv tmp.pdf slides.pdf

htmlpaper:
	@pandoc -N paper.md -o paper.html ${BIB} ${TPHTM}

pdfpaper: clean
	./filters/texrefs.pl paper.md | pandoc -N -t latex ${BIB} ${TPPDF} | filters/umlauts.pl > paper.tex
	@pdflatex paper
#	@bibtex paper
	@pdflatex paper
#	@./filters/texrefs.pl paper.md | pandoc -N -o paper.pdf ${TPPDF}

clean:
	@rm -f *.aux *.log *.out *.bbl *.blg

