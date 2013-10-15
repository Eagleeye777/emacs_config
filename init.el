;;; package init.el 

;;.emacs configuration File
;; Loading all the various init files here

;; el get und Package repos
;; !!!! Do this one first, so everything is already on the load path
(defvar flx-ido-mode nil)

(load "~/.emacs.d/package_init.el")
;; Allgemeine grundlegende Einstellungen
(load "/home/sschaumburg/.emacs.d/gen_init.el")
;; Display Settings
(load "~/.emacs.d/layout_init.el")
; setting up org mode and deft(extern File)
(load "~/.emacs.d/org_init.el" )
;; Mail Client der Wahl
(load "/home/sschaumburg/.emacs.d/mu4e_init.el")
(setq mail-user-agent 'mu4e-user-agent)
; Custom Functions 
(load "/home/sschaumburg/.emacs.d/func_init.el")
;; el get und Package repos
(load "~/.emacs.d/package_init.el")
;;alles zu ido
(load "~/.emacs.d/ido_init.el")
;; Alle möglichen anderen Packete
(load "~/.emacs.d/various_init.el")
;; Python Stuff
(load "~/.emacs.d/python_init.el")
;;w3m Configurations
(load "~/.emacs.d/w3m_init.el")
;; auctex und ac.amath
(load "~/.emacs.d/auctex_init.el")
;; keybindings
(load "~/.emacs.d/keybinds.el")
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ansi-color-names-vector ["#212526" "#ff4b4b" "#b4fa70" "#fce94f" "#729fcf" "#ad7fa8" "#8cc4ff" "#eeeeec"])
 '(custom-enabled-themes (quote (zenburn)))
 '(custom-safe-themes (quote ("2c73700ef9c2c3aacaf4b65a7751b8627b95a1fd8cebed8aa199f2afb089a85f" "412c7c16681ae6182aa44ef1b05fdea5cc156493f4b2f9f680499fed6d7b8c7d" "47195d85e4786b0f5877d0eca48e807e22b32c00c95c34deedbb842072e486bb" "68769179097d800e415631967544f8b2001dae07972939446e21438b1010748c" "b0397cd02547a5cbd1726ca58ec12464067abc396901e9db0a7d13691ab2e476" "d6a00ef5e53adf9b6fe417d2b4404895f26210c52bb8716971be106550cea257" default)))
 '(dired-listing-switches "-alhog")
 '(gnutls-min-prime-bits 1024))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:background "nil"))))
 '(mode-line ((t (:background "#5c888b" :foreground "#f0dfaf" :box (:line-width 2 :color "#1e2320"))))))

;;(add-to-list 'load-path "/home/sschaumburg/.emacs.d/el-get/sauron")
;;(require 'sauron)
;;(setq sauron-dbus-cookie t)
;; gnus (gnus habe ich gerade verworfen)
;(load "~/emacs.d/gnus_init.el")
(add-to-list 'load-path "/home/sschaumburg/.emacs.d/el-get/auto-complete+")
(require 'auto-complete+)

;; reduce the frequency of garbage collection by making it happen on
;; each 50MB of allocated data (the default is on every 0.76MB)
(setq gc-cons-threshold 50000000)
