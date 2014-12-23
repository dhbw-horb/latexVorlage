# Vorlage verwenden
Pflichtangaben und einigen weitere Einstellungen können in `einstellungen.tex` geändert werden. Kapitel werden in `content` nach dem Schema `<nn>kapitel.tex` angelegt, wobei <nn> eine mindestens zweistellige Zahl sein muss. Die Biblographie wird in der Datei `bibliographie.bib` geschrieben. Die Vorlage nutzt _biblatex_ für die Bibliographie. Damit das Logo der eigenen Firma auf dem Deckblatt eingebunden wird, muss es als `images/logo.png` abgespeichert werden.

# Compilieren
Für das Paket _latexmk_ und die Erzeugung eines Glossars muss ein Perl-Interpreter installiert sein. Linux- und Mac-User haben normalerweise diesen schon im System installiert.Windows-Nutzern ist ActivePerl zu empfehlen (http://www.activestate.com/activeperl/downloads). 

## Über latexmk:
* Bauen: `latexmk`
* Aufräumen: `latexmk -c`

Oder über das makefile:
* Bauen: `make` oder `make all`
* Aufräumen:
  * `make clean` (entfernt output/, dokumentation.pdf und dokumentation.synctex.gz)
  * `make cleanup` (entfernt nur temporäre Build-Dateien)

## Ohne latexmk
Wenn kein latexmk installiert werden kann oder soll, stellt das makefile auch die entsprechenden Befehle ohne latexmk bereit: 
* `make all-legacy`
* `make clean-legacy`
* `make cleanup-legacy`

# Ordnerstruktur
* **ads/** - enthält die notwendigen Seiten, z.B. Abstract, Deckblatt etc., sowie einige Interna
* **content/** - enthält pro Kapitel eine Datei (Schema: `<nn>kapitel.tex`)
* **images/** - enthält Bilder und Logos
* **einstellungen.tex** - hier werden z.B. die Pflichtangaben auf dem Deckblatt geändert
* **dokumentation.tex** - die Hauptdatei, die alles andere einbindet
* **latexmkrc** - die Regeln, nach denen latexmk das Dokument baut

# Nur Deckblatt verwenden
```latex
\usepackage{pdfpages}
% .....
\includepdf[pages=1]{../latexVorlage/dokumentation.pdf}
```
