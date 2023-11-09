# building tool
TEX = pdflatex
BIB = bibtex
NAME = thesis


OPTIONS = -shell-escape -halt-on-error
#OPTIONS = -shell-escape -interaction nonstopmode

panel:
	latexmk -pvc -f -pdf -pdflatex='pdflatex ${OPTIONS}' -interaction=nonstopmode -synctex=1 ${NAME}.tex

compile:
	latexmk -f -pdf -pdflatex='pdflatex ${OPTIONS}' -interaction=nonstopmode -synctex=1 ${NAME}.tex

pdf: compile clean

clean:
	git clean -Xdf -e "\!*.pdf"

cleanAll:
	git clean -Xdf

diapos:
	cd diapo; make

# dummy targets
.PHONY: all clean
