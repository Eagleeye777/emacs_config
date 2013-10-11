;; Changes all yes/no questions to y/n type
(fset 'yes-or-no-p 'y-or-n-p)
;; disable beeping
(setq visible-bell t)
;Der cua Mode 
(cua-mode t)
(setq cua-auto-tabify-rectangles nil) ;; Don't tabify after rectangle commands
(transient-mark-mode 1) ;; No region when it is not highlighted

;better defaults package
(load "~/.emacs.d/better-defaults")
; comes in handy for managing the state of changes during longer edits (see C-x u)
(require'undo-tree)
(global-undo-tree-mode 1)
(defalias 'redo 'undo-tree-redo)
(global-set-key (kbd "C-z") 'undo) ; 【Ctrl+z】
(global-set-key (kbd "M-z") 'redo) ; 【ALT+z】


(autoload 'browse-kill-ring"" "" t)

;Windcycle (für Buffer Navigation)
(autoload 'windcycle "" "" t)

;Winner Mode (Nice Addition for quickly reverting window changes)
(when (fboundp 'winner-mode)
  (winner-mode 1))

;Workgroups für Layout Managment
(require 'workgroups)
(setq wg-prefix-key (kbd "C-c w"))
(workgroups-mode 1)
(wg-load "~/wg") ;Hier werden meine normalen Workgroups geladen

;für flycheck
(add-hook 'after-init-hook 'global-flycheck-mode)
