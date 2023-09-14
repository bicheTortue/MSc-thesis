# building tool
TEX = pdflatex
BIB = bibtex
# OUTPUT = template1
OUTPUT=$(shell basename ${PWD})

OPTIONS = -shell-escape -halt-on-error

panel:
	latexmk -pvc -f -pdf -jobname=${OUTPUT} -output-directory=.. -pdflatex='pdflatex ${OPTIONS}' -interaction=nonstopmode -synctex=1 main.tex

compile:
	latexmk -f -pdf -jobname=${OUTPUT} -output-directory=.. -pdflatex='pdflatex ${OPTIONS}' -interaction=nonstopmode -synctex=1 main.tex

pdf: compile clean

clean:
	git clean -Xdf ..

cleanAll: clean
	rm -f ../${OUTPUT}.pdf

