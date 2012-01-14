text = QuickestFlows
indices = indices
content = content
working_dir = build
working_file = $(working_dir)/$(text)
PDFLATEX = TEXINPUTS=:./$(working_dir):./$(indices):./$(content) pdflatex
BIBTEX = BIBINPUTS=:./$(indices) bibtex

tex_files = $(wildcard $(indices)/*.tex)
tex_files += $(wildcard $(content)/*.tex)
tex_files += $(wildcard ./*.tex)
images = $(wildcard $(content)/images/*/*.svg)
images += $(wildcard $(content)/images/*/*.dot)

default: pdf

xdvi: $(text).dvi
	xdvi $(text).dvi

gv: $(text).ps
	gv $(text).ps

acro: $(text).pdf
	acroread $(text).pdf

xpdf: $(text).pdf
	xpdf $(text).pdf

$(text).dvi: *.tex *.bib *.cfg
	latex $(text)
	bibtex $(text)
	makeindex -c -g -s unitext-g.ist -t $(text).glg -o $(text).gls $(text).glo
	makeindex -c -g -s unitext-i.ist -t $(text).ilg -o $(text).ind $(text).idx
	latex $(text)
	latex $(text)

$(text).ps: $(text).dvi *.tex *.bib *.cfg
	dvips $(text).dvi

$(text).pdf: $(tex_files) $(indices)/*.bib *.cfg $(images)
	mkdir -p $(working_dir)
	make --directory=content/images pdf working_dir="../../$(working_dir)"
	# epstopdf --outfile=$(working_dir)/tu-logo.pdf tu-logo.eps
	epstopdf --outfile=$(working_dir)/tu-logo-4c.pdf tu-logo-4c.eps
	$(PDFLATEX) -output-directory $(working_dir) $(text)
	$(BIBTEX) $(working_file)
	# makeindex -c -s nomencl.ist -t $(working_file).nlg -o $(working_file).nls $(working_file).nlo
	# makeindex -c -g -s unitext-g.ist -t $(working_file).glg -o $(working_file).gls $(working_file).glo
	# makeindex -c -g -s unitext-i.ist -t $(working_file).ilg -o $(working_file).ind $(working_file).idx
	# $(PDFLATEX) -output-directory $(working_dir) $(text)
	$(PDFLATEX) -output-directory $(working_dir) $(text)
	# thumbpdf $(working_file)
	# $(PDFLATEX) -output-directory $(working_dir) $(text)
	cp $(working_file).pdf .

pdf: $(text).pdf

clean:
	rm -f -r $(working_dir)
	rm -f *.log *.pdf log.txt
	make --directory=content/images clean

