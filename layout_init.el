;kein Begrüßungsbildschirm
(setq inhibit-startup-message t)

; display line numbers to the right of the window
(global-linum-mode t)

;Zeilen- und Spaltennummer in der Statuszeile anzeigen
(line-number-mode 1)
(column-number-mode 1)

; Keine neuen Frames, sondern nur neue Buffer
(setq ns-pop-up-frames nil)

;terminals in Farbe
(add-hook 'shell-mode-hook 'ansi-color-for-comint-mode-on)

; Theme laden

;;(require 'monokai-theme)

;;powerline status bar
(require 'powerline)
(powerline-center-theme)

;; anzu-mode enhances isearch by showing total matches and current match position
(require 'anzu)
(global-anzu-mode)
(diminish 'anzu-mode)

;; highlight the current line
(global-hl-line-mode +1)

;; das Teste ich jetzt mal ein wenig
(require 'volatile-highlights)
(volatile-highlights-mode t)
(diminish 'volatile-highlights-mode)

