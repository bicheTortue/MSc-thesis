# building tool
TEX = pdflatex
BIB = bibtex
NAME = thesis


OPTIONS = -shell-escape #-halt-on-error

${NAME}.pdf: *.tex 00.Definitions 0.Intro
	${TEX} ${OPTIONS} ${NAME}.tex
	${BIB} ${NAME}
	${TEX} ${OPTIONS} ${NAME}.tex
	${TEX} ${OPTIONS} ${NAME}.tex

clean:
	rm -f ${NAME}.pdf
	rm -f *.aux
	rm -f *.toc
	rm -f *.blg
	rm -f *.log
	rm -f *.bbl
	rm -f diagrams/*.bkp
	rm -f chapters/*.aux
	# dummy targets
	.PHONY: all clean
