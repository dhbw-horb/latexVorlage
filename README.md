## Vorlage verwenden
Zur Kompilierung folgende Befehle ausfhren:

    $ pdflatex dokumentation.tex
    $ makeglossaries dokumentation.glo
    $ makeglossaries dokumentation.acn
    $ pdflatex dokumentation.tex

## Nur Deckblatt verwenden
    \usepackage{pdfpages}
    % .....
    \includepdf[pages=1]{../latexVorlage/dokumentation.pdf}
