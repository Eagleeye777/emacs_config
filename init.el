;;; package init.el 

;;.emacs configuration File
;; Loading all the various init files here

;; el get und Package repos
;; !!!! Do this one first, so everything is already on the load path
(load "~/.emacs.d/package_init.elc")
;; Allgemeine grundlegende Einstellungen
(load "/home/sschaumburg/.emacs.d/gen_init.elc")
;; Display Settings
(load "~/.emacs.d/layout_init.elc")
; setting up org mode and deft(extern File)
(load "~/.emacs.d/org_init.elc" )
;; Mail Client der Wahl
(load "/home/sschaumburg/.emacs.d/mu4e_init.elc")
(setq mail-user-agent 'mu4e-user-agent)
; Custom Functions 
(load "/home/sschaumburg/.emacs.d/func_init.elc")
;; el get und Package repos
(load "~/.emacs.d/package_init.elc")
;;alles zu ido
(load "~/.emacs.d/ido_init.elc")
;; Alle möglichen anderen Packete
(load "~/.emacs.d/various_init.elc")
;; Python Stuff
(load "~/.emacs.d/python_init.elc")
;;w3m Configurations
(load "~/.emacs.d/w3m_init.elc")
;; auctex und ac.amath
(load "~/.emacs.d/auctex_init.elc")

;; keybindings
(load "~/.emacs.d/keybinds.elc")


(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ansi-color-names-vector ["#212526" "#ff4b4b" "#b4fa70" "#fce94f" "#729fcf" "#ad7fa8" "#8cc4ff" "#eeeeec"])
 '(custom-enabled-themes (quote (zenburn)))
 '(custom-safe-themes (quote ("68769179097d800e415631967544f8b2001dae07972939446e21438b1010748c" "b0397cd02547a5cbd1726ca58ec12464067abc396901e9db0a7d13691ab2e476" "d6a00ef5e53adf9b6fe417d2b4404895f26210c52bb8716971be106550cea257" default)))
 '(dired-listing-switches "-alhog")
 '(gnutls-min-prime-bits 1024))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

;;(add-to-list 'load-path "/home/sschaumburg/.emacs.d/el-get/sauron")
;;(require 'sauron)
;;(setq sauron-dbus-cookie t)
;; gnus (gnus habe ich gerade verworfen)
;(load "~/emacs.d/gnus_init.el")
(add-to-list 'load-path "/home/sschaumburg/.emacs.d/el-get/auto-complete+")
(require 'auto-complete+)
