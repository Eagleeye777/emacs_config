
;; Variablen setzen, um auf Betriebssystem zu testen
(defvar gnulinux-p (string-match "linux" (symbol-name system-type)))
(defvar mswindows-p (string-match "windows" (symbol-name system-type)))

;;Start im Vollbild-modus
(toggle-frame-maximized)
(add-to-list 'default-frame-alist '(fullscreen . fullboth))

(setq tramp-ssh-controlmaster-options
      "-o ControlMaster=auto -o ControlPath='tramp.%%C' -o ControlPersist=no")

;; disable comments to compile once in a while
;; (byte-recompile-directory (expand-file-name "~/.emacs.d") 0)

;; Fixing a gnutls error warning and raising sercurity level of tls encyption
(setq gnutls-min-prime-bits '"1024")

;; Few things I cannot get anywhere via packages. These go here
;;(add-to-list 'load-path "~/.emacs.d/custom/")

;; Set up el get und Package repos and install packages if not there (buggy on the elpa side)
(load "~/.emacs.d/package_init.el")

;; ;; Allgemeine grundlegende Einstellungen
(load "~/.emacs.d/gen_init.el")

;; ;; Winner Mode configuration, esp. to work better with helm
(load "~/.emacs.d/winner_init.el")
;; (add-to-list 'load-path "~/.emacs.d/custom/")

;; Display Settings
(load "~/.emacs.d/layout_init.el")

;; (load "~/.emacs.d/ido_init.el")
;; (load "~/.emacs.d/init_ivy.el")

;; company und yasnippet
(load "~/.emacs.d/company_yas_init.el")

;; setting up org mode and deft(extern File)
(load "~/.emacs.d/org_init.el" )

;; Init stuff around elisp
(load "~/.emacs.d/elisp_init.el")

; Custom Functions (All helper functions and whatever)
(load "~/.emacs.d/func_init.el")

;; Whatever is left still
(load "~/.emacs.d/various_init.el")

;;w3m Configurations
;;(load "~/.emacs.d/w3m_init.el")

;; auctex und ac.amath
(load "~/.emacs.d/auctex_init.el")

;;helm
(load "~/.emacs.d/helm_init.el")

;; Some utils I use
(load "~/.emacs.d/edit_utils.el")

;; Hydra Setup
(load "~/.emacs.d/hydra_init.el")

;; keybindings
(load "~/.emacs.d/keybinds.el")
;;Email
;; (load  "~/.emacs.d/mu4e_init.el")

;; (load "~/.emacs.d/eshell_init.el")

;; garbage collection settings
(setq gc-cons-threshold 50000000)


(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(browse-url-generic-program "firefox")
 '(compilation-message-face (quote default))
 '(cua-global-mark-cursor-color "#2aa198")
 '(cua-normal-cursor-color "#839496")
 '(cua-overwrite-cursor-color "#b58900")
 '(cua-read-only-cursor-color "#859900")
 '(custom-enabled-themes (quote (zenburn)))
 '(custom-safe-themes
   (quote
    ("82d2cac368ccdec2fcc7573f24c3f79654b78bf133096f9b40c20d97ec1d8016" "1b8d67b43ff1723960eb5e0cba512a2c7a2ad544ddb2533a90101fd1852b426e" "a27c00821ccfd5a78b01e4f35dc056706dd9ede09a8b90c6955ae6a390eb1c1e" "3c83b3676d796422704082049fc38b6966bcad960f896669dfc21a7a37a748fa" "1fc1fdf975c8c8c3767c29787a063eee50cbceef903644a0771fa66568ee8777" "b6ea07510c0ceb500ba53a846062df4c4bd89b14d7db11cebe34ecbbe69886ca" "a8245b7cc985a0610d71f9852e9f2767ad1b852c2bdea6f4aadc12cce9c4d6d0" "d677ef584c6dfc0697901a44b885cc18e206f05114c8a3b7fde674fce6180879" "8aebf25556399b58091e533e455dd50a6a9cba958cc4ebb0aab175863c25b9a4" "cdbd0a803de328a4986659d799659939d13ec01da1f482d838b68038c1bb35e8" default)))
 '(epg-gpg-program "gpg2")
 '(global-aggressive-indent-mode t)
 ;; '(global-hi-lock-mode t)
 '(highlight-changes-colors (quote ("#d33682" "#6c71c4")))
 '(highlight-symbol-colors
   (--map
    (solarized-color-blend it "#002b36" 0.25)
    (quote
     ("#b58900" "#2aa198" "#dc322f" "#6c71c4" "#859900" "#cb4b16" "#268bd2"))))
 '(highlight-symbol-foreground-color "#93a1a1")
 '(highlight-tail-colors
   (quote
    (("#073642" . 0)
     ("#546E00" . 20)
     ("#00736F" . 30)
     ("#00629D" . 50)
     ("#7B6000" . 60)
     ("#8B2C02" . 70)
     ("#93115C" . 85)
     ("#073642" . 100))))
 '(hl-bg-colors
   (quote
    ("#7B6000" "#8B2C02" "#990A1B" "#93115C" "#3F4D91" "#00629D" "#00736F" "#546E00")))
 '(hl-fg-colors
   (quote
    ("#002b36" "#002b36" "#002b36" "#002b36" "#002b36" "#002b36" "#002b36" "#002b36")))
 '(ispell-complete-word-dict "/usr/share/dict/ngerman")
 ;; '(magit-diff-use-overlays nil)
 '(pos-tip-background-color "#073642")
 '(pos-tip-foreground-color "#93a1a1")
 '(smartrep-mode-line-active-bg (solarized-color-blend "#859900" "#073642" 0.2))
 '(term-default-bg-color "#002b36")
 '(term-default-fg-color "#839496")
 '(weechat-color-list
   (quote
    (unspecified "#002b36" "#073642" "#990A1B" "#dc322f" "#546E00" "#859900" "#7B6000" "#b58900" "#00629D" "#268bd2" "#93115C" "#d33682" "#00736F" "#2aa198" "#839496" "#657b83")))
 '(xterm-color-names
   ["#073642" "#dc322f" "#859900" "#b58900" "#268bd2" "#d33682" "#2aa198" "#eee8d5"])
 '(xterm-color-names-bright
   ["#002b36" "#cb4b16" "#586e75" "#657b83" "#839496" "#6c71c4" "#93a1a1" "#fdf6e3"]))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(helm-swoop-target-line-face ((t (:background "#4F4F4F" :foreground "#DCDCCC"))))
 '(helm-swoop-target-word-face ((t (:background "#cccc00" :foreground "royal blue" :weight bold))))
 '(vhl/default-face ((t (:background "yellow" :foreground "gray0")))))
(add-to-list 'load-path "/home/deepthought/.emacs.de/custom/")
