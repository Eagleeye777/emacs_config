;; John Wiegly Macro
(defmacro hook-into-modes (func modes)
  "Beispiel:
 (hook-into-modes #'abbrev-mode
                   'text-mode-hook
                   'prog-mode-hook
'LaTeX-mode-hook)"
  `(dolist (mode-hook ,modes)
     (add-hook mode-hook ,func)))

(use-package validate
  :ensure t)


;; ;;Code from john wiegly
;; (use-package recentf
;;   :defer 10
;;   :commands (recentf-mode
;;              recentf-add-file
;;              recentf-apply-filename-handlers)
;;   :preface
;;   (defun recentf-add-dired-directory ()
;;     (if (and dired-directory
;;              (file-directory-p dired-direuctory)
;;              (not (string= "/" dired-directory)))
;;         (let ((last-idx (1- (length dired-directory))))
;;           (recentf-add-file
;;            (if (= ?/ (aref dired-directory last-idx))
;;                (substring dired-directory 0 last-idx)
;;              dired-directory)))))
;;   :init
;;   (add-hook 'dired-mode-hook 'recentf-add-dired-directory)
;;   :config
;;   (setq recentf-max-saved-items 200)
;;   (recentf-mode 1)
;;   )


;; Loading expand Region here
(use-package expand-region
  :ensure t
  :chords ("cc" . er/expand-region))

;; give this a try and see if it helps
(use-package hungry-delete
  :ensure t
  :defer t
  :config (global-hungry-delete-mode)
  :diminish (hungry-delete-mode))

;;Ensure crux for portable init file
;; :bind (([remap execute-extended-command] . helm-M-x))

(setq kill-whole-line t)
(use-package crux
  :ensure t
  :demand t
  :bind ("C-a" . crux-move-beginning-of-line)
  )
;; have to require because of future setup
;; (require 'crux)

;;;Setup utf8

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
 ;;   save-place-file (concat user-emacs-directory "places")
 backup-directory-alist `(("." . ,(concat user-emacs-directory
                                          "backups"))))
                                        ;Winner Mode (Nice Addition for quickly reverting window changes)
(when (fboundp 'winner-mode)
  (winner-mode 1))


(setq hippie-expand-try-functions-list
      '(yas-hippie-try-expand
        try-expand-all-abbrevs
        try-complete-file-name-partially
        try-complete-file-name
        try-expand-dabbrev
        try-expand-dabbrev-from-kill
        try-expand-dabbrev-all-buffers
        try-expand-list
        try-expand-line
        try-complete-lisp-symbol-partially
        try-complete-lisp-symbol))


;;Jumping around in the buffers
(use-package avy
  :ensure t
  :defer t
  ;;  (("s-." . avy-goto-word-or-subword-1)
  ;; ("s-," . avy-goto-char))
  :config  (setq avy-background nil)
  (setq avy-keys
        (nconc (number-sequence ?a ?z)
               (number-sequence ?A ?Z)
               (number-sequence ?1 ?9)
               '(?0))))

(use-package ace-window
  :ensure t
  :config
  (setq aw-keys '(?a ?s ?d ?f ?g ?h ?j ?k ?l))
  (ace-window-display-mode +1)
  :chords (".w" . ace-window  ))

;; (use-package avy-zap
;;   :ensure t)

;; try if I can get used to this

(use-package smartparens
  :ensure t
  :diminish smartparens-mode
  :config
  (progn
    (require 'smartparens-config)
    (smartparens-global-mode 1)))


;; (use-package smartparens
;;   :ensure t
;;   :init
;;   (use-package smartparens-config)
;;   (smartparens-global-mode)
;;   :diminish (smartparens-mode))

;; Setting up undo-tree
(use-package undo-tree
  :ensure t
  :config
  ;; These are necessary, for later setting up the Keybinds
  (defalias 'undo 'undo-tree-undo)
  (defalias 'redo 'undo-tree-redo)
  :init (global-undo-tree-mode 1)
  :bind
  ("C-z" . undo)
  ("M-z" . redo )
  :diminish undo-tree-mode)

;; few dired-fixes
(add-hook 'dired-load-hook
          (function (lambda () (load "dired-x"))))
(put 'dired-find-alternate-file 'disabled nil)
;; Preview of files in dired

(use-package peep-dired
  :ensure t  )
(use-package dired-sort
  :ensure t)

;; Death to the whitespace :)
(hook-into-modes 'delete-trailing-whitespace '(before-save-hook))

(validate-setq auto-save-interval 100)

(use-package discover
  :ensure t
  :init (global-discover-mode 1))

(use-package esh-toggle
  :requires eshell
  :bind ("<f6>" . eshell-toogle))

(require 'esh-toggle)

(global-set-key (kbd "<f6>") 'eshell-toggle)

;; ;;smooth scrolling
;; (use-package sublimity
;;   :ensure t
;;   :config
;;   (use-package sublimity-scroll)
;;   (sublimity-mode 1)
;;   (setq sublimity-scroll-weight 15
;;         sublimity-scroll-drift-length 30)
;; )
