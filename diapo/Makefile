# building tool
TEX = pdflatex
BIB = bibtex
NAME = thesis

#OPTIONS = -shell-escape -halt-on-error
OPTIONS = -shell-escape -interaction nonstopmode

diapos:
	find . -maxdepth 1 -type d \( ! -name . \) -exec bash -c "cd '{}' && make pdf" \;

clean:
	find . -maxdepth 1 -type d \( ! -name . \) -exec bash -c "cd '{}' && make clean" \;

