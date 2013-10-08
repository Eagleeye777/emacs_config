;; Changes all yes/no questions to y/n type
(fset 'yes-or-no-p 'y-or-n-p)

;Der cua Mode 
(cua-mode t)
(setq cua-auto-tabify-rectangles nil) ;; Don't tabify after rectangle commands
(transient-mark-mode 1) ;; No region when it is not highlighted

;better defaults package
(add-to-list 'load-path "/home/sschaumburg/.emacs.d/better-defaults")
(require 'better-defaults)

(add-to-list 'load-path "/home/sschaumburg/.emacs.d/el-get/undo-tree")
(require'undo-tree)
(global-undo-tree-mode 1)
(defalias 'redo 'undo-tree-redo)
(global-set-key (kbd "C-z") 'undo) ; 【Ctrl+z】
(global-set-key (kbd "M-z") 'redo) ; 【ALT+z】


(add-to-list 'load-path "/home/sschaumburg/.emacs.d/el-get/browse-kill-ring")
(require 'browse-kill-ring)

;Windcycle (für Buffer Navigation)
(add-to-list 'load-path "/home/sschaumburg/.emacs.d/el-get/windcycle")
(autoload 'windcycle "" "" t)

;Workgroups für Layout Managment

(add-to-list 'load-path "/home/sschaumburg/.emacs.d/el-get/workgroups")
(require 'workgroups)
(setq wg-prefix-key (kbd "C-c w"))
(workgroups-mode 1)
(wg-load "~/wg") ;Hier werden meine normalen Workgroups geladen

;für flycheck
(add-hook 'after-init-hook 'global-flycheck-mode)
