(require 'org)
(require 'ox-latex)

(add-to-list 'org-latex-classes
  '("djcb-org-article"
"\\documentclass[11pt,a4paper]{article}
\\usepackage[T1]{fontenc}
\\usepackage{fontspec}
\\usepackage{graphicx} 
\\defaultfontfeatures{Mapping=tex-text}
\\setromanfont{Gentium}
\\setromanfont [BoldFont={Gentium Basic Bold},
                ItalicFont={Gentium Basic Italic}]{Gentium Basic}
\\setsansfont{Charis SIL}
\\setmonofont[Scale=0.8]{DejaVu Sans Mono}
\\usepackage{geometry}
\\geometry{a4paper, textwidth=6.5in, textheight=10in,
            marginparsep=7pt, marginparwidth=.6in}
\\pagestyle{empty}
\\title{}
      [NO-DEFAULT-PACKAGES]
      [NO-PACKAGES]"
     ("\\section{%s}" . "\\section*{%s}")
     ("\\subsection{%s}" . "\\subsection*{%s}")
     ("\\subsubsection{%s}" . "\\subsubsection*{%s}")
     ("\\paragraph{%s}" . "\\paragraph*{%s}")
     ("\\subparagraph{%s}" . "\\subparagraph*{%s}")))


(add-to-list 'org-latex-classes
  '("samuel-default"
"\\documentclass{scrartcl}  % Eine Klasse für beidseitige Texte mit Kapiteln 
             %
 %%%%%%%%%%%%% Unverzichtbare Pakte
 \\usepackage[T1]{fontenc}% fontenc und inputenc ermöglichen
 \\usepackage[utf8]{inputenc}% Silbentrennung und
                              % Eingabe von Umlauten.

 \\usepackage{% Man kann auch mehrere Pakete ohne Optionen
             % in einen \\usepackage-Befehl packen.
   fixltx2e  % Verbessert einige Kernkompetenzen von LaTeX2e
 }
             %
 %%%%%%%%%%%%% Typografisch empfehlenswerte Pakete
 \\usepackage{% 
   ellipsis, % Korrigiert den Weißraum um Auslassungspunkte
   ragged2e, % Ermöglicht Flattersatz mit Silbentrennung
  marginnote,% Für bessere Randnotizen mit \\marginnote statt
             % \marginline
 }
 
\\usepackage[tracking=true]{microtype}%
             % Microtype ist einfach super, aber lesen Sie
             % unbedingt die Anleitung um das Folgende zu
             % verstehen.
\\DeclareMicrotypeSet*[tracking]{my}% 
   { font = */*/*/sc/* }% 
\\SetTracking{ encoding = *, shape = sc }{ 45 }%
\\usepackage{paralist}
\\usepackage{hyperref}
\\usepackage{ dejavu }
\\usepackage[ left=2.5cm, right=4cm, top=2cm, bottom=2.3cm]{geometry} % Fürdie Einstellungen der Seitenränder
\\usepackage{setspace} \\onehalfspacing % für Zeilenabstand                   
\\setlength{\\parskip}{6pt} 
\\usepackage{url}
\\urlstyle{rm}
\\usepackage{titlesec}
%Fußnotenformatierung (Koma-Skript)
\\setkomafont{footnote}{\\rmfamily}
\\deffootnote[1em]{1em}{1em}{
\\makebox[1.5em][l]{\\textsuperscript{\\thefootnotemark}}}
\\usepackage{tabularx}
\\title{}
      [NO-DEFAULT-PACKAGES]
      [NO-PACKAGES]"
     ("\\section{%s}" . "\\section*{%s}")
     ("\\subsection{%s}" . "\\subsection*{%s}")
     ("\\subsubsection{%s}" . "\\subsubsection*{%s}")
     ("\\paragraph{%s}" . "\\paragraph*{%s}")
     ("\\subparagraph{%s}" . "\\subparagraph*{%s}")))
