# building tool
TEX = pdflatex
BIB = bibtex
NAME = thesis


OPTIONS = -shell-escape #-halt-on-error

${NAME}.pdf: *.tex ?.*/
	${TEX} ${OPTIONS} ${NAME}.tex
	${BIB} ${NAME}
	${TEX} ${OPTIONS} ${NAME}.tex
	${TEX} ${OPTIONS} ${NAME}.tex
	evince ${NAME}.pdf &

clean:
	rm -f ${NAME}.pdf
	rm -f *.aux
	rm -f *.toc
	rm -f *.blg
	rm -f *.log
	rm -f *.bbl
	rm -f *.mlt*
	rm -f *.mlf*
	rm -f *.mtc*
	rm -f diagrams/*.bkp
	rm -f chapters/*.aux
	rm -rf svg-inkscape

# dummy targets
.PHONY: all clean
