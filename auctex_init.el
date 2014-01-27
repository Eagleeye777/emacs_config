;; auctex für Emacs verfügbar machen
(load "auctex.el" nil  t t)

(setq TeX-auto-save t)
(setq TeX-parse-self t)
(setq TeX-PDF-mode t) ;; .pdf statt .dvi per default:
;;Zeilenumbruch
(add-hook 'LaTeX-mode-hook 'turn-on-auto-fill)
;;Syntax Higlight
(add-hook 'LaTeX-mode-hook 'turn-on-font-lock)
;; Mathe Modus
(add-hook 'LaTeX-mode-hook 'LaTeX-math-mode)
;; Reftex einflechten und laden
(setq reftex-plug-into-AUCTeX t)
(add-hook 'LaTeX-mode-hook 'turn-on-reftex)
;; Satzende ". " statt ". ". " f¨ur M-k: l¨oschen bis Satzende usw.
(setq sentence-end "[.?!][]\"')}]*\\($\\| \\| \\)[
;;]*") ;; Da ist ein "Newline in der Zeile!"
(setq sentence-end-double-space nil)
;;direkte Rechtschreib Korrektur:
;;(add-hook 'LaTeX-mode-hook 'flyspell-mode)
;; Nur benutzen falls Auctex > 11.81 mit preview-latex:
(load "preview-latex.el" nil t t)
;; aspell ist besser als ispell.
;; Zeile kommentieren, falls nicht installiert:


;; MIGRIERT NACH various_init.el


;;(setq-default ispell-program-name "aspell")
;; Deutsche Rechtschreibung falls \usepackage{ngerman}
;; oder german benutzt wird
(add-hook 'TeX-language-de-hook
(function (lambda () (ispell-change-dictionary "german8"))))
;; stellt das Ausblenden von Befehlen für Latex zur Verfügung
(add-hook 'TeX-mode-hook (lambda ()
                             (TeX-fold-mode 1)))


;; ac.math hinzufügen   ac.math ist ein Code-completion feature für Latex, dass die auto-complete sources erweitert. 

(add-to-list 'load-path "/home/sschaumburg/.emacs.d/el-get/ac-math/") ;;Der Pfad muss ggf. entsprechend angepasst werden. 

(require 'ac-math)

(add-to-list 'ac-modes 'latex-mode)   ; make auto-complete aware of {{{latex-mode}}}
(add-to-list 'ac-modes 'LaTex-mode)   ; make auto-complete aware of {{{latex-mode}}}

(add-to-list 'load-path "/home/sschaumburg/.emacs.d/auto-complete-auctex")
(require 'auto-complete-auctex)
(ac-auctex-setup)



(defun ac-latex-mode-setup ()         ; add ac-sources to default ac-sources
  (setq ac-sources
     (append '(ac-source-math-unicode ac-source-math-latex ac-source-latex-commands)
               ac-sources)))

(add-hook 'latex-mode-hook 'ac-latex-mode-setup)
(add-hook 'LaTeX-mode-hook 'ac-latex-mode-setup)

(add-hook 'LaTeX-mode-hook '(setq TeX-command-default "LaTeX"))

;; set XeTeX mode in TeX/LaTeX
(add-hook 'LaTeX-mode-hook 
          (lambda()
             (add-to-list 'TeX-command-list '("XeLaTeX" "%`xelatex%(mode)%' %t" TeX-run-TeX nil t))
             (setq TeX-save-query nil)
             (setq TeX-show-compilation t)))
