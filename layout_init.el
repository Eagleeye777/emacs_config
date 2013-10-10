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

;;powerline status bar
(add-to-list 'load-path "/home/sschaumburg/.emacs.d/el-get/powerline")

(add-to-list 'load-path "/home/sschaumburg/.emacs.d/el-get/package/elpa/monokai-theme-0.0.10")
(require 'monokai-theme);;


(require 'powerline)
(powerline-center-theme)

