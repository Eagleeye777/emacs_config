;;; package init.el 

;;.emacs configuration File

;; Loading all the various init files here

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
;; auctex und ac.amath
(load "~/.emacs.d/auctex_init.elc")
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


; Custom Keybindings 
(global-set-key (kbd "C-a") 'mark-whole-buffer) ; Alt+a
(global-set-key (kbd "C-b") ' helm-mini)
(global-set-key (kbd "<f2>") 'cua-mode) ; 
(global-set-key (kbd "<f3>") ' mu4e)
(global-set-key (kbd "<f4>") 'goto-line) ; 
(global-set-key (kbd "<f5>") 'delete-window) ; 
(global-set-key (kbd "<f6>") 'visit-ansi-term)
(global-set-key (kbd "<f7>") ' magit-status)
(global-set-key (kbd "M-<") ' prelude-google)
(global-set-key (kbd "C-<") ' browse-url)
(global-set-key (kbd "C-x C-o") 'browse-url-at-point)
(global-set-key (kbd "C-c y") 'bury-buffer)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(dired-listing-switches "-alhog")
 '(gnutls-min-prime-bits 1024))
(custom-set-faces)
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
;; '(default ((t (:background "black")))))

;;(add-to-list 'load-path "/home/sschaumburg/.emacs.d/el-get/sauron")
;;(require 'sauron)
;;(setq sauron-dbus-cookie t)
;; gnus (gnus habe ich gerade verworfen)
;(load "~/emacs.d/gnus_init.el")

