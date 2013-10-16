(require 'auto-complete)
(add-to-list 'ac-dictionary-directories "~/.emacs.d/el-get/auto-comlete/ac-dict")
(require 'auto-complete-config)
(ac-config-default)
(global-auto-complete-mode t)
(require 'auto-complete+)

;; Changes all yes/no questions to y/n type
(fset 'yes-or-no-p 'y-or-n-p)

;; disable beeping
(setq visible-bell t)

;Der cua Mode 
(cua-mode t)
(setq cua-auto-tabify-rectangles nil) ;; Don't tabify after rectangle commands
(transient-mark-mode 1) ;; No region when it is not highlighted

;;better defaults package
(load "~/.emacs.d/better-defaults")

(require 'diminish)

(require'undo-tree)
(global-undo-tree-mode 1)
(diminish 'undo-tree-mode)
(defalias 'undo 'undo-tree-undo)
(defalias 'redo 'undo-tree-redo)
(global-set-key (kbd "C-z") 'undo) ; 【Ctrl+z】
(global-set-key (kbd "M-z") 'redo) ; 【ALT+z】

(autoload 'browse-kill-ring"" "" t)
(browse-kill-ring-default-keybindings) ;; use M-y for browsing and selecting from Killring

;Windcycle (für Buffer Navigation)

(autoload 'windcycle "" "" t)

;Winner Mode (Nice Addition for quickly reverting window changes)
(when (fboundp 'winner-mode)
  (winner-mode 1))

;Workgroups für Layout Managment
(require 'workgroups)
(diminish 'workgroups-mode)
(setq wg-prefix-key (kbd "C-c w"))
(workgroups-mode 1)
(wg-load "~/wg") ;Hier werden meine normalen Workgroups geladen

;für flycheck
(add-hook 'after-init-hook 'global-flycheck-mode)

;;(add-hook 'dired-load-hook
  ;;        (function (lambda () (load "dired-x"))))
