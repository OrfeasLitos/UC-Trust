all: what_is_trust.pdf

#.ONESHELL:
what_is_trust.pdf: src/*
	if [ -e dot2tex ]; then rm -r dot2tex; fi
	mkdir dot2tex;
	export TEXINPUTS=.:./src//:; \
	pdflatex --shell-escape what_is_trust.tex; \
	bibtex what_is_trust.aux; \
	pdflatex --shell-escape what_is_trust.tex; \
	pdflatex --shell-escape what_is_trust.tex; \
	rm -rf what_is_trust.aux what_is_trust.log what_is_trust.out what_is_trust.toc what_is_trust.lof what_is_trust.lot what_is_trust.bbl what_is_trust.blg
	-mv dot2tex/*.tex src/figures/
	rm -r dot2tex

clean:
	rm -rf *.aux *.log *.out *.toc *.lof *.lot *.bbl *.blg *.pdf
