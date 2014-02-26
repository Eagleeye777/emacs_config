;;; various_init.el -- Putting a bunch of stuff here that found no other place yet

;smart operator
(use-package smart-operator)

;Twittering mode
(use-package twittering-mode
  :config (setq twittering-use-master-password t)
  (setq twittering-icon-mode t)
  (add-hook 'twittering-mode-hook 'sauron-start)
)


;;magit stuff related
;; (eval-after-load 'diff-mode
;;   '(progn
;;      (set-face-foreground 'diff-added "green4")
;;      (set-face-foreground 'diff-removed "red3")))


;;magit stuff : Git-Version Controll for emacs
(eval-after-load 'magit
  '(progn
     (set-face-foreground 'magit-diff-add "green4")
     (set-face-foreground 'magit-diff-del "red3")))

(eval-after-load 'magit
  '(progn
     (setq magit-repo-dirs "~/.emacs.d")))


;; Pdf's aus emacs an evince weitergeben
(use-package openwith
  :init (openwith-mode t))

;; .zsh file is shell script too
(add-to-list 'auto-mode-alist '("\\.zsh\\'" . shell-script-mode))

;; flyspell-mode does spell-checking on the fly as you type
(use-package flyspell
  :config (setq ispell-program-name "aspell" ; use aspell instead of ispell
                ispell-extra-args '("--sug-mode=ultra"))
  (setq ispell-dictionary "german8")
  :diminish flyspell-mode
  )


;; Erlaubt zusätzliche Keybindings durch simultanes pressen von Tasten
;; Die eigentlichen Keybinds werden in keybinds.el definiert
(use-package key-chord
  :init (key-chord-mode 1)
  :config  (setq key-chord-two-keys-delay 0.25)
  (setq key-chord-one-key-delay 0.25))

;;fixing open-with attachemnt trouble Here
(require 'mm-util)
(add-to-list 'mm-inhibit-file-name-handlers 'openwith-file-handler)

(use-package sauron
  :config (setq sauron-dbus-cookie t))

;; Improved zap-to char functionallyty
(use-package zop-to-char)

(require 'hideshow)
(diminish 'hs-minor-mode)
(add-hook 'prog-mode-hook 'hs-minor-mode)

(use-package my-nav-mode)


;; Stuff to make preview pane working as I want to
;; I might have to manually reenable openwith afterwards though
(add-hook 'latex-mode-hook '(lambda () (openwith-mode -1)))
(setq doc-view-continuous t)


;; Automatically byte-compile elisp-files
(add-hook 'after-save-hook 'byte-compile-current-buffer)
