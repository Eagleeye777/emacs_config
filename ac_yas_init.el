(require 'auto-complete)
(add-to-list 'ac-dictionary-directories "~/.emacs.d/el-get/auto-comlete/ac-dict")
(require 'auto-complete-config)
(ac-config-default)
(global-auto-complete-mode t)

(require 'auto-complete+)
(define-key ac-complete-mode-map [tab] 'ac-expand)  
(set-default 'ac-sources
             '(ac-source-dictionary
               ac-source-words-in-buffer
               ac-source-words-in-same-mode-buffers
               ac-source-semantic
               ac-source-yasnippet))
(add-to-list 'ac-modes 'org-mode)
(require 'yasnippet)
;; (setq yas-snippet-dirs "~/.emacs.d/el-get/yasnippet/snippets")
(setq yas-snippet-dirs '("~/.emacs.d/el-get/yasnippet/snippets"))
(add-to-list 'yas-snippet-dirs ' "~/.emacs.d/snippets")
(require 'yasnippet-config)
(yas-global-mode 1)

(add-hook 'org-mode-hook
          (lambda ()
            (org-set-local 'yas/trigger-key [tab])
            (define-key yas/keymap [tab] 'yas/next-field-or-maybe-expand)))

(defun yas/org-very-safe-expand ()
  (let ((yas/fallback-behavior 'return-nil)) (yas/expand)))

;; make auto-complete work in org mode also 
(add-hook 'org-mode-hook
          (lambda ()
            (make-variable-buffer-local 'yas/trigger-key)
            (setq yas/trigger-key [tab])
            (add-to-list 'org-tab-first-hook 'yas/org-very-safe-expand)
            (define-key yas/keymap [tab] 'yas/next-field)))

(ac-flyspell-workaround)
