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
"
\\documentclass{scrartcl}
\\usepackage[T1]{fontenc}
\\usepackage[utf8]{inputenc}
\\usepackage{fixltx2e}
\\usepackage{ellipsis, ragged2e}

\\usepackage[tracking=true]{microtype}
\\DeclareMicrotypeSet*[tracking]{my}%
   { font = */*/*/sc/* }%
\\SetTracking{ encoding = *, shape = sc }{ 45 }%
\\usepackage{paralist}
\\usepackage{hyperref}
\\usepackage{ dejavu }
\\usepackage[ left=2.5cm, right=4cm, top=2cm, bottom=2.3cm]{geometry}
\\usepackage{setspace} \\onehalfspacing
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
