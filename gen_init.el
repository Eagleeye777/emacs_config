;; Loading expand Region here
(autoload 'expand-region "" "" t)


;; Changes all yes/no questions to y/n type
(fset 'yes-or-no-p 'y-or-n-p)

;; disable beeping
(setq visible-bell t)

;Der cua Mode 
(cua-mode t)
(setq cua-auto-tabify-rectangles nil) ;; Don't tabify after rectangle commands
(transient-mark-mode 1) ;; No region when it is not highlighted

;; Cosmetics

;;moved from better defaults package
  (show-paren-mode 1)
  (setq-default indent-tabs-mode nil)
  (setq x-select-enable-clipboard t
        x-select-enable-primary t
        save-interprogram-paste-before-kill t
        apropos-do-all t
        mouse-yank-at-point t
        save-place-file (concat user-emacs-directory "places")
        backup-directory-alist `(("." . ,(concat user-emacs-directory
                                                 "backups"))))


(autoload 'diminish "" "" t)
;; (require 'diminish)

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

;;Jumping around in the buffers  
(autoload
  'ace-jump-mode
  "ace-jump-mode"
  "Emacs quick move minor mode"
  t)

(add-to-list 'load-path "/home/sschaumburg/.emacs.d/el-get/package/elpa/ace-jump-buffer-20131221.759")
(require 'ace-jump-buffer)



;; Setting up undo-tree
(require'undo-tree)
(global-undo-tree-mode 1)
(diminish 'undo-tree-mode)

;; These are necessary, for later setting up the Keybinds
(defalias 'undo 'undo-tree-undo)
(defalias 'redo 'undo-tree-redo)

;; Browse kill ring settings
;; Turning these off in Favour of helm-kill ring stuff
;; (autoload 'browse-kill-ring"" "" t)
;; (browse-kill-ring-default-keybindings) ;; use M-y for browsing and selecting from Killring
;; (setq browse-kill-ring-highlight-current-entry t)
;; (setq browse-kill-ring-no-duplicates t)
;; (setq browse-kill-ring-display-duplicates nil)
;; (setq browse-kill-ring-highlight-inserted-item nil)



;; few dired-fixes
(add-hook 'dired-load-hook
          (function (lambda () (load "dired-x"))))

(put 'dired-find-alternate-file 'disabled nil)


(require 'autopair)
(autopair-global-mode) ;; to enable in all buffers
(diminish 'autopair-mode)

;; Fixing keybindings for term mode 
;; autopair overrides noraml keybindings and causes problems there
(add-hook 'term-mode-hook
           '(lambda ()
             (setq autopair-dont-activate t)
             (autopair-mode -1)))
