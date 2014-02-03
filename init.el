;;.emacs configuration File minimal settings

;; Fixing a gnutls error warning and raising sercurity level of tls encyption
(setq gnutls-min-prime-bits '"1024")

;; !!!! Do this one first, so everything is already on the load path

;; Allgemeine grundlegende Einstellungen
(load "/home/sschaumburg/.emacs.d/gen_init.el")

;; Display Settings
(load "~/.emacs.d/layout_init.el")


;;All the Ido Stuff
(load "~/.emacs.d/ido_init.el")


;; Whatever is left still
(load "~/.emacs.d/various_init.el")


;; keybindings
(load "~/.emacs.d/keybinds.el")


(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(dired-listing-switches "-alhog")
 '(font-lock-maximum-decoration (quote ((t . t))))
)
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
)
