;;; various_init.el -- Putting a bunch of stuff here that found no other place yet

;smart operator
(autoload 'smart-operator "smart-operator" "Start smart-operator" t)

;Twittering mode
(autoload 'twittering-mode "twittering-mode" "Start twittering mode" t)
(setq twittering-use-master-password t)
(setq twittering-icon-mode t)

;; (add-to-list 'load-path "~/.emacs.d/el-get/package/elpa/projectile-20140114.831/")
;; (projectile-global-mode)
;; (diminish 'projectile-mode)

;; git emacs
;; (require 'git-emacs)
;;magit stuff related
(eval-after-load 'diff-mode
  '(progn
     (set-face-foreground 'diff-added "green4")
     (set-face-foreground 'diff-removed "red3")))


;;magit stuff : Git-Version Controll for emacs
(eval-after-load 'magit
  '(progn
     (set-face-foreground 'magit-diff-add "green4")
     (set-face-foreground 'magit-diff-del "red3")))

(eval-after-load 'magit
  '(progn
     (setq magit-repo-dirs "~/.emacs.d")))


;; Pdf's aus emacs an evince weitergeben
(require 'openwith)
(openwith-mode t)
;; These things are defined via emacs-customization. Works better that way
;;(setq openwith-associations '(("\\.pdf\\'" "evince" (file))))
;;(setq openwith-associations '(("\\.epub\\'" "calibre" (file))))


;; .zsh file is shell script too
(add-to-list 'auto-mode-alist '("\\.zsh\\'" . shell-script-mode))

;; flyspell-mode does spell-checking on the fly as you type
(require 'flyspell)
(setq ispell-program-name "aspell" ; use aspell instead of ispell
      ispell-extra-args '("--sug-mode=ultra"))
(setq ispell-dictionary "german8")

;; Erlaubt zusätzliche Keybindings durch simultanes pressen von Tasten
;; Die eigentlichen Keybinds werden in keybinds.el definiert
(require 'key-chord)
(key-chord-mode 1)
(setq key-chord-two-keys-delay 0.25)
(setq key-chord-one-key-delay 0.25)

;;fixing open-with attachemnt trouble Here
(require 'mm-util)
(add-to-list 'mm-inhibit-file-name-handlers 'openwith-file-handler)

(require 'sauron)
(setq sauron-dbus-cookie t)

;; Improved zap-to char functionallyty
(require 'zop-to-char)


(require 'hideshow)
(add-hook 'prog-mode-hook 'hs-minor-mode)
(diminish 'hs-minor-mode)
