# building tool
TEX = pdflatex
BIB = bibtex
NAME = thesis


#OPTIONS = -shell-escape -halt-on-error
OPTIONS = -shell-escape -interaction nonstopmode

${NAME}.pdf: compile clean

compile: *.tex
	-${TEX} ${OPTIONS} ${NAME}.tex
	${BIB} ${NAME}
	-${TEX} ${OPTIONS} ${NAME}.tex
	-${TEX} ${OPTIONS} ${NAME}.tex
	evince ${NAME}.pdf &

clean:
	rm -f *.aux
	rm -f *.toc
	rm -f *.blg
	rm -f *.log
	rm -f *.los
	rm -f *.lof
	rm -f *.lot
	rm -f *.maf
	rm -f *.out
	rm -f *.bbl
	rm -f *.mlt*
	rm -f *.mlf*
	rm -f *.mtc*
	rm -rf svg-inkscape

cleanAll: clean
	rm -f ${NAME}.pdf

diapos:
	cd diapo; make

# dummy targets
.PHONY: all clean
