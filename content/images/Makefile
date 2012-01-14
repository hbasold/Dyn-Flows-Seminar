OBJDIR=$(working_dir)

SOURCES = $(wildcard *.svg)
OBJECTS = $(patsubst %.svg, %.pdf, $(SOURCES))

PDF_OBJECTS = $(addprefix $(OBJDIR)/, $(patsubst %.svg, %.pdf, $(SOURCES)))
EPS_OBJECTS = $(addprefix $(OBJDIR)/, $(patsubst %.svg, %.eps, $(SOURCES)))

default: pdf eps

pdf: $(PDF_OBJECTS)
eps: $(EPS_OBJECTS)

$(OBJDIR)/%.pdf: %.svg
	inkscape --export-area-drawing --export-pdf=$@ $<

$(OBJDIR)/%.eps: %.svg
	inkscape --export-area-drawing --export-eps=$@ $<
clean:
	rm -f $(OBJECTS)

.PHONY: default pdf eps clean

