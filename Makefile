# Build Tools
MP     = mpost
TEX    = latex
BIB    = bibtex
DVIPDF = dvipdf

# Project Specifics
PROJECT  = syde460final
DIAGRAMS = 

default: $(PROJECT).pdf

rebuild: clean $(PROJECT).pdf

diagrams: $(DIAGRAMS)

.SUFFIXES: .pdf .mp .1 .bib .bbl

%.pdf: %.dvi
	$(DVIPDF) $<

%.1: %.mp
	$(MP) $<

$(PROJECT).dvi: $(DIAGRAMS) $(PROJECT).tex $(PROJECT).bib
	$(TEX) $(PROJECT)
	$(BIB) $(PROJECT)
	$(TEX) $(PROJECT)
	$(TEX) $(PROJECT)

clean:
	rm -f *.dvi *.pdf *.1 *.aux *.log *.mpx *.bbl *.blg *.toc

