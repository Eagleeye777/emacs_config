;;; layout_init.el Customizing the emac layout here

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


;;; Moved from better defaults

;; no menu Bars or Toolbars
;;;###autoload
(progn
  (menu-bar-mode -1)
  (when (fboundp 'tool-bar-mode)
    (tool-bar-mode -1))
  (when (fboundp 'scroll-bar-mode)
    (scroll-bar-mode -1))

(require 'uniquify)
(setq uniquify-buffer-name-style 'forward)

(require 'saveplace)
(setq-default save-place t))

;;powerline status bar settings
(use-package powerline
  :init (powerline-center-theme))

;; anzu-mode enhances isearch by showing total matches and current match position
(use-package anzu
  :init (global-anzu-mode +1)
  :diminish anzu-mode)

;; highlight the current line
(global-hl-line-mode +1)

(use-package volatile-highlights
  :init (volatile-highlights-mode t)
  :diminish volatile-highlights-mode)
