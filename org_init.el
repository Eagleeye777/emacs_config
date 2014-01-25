
;; ;Setting up org-Mode here
;; deutsch as export language
(setq org-export-default-language "de")
;; My org files (Setting up the enviroment)
(setq org-directory (expand-file-name (file-name-as-directory "~/Dropbox/org")))
(setq org-default-notes-file (concat org-directory "/notes.org"))

(add-to-list 'auto-mode-alist '("\\.org\\'" . org-mode))

;; Files for mobile-org (Handy-Export)
(setq org-mobile-directory (expand-file-name "mobileOrg" org-directory))
(setq org-mobile-files  (expand-file-name "default.org" org-directory))
(setq org-mobile-inbox-for-pull (expand-file-name "from-mobile.org" org-directory))

;; org mode General Settings
(add-hook 'org-mode-hook 'turn-on-font-lock) 
(add-hook 'text-mode-hook 'turn-on-auto-fill) ; automatische Zeilenumbrüche
(add-hook 'org-mode-hook 'flyspell-mode)
(setq org-completion-use-ido t)
(setq org-return-follows-link t)
(setq org-support-shift-select t)
(setq org-replace-disputed-keys t) ;; Damit Windmove und Cua Funktionieren
(setq org-use-speed-commands t)
(setq org-hide-leading-stars 'hidestars)

;; deutscher Kalender:
(setq calendar-week-start-day 1
      calendar-day-name-array
        ["Sonntag" "Montag" "Dienstag" "Mittwoch"
         "Donnerstag" "Freitag" "Samstag"]
      calendar-month-name-array
        ["Januar" "Februar" "März" "April" "Mai"
         "Juni" "Juli" "August" "September"
         "Oktober" "November" "Dezember"])

;;(setq org-outline-path-complete-in-steps nil)

;; Setting up Agenda Files
(setq org-agenda-files (list "~/Dropbox/org/" "~/Dropbox/org/notes"))

;; Das hier ist fürs refiling 
(setq org-refile-use-outline-path 'file)
(setq org-refile-targets (quote ((org-agenda-files :maxlevel . 3) (nil :maxlevel . 3))))

;; Eigene Workflow States definieren 
(setq org-todo-keywords
      '((sequence "TODO" "STARTED" "|" "FROZEN" "DONE" "DELEGATED")))
;;here was hin

;; Eigene Tag Liste
(setq org-tag-alist '(("privat") ("uni")("Computer")("Linux") ("Someday")))

;; Drawers und log
(setq org-drawers '("PROPERTIES" "CLOCK" "LOGBOOK" "RESULTS" "NOTES"))
(setq org-log-into-drawer t)
(setq org-log-done 'time)

;; Setting up Org Keybindings 

(global-set-key "\C-cl" 'org-store-link)
(global-set-key "\C-ca" 'org-agenda)
(global-set-key "\C-cb" 'org-iswitchb)
(define-key global-map "\C-cc" 'org-capture)
(define-key global-map (kbd "<f9>") 'org-capture)

;; Templates für Capture definieren
(setq org-capture-templates 
        '(("t" "TODO" entry (file+headline "~/Dropbox/org/default.org" "Todos") "* TODO %? \nErstellt am %U\n" :empty-lines 1) 
          ("n" "Notes" entry (file "~/Dropbox/org/notes.org") "* %?  \nErstellt am %U \n%A" :empty-lines 1 ) 
          ("j" "Journal" entry (file+datetree "~/Dropbox/org/journal.org") "* %?  Erstellt am %U\n" :empty-lines 1)
          ("i" "Inbox" entry (file+headline  "~/Dropbox/org/default.org" "Inbox" ) "** %?  \nErstellt am %U\n" :empty-lines 1)
))



;setting up Deft (Notiz-Verwaltung, in Kombination mit Org-Mode)
(add-to-list 'load-path "~/.emacs.d/deft-multidir")
(require 'deft)
(setq deft-extension "org")
(setq deft-text-mode 'org-mode)
(setq deft-directories
       '("~/Dropbox/org/notes"))

(add-to-list 'deft-directories "~/Dropbox/org/egl_tutorium")
(add-to-list 'deft-directories "~/Dropbox/org/")

(setq deft-use-filename-as-title t)

(require 'org)
(require 'org-latex)

(add-to-list 'org-export-latex-classes
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


(add-to-list 'org-export-latex-classes
  '("samuel-default"
"\\documentclass{scrartcl}  % Eine Klasse für beidseitige Texte mit Kapiteln 
             %
 %%%%%%%%%%%%% Unverzichtbare Pakte
 \\usepackage[T1]{fontenc}% fontenc und inputenc ermöglichen
 \\usepackage[utf8]{inputenc}% Silbentrennung und
                              % Eingabe von Umlauten.

 \\usepackage{% Man kann auch mehrere Pakete ohne Optionen
             % in einen \\usepackage-Befehl packen.
   babel,    % Babel für diverse Sprachanpassungen
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

(setq org-latex-to-pdf-process 
  '("latex -interaction nonstopmode %f"
     "latex -interaction nonstopmode %f")) ;; for multiple passes

;; org_init.el ends here

;; ;;; Versuchter Kalenderexport. Das ganze schlägt momentan aber fehl 
;; ;;; Hier die Anleitung http://orgmode.org/worg/org-tutorials/org-google-sync.html


;; ;;; define categories that should be excluded
;; (setq org-export-exclude-category (list "google" "private"))

;; ;;; define filter. The filter is called on each entry in the agenda.
;; ;;; It defines a regexp to search for two timestamps, gets the start
;; ;;; and end point of the entry and does a regexp search. It also
;; ;;; checks if the category of the entry is in an exclude list and
;; ;;; returns either t or nil to skip or include the entry.


;; (defun org-mycal-export-limit ()
;;   "Limit the export to items that have a date, time and a range. Also exclude certain categories."
;;   (setq org-tst-regexp "<\\([0-9]\\{4\\}-[0-9]\\{2\\}-[0-9]\\{2\\} ... [0-9]\\{2\\}:[0-9]\\{2\\}[^\r\n>]*?\
;; \)>")
;;   (setq org-tstr-regexp (concat org-tst-regexp "--?-?" org-tst-regexp))
;;   (save-excursion
;;     ; get categories
;;     (setq mycategory (org-get-category))
;;     ; get start and end of tree
;;     (org-back-to-heading t)
;;     (setq mystart    (point))
;;     (org-end-of-subtree)
;;     (setq myend      (point))
;;     (goto-char mystart)
;;     ; search for timerange
;;     (setq myresult (re-search-forward org-tstr-regexp myend t))
;;     ; search for categories to exclude
;;     (setq mycatp (member mycategory org-export-exclude-category))
;;     ; return t if ok, nil when not ok
;;     (if (and myresult (not mycatp)) t nil)))

;; ;;; activate filter and call export function
;; (defun org-mycal-export ()
;;   (let ((org-icalendar-verify-function 'org-mycal-export-limit))
;;     (org-export-icalendar-combine-agenda-files)))

;; (load "~/.emacs.d/org_ac_fix.el")
