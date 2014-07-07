;; Trying to use John Wigleys use-package here

(require 'ert) ; Usepackage seems to have problem atm. For the time being I have to require this also, not to get an error

(require 'use-package)
;; Keep mode line tidy
(require 'diminish)

;; Loading expand Region here
(use-package expand-region)

;Setup utf8
(prefer-coding-system 'utf-8)
(setq coding-system-for-read 'utf-8)
(setq coding-system-for-write 'utf-8)
(set-default-coding-systems 'utf-8)
(set-terminal-coding-system 'utf-8)
(set-keyboard-coding-system 'utf-8)
(setq default-buffer-file-coding-system 'utf-8)
;; From Emacs wiki
(setq x-select-request-type '(UTF8_STRING COMPOUND_TEXT TEXT STRING))



(setq shift-select-mode t)

;; Changes all yes/no questions to y/n type
(fset 'yes-or-no-p 'y-or-n-p)

;; disable beeping
(setq visible-bell t)

;Use cua Mode
(cua-mode t)
(setq cua-auto-tabify-rectangles nil) ;; Don't tabify after rectangle commands
(transient-mark-mode 1) ;; No region when it is not highlighted

;;moved from better defaults package
  (show-paren-mode 1)
  (setq-default indent-tabs-mode nil)
  (setq
   x-select-enable-clipboard t
   ;; x-select-enable-primary t
   save-interprogram-paste-before-kill t
   apropos-do-all t
   mouse-yank-at-point t
   save-place-file (concat user-emacs-directory "places")
   backup-directory-alist `(("." . ,(concat user-emacs-directory
                                            "backups"))))
;Winner Mode (Nice Addition for quickly reverting window changes)
(when (fboundp 'winner-mode)
  (winner-mode 1))

;Workgroups für Layout Managment
(require 'workgroups)
(diminish 'workgroups-mode)
(setq wg-prefix-key (kbd "C-c w"))
(setq wg-morph-on nil)
(workgroups-mode 1)
(wg-load "~/wg") ;Hier werden meine normalen Workgroups geladen

;;Jumping around in the buffers
(use-package ace-jump-mode)


;; Setting up undo-tree
(use-package undo-tree
  :init (global-undo-tree-mode 1)
  :diminish undo-tree-mode)

;; These are necessary, for later setting up the Keybinds
(defalias 'undo 'undo-tree-undo)
(defalias 'redo 'undo-tree-redo)

;; few dired-fixes
(add-hook 'dired-load-hook
          (function (lambda () (load "dired-x"))))

(put 'dired-find-alternate-file 'disabled nil)


(use-package autopair
  :init (autopair-global-mode) ;; to enable in all buffers
  :diminish autopair-mode)

;; Fixing keybindings for term mode
;; autopair overrides noraml keybindings and causes problems there

(add-hook 'term-mode-hook
           '(lambda ()
             (setq autopair-dont-activate t)
             (autopair-mode -1)))
;; Death to the whitespace :)
(add-hook 'before-save-hook 'delete-trailing-whitespace)

;; (require 'my-context-menu)

(use-package discover
  :init (global-discover-mode 1))

(defmacro hook-into-modes (func modes)
  `(dolist (mode-hook ,modes)
     (add-hook mode-hook ,func)))

(use-package esh-toggle
  :requires eshell
  :bind ("<f6>" . eshell-toggle))
