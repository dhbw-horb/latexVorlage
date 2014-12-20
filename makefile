DOCUMENT_NAME = dokumentation
OUTPUT_DIR    = output
ABGABE_DIR    = ../abgabe/

##direct
# Build the LaTeX document.
all: outputdir report 
#cleanup

# Remove output directory and generated document
clean:
	rm -rf $(OUTPUT_DIR)
	rm -f $(DOCUMENT_NAME).pdf
	rm -f $(DOCUMENT_NAME).synctex.gz

# cleanup tempfiles
cleanup:
	rm -f $(OUTPUT_DIR)/$(DOCUMENT_NAME).aux $(OUTPUT_DIR)/$(DOCUMENT_NAME).acn $(OUTPUT_DIR)/$(DOCUMENT_NAME).glo $(OUTPUT_DIR)/$(DOCUMENT_NAME).ist $(OUTPUT_DIR)/$(DOCUMENT_NAME).lof $(OUTPUT_DIR)/$(DOCUMENT_NAME).lot $(OUTPUT_DIR)/$(DOCUMENT_NAME).lol $(OUTPUT_DIR)/$(DOCUMENT_NAME).out $(OUTPUT_DIR)/$(DOCUMENT_NAME).toc $(OUTPUT_DIR)/$(DOCUMENT_NAME).alg $(OUTPUT_DIR)/$(DOCUMENT_NAME).glg $(OUTPUT_DIR)/$(DOCUMENT_NAME).gls $(OUTPUT_DIR)/$(DOCUMENT_NAME).acr $(OUTPUT_DIR)/$(DOCUMENT_NAME).blg $(OUTPUT_DIR)/$(DOCUMENT_NAME).bbl $(OUTPUT_DIR)/$(DOCUMENT_NAME).bcf $(OUTPUT_DIR)/$(DOCUMENT_NAME).run.xml

# Create LaTeX output directory.
outputdir:
	$(shell mkdir $(OUTPUT_DIR) 2>/dev/null)

# Generate PDF output from LaTeX input files.
report: 
	pdflatex -interaction=errorstopmode -output-directory=$(OUTPUT_DIR) $(DOCUMENT_NAME)
	biber --output-directory $(OUTPUT_DIR) $(DOCUMENT_NAME)
	makeglossaries -d $(OUTPUT_DIR) -q $(DOCUMENT_NAME)
	pdflatex -interaction=errorstopmode -output-directory=$(OUTPUT_DIR) $(DOCUMENT_NAME)
	pdflatex -interaction=errorstopmode -output-directory=$(OUTPUT_DIR) $(DOCUMENT_NAME)
	mv $(OUTPUT_DIR)/$(DOCUMENT_NAME).pdf $(DOCUMENT_NAME).pdf 


##latexmk
# Build the LaTeX document with latexmk
all-latexmk: report-latexmk

# Remove output directory and generated document
clean-latexmk:
	clean

# cleanup tempfiles
cleanup-latexmk:
	latexmk -c

# Generate PDF output from LaTeX input files
report-latexmk:
	latexmk
