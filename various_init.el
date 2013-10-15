;smart operator
(autoload 'smart-operator "smart-operator" "Start smart-operator" t)

;Twittering mode
(autoload 'twittering-mode "twittering-mode" "Start twittering mode" t)
(setq twittering-use-master-password t)
(setq twittering-icon-mode t)

;; Helm
(require 'helm-config)

;; git emacs
(require 'git-emacs)

;;magit stuff related
(eval-after-load 'diff-mode
  '(progn
     (set-face-foreground 'diff-added "green4")
     (set-face-foreground 'diff-removed "red3")))

(eval-after-load 'magit
  '(progn
     (set-face-foreground 'magit-diff-add "green4")
     (set-face-foreground 'magit-diff-del "red3")))

(eval-after-load 'magit
  '(progn
     (setq magit-repo-dirs "~/.emacs.d")))

;; Pdf's aus emacs an evince weitergeben
(require 'openwith)
(setq openwith-associations '(("\\.pdf\\'" "evince" (file))))
(openwith-mode t)

;; .zsh file is shell script too
(add-to-list 'auto-mode-alist '("\\.zsh\\'" . shell-script-mode))

;; flyspell-mode does spell-checking on the fly as you type
(require 'flyspell)
(setq ispell-program-name "aspell" ; use aspell instead of ispell
      ispell-extra-args '("--sug-mode=ultra"))
(setq ispell-dictionary "german")

;; Erlaubt zusätzliche Keybindings durch simultanes pressen von Tasten
(require 'key-chord)
(key-chord-mode 1)
(setq key-chord-two-keys-delay 0.15)
(setq key-chord-one-key-delay 0.25)
 
;; Die eigentlichen Keybinds werden in keybinds.el definiert
 
(autoload
  'ace-jump-mode
  "ace-jump-mode"
  "Emacs quick move minor mode"
  t)
