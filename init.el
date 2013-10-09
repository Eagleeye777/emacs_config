;;;.emacs configuration File
(require 'epa-file)
(epa-file-enable)
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
(load "~/.emacs.d/ido_init.elc")
;; Alle möglichen anderen Packete
(load "/home/sschaumburg/.emacs.d/various_init.elc")

; Custom Keybindings 
(global-set-key (kbd "<f6>") 'visit-ansi-term)
(global-set-key (kbd "<f4>") 'goto-line) ; 
(global-set-key (kbd "<f5>") 'delete-window) ; 
(global-set-key (kbd "<f2>") 'cua-mode) ; 
(global-set-key (kbd "C-a") 'mark-whole-buffer) ; Alt+a
(global-set-key (kbd "C-b") ' helm-mini)
(global-set-key (kbd "<f3>") ' mu4e)


(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-enabled-themes (quote (tango-dark)))
 '(dired-listing-switches "-alhog")
 '(gnutls-min-prime-bits 1024))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
;; hier
 ;; If you edit it by hand, you could mess it up, so ber careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(mode-line ((t (:background "yellow green" :foreground "black" :box (:line-width -1 :style released-button)))))
 '(mode-line-inactive ((t (:inherit mode-line :background "gray37" :foreground "dark orange" :box (:line-width -1 :style released-button) :weight light)))))


;;(add-to-list 'load-path "/home/sschaumburg/.emacs.d/el-get/sauron")
;;(require 'sauron)
;;(setq sauron-dbus-cookie t)
;; gnus (gnus habe ich gerade verworfen)
;(load "~/emacs.d/gnus_init.el")
(add-to-list 'load-path "/home/sschaumburg/.emacs.d/el-get/helm")
(require 'helm-config)
