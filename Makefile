# Build Tools
MP     = mpost
TEX    = latex
BIB    = bibtex
DVIPDF = dvipdf
GLOS   = makeglossaries
IND    = makeindex

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
	$(TEX)  $(PROJECT)
	$(GLOS) $(PROJECT)
	$(BIB)  $(PROJECT)
	$(TEX)  $(PROJECT)
	$(TEX)  $(PROJECT)

clean:
	rm -f *.dvi *.pdf *.1 *.aux *.log *.mpx *.bbl *.blg *.toc *.sym *.glo *.gls *.sbl *.glg *.slg *.xdy

