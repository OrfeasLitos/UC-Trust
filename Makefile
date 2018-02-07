all: what_is_trust.pdf

#.ONESHELL:
what_is_trust.pdf: src/*
	export TEXINPUTS=.:./src//:; \
	pdflatex what_is_trust.tex; \
	bibtex what_is_trust.aux; \
	pdflatex what_is_trust.tex; \
	pdflatex what_is_trust.tex; \
	rm -rf what_is_trust.aux what_is_trust.log what_is_trust.out what_is_trust.toc what_is_trust.lof what_is_trust.lot what_is_trust.bbl what_is_trust.blg

clean:
	rm -rf *.aux *.log *.out *.toc *.lof *.lot *.bbl *.blg *.pdf
