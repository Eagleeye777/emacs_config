;;; package ido_init.el ---  Setting up ido

;;; Ein paar leere Variablen definieren, damit der Compiler beim Starten nicht meckert.
(defvar ido-default-item nil)
(defvar predicate nil)
(defvar inherit-input-method nil)
(defvar ido-cur-list nil)

;; Verhalten von ido definieren
(setq ido-enable-flex-matching t
      ido-everywhere t
      ido-enable-prefix nil
      ido-use-filename-at-point 'guess
      ido-create-new-buffer 'always
      ido-create-new-buffer 'always
      ido-use-virtual-buffers t)


;; Redefining some ido-keys here
(defun my-ido-define-keys ()
  (define-key ido-completion-map (kbd "C-n") 'ido-next-match)
  (define-key ido-completion-map (kbd "C-p") 'ido-prev-match))

(add-hook 'ido-setup-hook 'my-ido-define-keys)

(ido-mode t)
; zusätzlich ido-ubi laden
(require 'ido-ubiquitous)
(ido-ubiquitous-mode t)
;; better flx matching
(require 'flx-ido)
(flx-ido-mode +1)

;; Smex (Ido für M-x)
(require 'smex)
(smex-initialize)

;; Ido hacks laden (speeding things up)
(require 'ido-hacks)
(ido-hacks-mode)
