# building tool
TEX = pdflatex
BIB = bibtex
# OUTPUT = template1
OUTPUT=$(shell basename ${PWD})

OPTIONS = -shell-escape -jobname=${OUTPUT} -output-directory=..

panel: pdf
	evince ../${OUTPUT}.pdf &

pdf: compile clean

compile:
	${TEX} ${OPTIONS} main.tex
	#${BIB} ../${OUTPUT} # Maybe in later update
	-${TEX} ${OPTIONS} main.tex
	-${TEX} ${OPTIONS} main.tex

clean:
	git clean -Xdf ..

cleanAll: clean
	rm -f ../${OUTPUT}.pdf

