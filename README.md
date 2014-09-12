# Vorlage verwenden
Entweder über latexmk:
* Bauen: `latexmk`
* Aufräumen: `latexmk -c`

Oder über das makefile (verwendet latexmk):
* Bauen: `make`
* Aufräumen:
  * `make clean` (entfernt output/, dokumentation.pdf und dokumentation.synctex.gz)
  * `make cleanup` (gleich wie latexmk -c)

## Ordnerstruktur
TODO

# Nur Deckblatt verwenden
    \usepackage{pdfpages}
    % .....
    \includepdf[pages=1]{../latexVorlage/output/dokumentation.pdf}
