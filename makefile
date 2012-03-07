DOCUMENT_NAME = dokumentation
OUTPUT_DIR    = output
ABGABE_DIR    = ../abgabe/

# Build the LaTeX document.
all: outputdir report cleanup

# Remove output directory.
clean:
	rm -rf $(OUTPUT_DIR)

# cleanup tempfiles
cleanup:
	rm -f $(DOCUMENT_NAME).aux rm -f $(DOCUMENT_NAME).acn $(DOCUMENT_NAME).glo $(DOCUMENT_NAME).ist $(DOCUMENT_NAME).lof $(DOCUMENT_NAME).log $(DOCUMENT_NAME).lot $(DOCUMENT_NAME).lol $(DOCUMENT_NAME).out $(DOCUMENT_NAME).toc $(DOCUMENT_NAME).alg $(DOCUMENT_NAME).glg $(DOCUMENT_NAME).gls $(DOCUMENT_NAME).acr $(DOCUMENT_NAME).pdf

# Create LaTeX output directory.
outputdir:
	$(shell mkdir $(OUTPUT_DIR) 2>/dev/null)

# Generate PDF output from LaTeX input files.
report:
	pdflatex -interaction=errorstopmode $(DOCUMENT_NAME) > error.txt
	makeglossaries -q dokumentation.glo
	makeglossaries -q dokumentation.acn
	pdflatex -interaction=errorstopmode $(DOCUMENT_NAME) > error.txt
	cp $(DOCUMENT_NAME).pdf $(OUTPUT_DIR)
#	cp $(DOCUMENT_NAME).pdf $(ABGABE_DIR)