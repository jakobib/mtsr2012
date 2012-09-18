SLIDETEMPLATE=--template templates/slides.tex -V template:Madrid -V colortheme:dolphin

ABSTRACT=$(shell cat abstract)
KEYWORDS=$(shell cat keywords)

PAPERTEMPLATE=--template templates/htmlpaper.html --css templates/htmlpaper.css -V abstract:'${ABSTRACT}' -V keywords:'${KEYWORDS}'

pdfslides:
	@rm -f tmp.*
	pandoc slides.md --slide-level 2 --toc -t beamer -o tmp.tex ${SLIDETEMPLATE} 
	@perl -p -i -e 's/^\\caption{}//' tmp.tex
	@pdflatex tmp.tex > /dev/null
	@pdflatex tmp.tex > /dev/null
	@mv tmp.pdf slides.pdf

htmlpaper:
	@pandoc -N paper.md -o paper.html ${PAPERTEMPLATE}

