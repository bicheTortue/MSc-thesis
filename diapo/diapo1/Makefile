# building tool
TEX = pdflatex
BIB = bibtex
# OUTPUT = template1
OUTPUT=$(shell basename ${PWD})

OPTIONS = -shell-escape -halt-on-error -jobname=${OUTPUT} -output-directory=..

panel: pdf
	evince ../${OUTPUT}.pdf &

pdf: compile clean

compile:
	-${TEX} ${OPTIONS} main.tex
	#${BIB} ../${OUTPUT} # Maybe in later update
	-${TEX} ${OPTIONS} main.tex
	-${TEX} ${OPTIONS} main.tex

clean:
	rm -f ../${OUTPUT}.aux
	rm -f ../${OUTPUT}.nav
	rm -f ../${OUTPUT}.snm
	rm -f ../${OUTPUT}.toc
	rm -f ../${OUTPUT}.blg
	rm -f ../${OUTPUT}.log
	rm -f ../${OUTPUT}.los
	rm -f ../${OUTPUT}.lof
	rm -f ../${OUTPUT}.lot
	rm -f ../${OUTPUT}.maf
	rm -f ../${OUTPUT}.out
	rm -f ../${OUTPUT}.bbl
	rm -f ../${OUTPUT}.mlt*
	rm -f ../${OUTPUT}.mlf*
	rm -f ../${OUTPUT}.mtc*
	rm -rf ../svg-inkscape
	rm -rf svg-inkscape

cleanAll: clean
	rm -f ../${OUTPUT}.pdf

