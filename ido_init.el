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
      ido-use-virtual-buffers t)

(ido-mode t)
