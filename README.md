# Vorlage verwenden
Pflichtangaben und einigen weitere Einstellungen können in `einstellungen.tex` geändert werden. Kapitel werden in `content` nach dem Schema `<nn>kapitel.tex` angelegt, wobei <nn> eine mindestens zweistellige Zahl sein muss. Die Biblographie wird in der Datei `bibliographie.bib` geschrieben. Die Vorlage nutzt biblatex für die Bibliographie.

# Compilieren
Für latexmk und die Erzeugung eines Glossars muss ein Perl-Interpreter installiert sein. Windows-Nutzern ist ActivePerl zu empfehlen (http://www.activestate.com/activeperl/downloads). Linux- und Mac-User haben normalerweise schon einen Perl-Interpreter im System installiert.

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
* ads/ - enthält die notwendigen Seiten, z.B. Abstract, Deckblatt etc., sowie einige Interna
* content/ - enthält pro Kapitel eine Datei (Schema: `<nn>kapitel.tex`
* dokumentation.tex - die Hauptdatei, die alles andere einbindet
* latexmkrc - die Regeln, nach denen latexmk das Dokument baut
* images/
* einstellungen.tex - hier werden z.B. die Pflichtangaben auf dem Deckblatt geändert

# Nur Deckblatt verwenden
```
\usepackage{pdfpages}
% .....
\includepdf[pages=1]{../latexVorlage/dokumentation.pdf}
```
