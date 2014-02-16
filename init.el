;;.emacs configuration File
;; Loading all the various init files here

;; disable comments to compile once in a while
;; (byte-recompile-directory (expand-file-name "~/.emacs.d") 0)

;; Fixing a gnutls error warning and raising sercurity level of tls encyption
(setq gnutls-min-prime-bits '"1024")

;; Few things I cannot get anywhere via packages. These go here
(add-to-list 'load-path "~/.emacs.d/custom/")

;; ;; Setting up the org load path asap here, to avoid things mixing up
;; (add-to-list 'load-path "/home/sschaumburg/.emacs.d/el-get/package/elpa/org-20140127")

;; Set up el get und Package repos and install packages if not there (buggy on the elpa side)
(load "~/.emacs.d/package_init.el")

;; ;; Allgemeine grundlegende Einstellungen
(load "/home/sschaumburg/.emacs.d/gen_init.el")

;; ;; Winner Mode configuration, esp. to work better with helm
(load "/home/sschaumburg/.emacs.d/winner_init.el")

;; Display Settings
(load "~/.emacs.d/layout_init.el")

;;All the Ido Stuff
(load "~/.emacs.d/ido_init.el")

;; autocomplete and yasnippet
(load "~/.emacs.d/ac_yas_init.el")

; setting up org mode and deft(extern File)
(load "~/.emacs.d/org_init.el" )

;; Setting up the E-Mail Client (Mu4e)
(load "/home/sschaumburg/.emacs.d/mu4e_init.el")
(setq mail-user-agent 'mu4e-user-agent)

; Custom Functions (All helper functions and whatever)
(load "/home/sschaumburg/.emacs.d/func_init.el")

;; Whatever is left still
(load "~/.emacs.d/various_init.el")

;;w3m Configurations
(load "~/.emacs.d/w3m_init.el")

;; auctex und ac.amath
(load "~/.emacs.d/auctex_init.el")

;;All the Helm Stuff
(load "/home/sschaumburg/.emacs.d/helm_init.el")

;; Python Stuff
(load "~/.emacs.d/python_init.el")

;; keybindings
(load "~/.emacs.d/keybinds.el")

(load "~/.emacs.d/eshell_init.el")


;; garbage collection settings
(setq gc-cons-threshold 50000000)

;; why is this here???
(diminish 'auto-revert-mode)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ac-ispell-requires 4)
 '(background-color "#002b36")
 '(background-mode dark)
 '(cursor-color "#839496")
 '(custom-enabled-themes (quote (zenburn)))
 '(custom-safe-themes (quote ("a7816e280688829bde537faf2a1ec736d383ce6d97e39e1439d65d153143c2fa" "e9bb17437af915e0d16ad22be4965b26c51a3c978ba5778d59c20588ee269c9e" "8aebf25556399b58091e533e455dd50a6a9cba958cc4ebb0aab175863c25b9a4" "9c26d896b2668f212f39f5b0206c5e3f0ac301611ced8a6f74afe4ee9c7e6311" "9370aeac615012366188359cb05011aea721c73e1cb194798bc18576025cabeb" "1e7e097ec8cb1f8c3a912d7e1e0331caeed49fef6cff220be63bd2a6ba4cc365" "fc5fcb6f1f1c1bc01305694c59a1a861b008c534cae8d0e48e4d5e81ad718bc6" "d6a00ef5e53adf9b6fe417d2b4404895f26210c52bb8716971be106550cea257" default)))
 '(dired-listing-switches "-alhog")
 '(font-lock-maximum-decoration (quote ((t . t))))
 '(foreground-color "#839496")
 '(helm-ack-grep-executable "ack")
 '(openwith-associations (quote (("\\.pdf\\'" "evince" (file)) ("\\.docx\\'" "libreoffice" (file)) ("\\.doc\\'" "libreoffice" (file)) ("\\.odt\\'" "libreoffice" (file)) ("\\.\\(?:mpe?g\\|avi\\|wmv\\)\\'" "mplayer" ("-idx" file)) ("\\.epub\\'" "calibre" (file)) ("\\.\\(?:jp?g\\|png\\)\\'" "display" (file))))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 )
