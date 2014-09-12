# Vorlage verwenden
Entweder über latexmk:
* Bauen: `latexmk`
* Aufräumen: `latexmk -c`

Oder über das makefile (verwendet latexmk):
* Bauen: `make`
* Aufräumen:
  * `make clean` (entfernt output/, dokumentation.pdf und dokumentation.synctex.gz)
  * `make cleanup` (gleich wie latexmk -c)

# Ordnerstruktur
* ads/ - enthält die notwendigen Seiten, z.B. Abstract, Deckblatt etc.
* content/ - enthält pro Kapitel eine Datei
* dokumentation.tex - die Hauptdatei, die alles andere einbindet
* latexmkrc - die Regeln, nach denen latexmk das Dokument baut
* images/

# Nur Deckblatt verwenden
    \usepackage{pdfpages}
    % .....
    \includepdf[pages=1]{../latexVorlage/output/dokumentation.pdf}
