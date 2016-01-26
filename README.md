# Vorlage verwenden
Pflichtangaben und einigen weitere Einstellungen können in `einstellungen.tex` geändert werden. Kapitel werden in `content` nach dem Schema `<nn>kapitel.tex` angelegt, wobei &lt;nn&gt; eine mindestens zweistellige Zahl sein muss. Das Logo der Firma kann durch das Ersetzen der Datei `images/fima-deckblatt.png` geändert werden. Die Größe des Bildes ändert man durch das Verkleinern/Vergrößern der Datei.

## Probleme
Probleme, die sich konkret mit der Vorlage zurückführen lassen und Verbesserungsvorschläge können mit einem Github-Account [hier](https://github.com/dhbw-horb/latexVorlage/issues) gemeldet werden. Bei Problemen ist eine nachvollziehbare Beschreibung des Problems und der eigenen Lösungsversuche notwendig.

Hinweis: Unter Miktex 2.9 gibt es derzeit leider Probleme, die aber umgangen werden können. [Mehr dazu hier](https://github.com/dhbw-horb/latexVorlage/issues/23).

# Compilieren
Für das Paket _latexmk_ und die Erzeugung eines Glossars muss ein Perl-Interpreter installiert sein. Linux- und Mac-User haben normalerweise diesen schon im System installiert. Windows-Nutzern ist ActivePerl zu empfehlen (http://www.activestate.com/activeperl/downloads). Die Vorlage nutzt außerdem _biblatex_ mit dem Backend _biber_ für die Bibliographie.

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
	* **ads/glossary.tex** - Glossareinträge
	* **ads/acronyms.tex** - Einträge des Abkürzungsverzeichnisses
* **content/** - enthält pro Kapitel eine Datei (Schema: `<nn>kapitel.tex`)
* **images/** - enthält Bilder und Logos
	* **images/logo.png** - Logo der Firma auf Deckblatt.
* **einstellungen.tex** - hier werden z.B. die Pflichtangaben auf dem Deckblatt geändert
* **dokumentation.tex** - die Hauptdatei, die alles andere einbindet
* **bibliographie.bib** - Einträge der Bibliographie
* **latexmkrc** - die Regeln, nach denen latexmk das Dokument baut

# Nur Deckblatt verwenden
```latex
% .....
\includepdf[pages=1]{../latexVorlage/dokumentation.pdf}
```
