;;; package ido_init.el ---  Setting up ido
;; Ein paar leere Variablen definieren, damit der Compiler beim Starten nicht meckert. 
(defvar ido-default-item nil)
(defvar predicate nil)
(defvar inherit-input-method nil)
(defvar ido-cur-list nil)

; normale Konfiguration
;; auskommentiertes wird schon in better defaults so gesetzt
;;(setq ido-enable-flex-matching t)
(setq ido-everywhere t)
(ido-mode 1) 

; zusätzlich ido-ubi laden 
(add-to-list 'load-path "/home/sschaumburg/.emacs.d/el-get/ido-ubiquitous")
(require 'ido-ubiquitous)
(ido-ubiquitous-mode t)
(setq ido-use-filename-at-point 'guess)
(setq ido-create-new-buffer 'always)
(setq ido-use-virtual-buffers t)
(add-to-list 'load-path "/home/sschaumburg/.emacs.d/el-get/ido-hacks")

;; Smex
(add-to-list 'load-path "/home/sschaumburg/.emacs.d/el-get/smex")
(require 'smex) 
(smex-initialize) 
;; Ido hacks laden 
(require 'ido-hacks)
(ido-hacks-mode)
;; Important (set this keybind after ido-hacks)                  
(global-set-key (kbd "M-x") 'smex)
(global-set-key (kbd "M-X") 'smex-major-mode-commands)
;; This is your old M-x.
(global-set-key (kbd "C-c C-c M-x") 'execute-extended-command)


