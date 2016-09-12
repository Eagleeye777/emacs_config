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


;; no menu Bars or Toolbars
;;;###autoload
(progn
  (menu-bar-mode -1)
  (when (fboundp 'tool-bar-mode)
    (tool-bar-mode -1))
  (when (fboundp 'scroll-bar-mode)
    (scroll-bar-mode -1)))

;; Ich hab im Augenblick keine Ahnung wozu das gut ist
(use-package uniquify
  :config (setq uniquify-buffer-name-style 'forward))


;; Ich hab im Augenblick keine Ahnung wozu das gut ist
(use-package saveplace
  :config
  (setq-default save-place t)
  )

;;powerline status bar settings
(use-package powerline
  :ensure t
  :init (powerline-center-theme))

;; (use-package nyan-mode
;; :init (nyan-mode +1))

;; anzu-mode enhances isearch by showing total matches and current match position
(use-package anzu
  :ensure t
  :init (global-anzu-mode +1)
  :diminish anzu-mode)

(use-package zenburn
  :ensure t
  :pin melpa)

;; highlight the current line
(global-hl-line-mode +1)

(use-package volatile-highlights
  :ensure t
  :init (volatile-highlights-mode t)
  :diminish volatile-highlights-mode)

(use-package workgroups2
  :ensure t
  :init
  (setq wg-prefix-key (kbd "C-c e"))
  (setq wg-session-file "~/.emacs.d/.emacs_workgroups")
  )

(use-package golden-ratio
  :ensure t
  :init (  golden-ratio-mode 1)
  :diminish (golden-ratio-mode)
  )

(use-package rainbow-delimiters
  :ensure t
  :init (add-hook 'prog-mode-hook 'rainbow-delimiters-mode)
  :diminish rainbow-delimiters-mode)
