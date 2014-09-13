OUTPUT_DIR = "output"

# Build the LaTeX document
all: report

# Remove output directory and generated document
clean:
	rm -rf $(OUTPUT_DIR) dokumentation.pdf dokumentation.synctex.gz

# cleanup tempfiles
cleanup:
	latexmk -c

# Generate PDF output from LaTeX input files
report:
	latexmk
