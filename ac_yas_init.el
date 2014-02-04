(require 'yasnippet)
(setq yas-snippet-dirs '("~/.emacs.d/el-get/yasnippet/snippets"))
(add-to-list 'yas-snippet-dirs ' "~/.emacs.d/snippets")
(require 'yasnippet-config)
(yas-global-mode 1)
(diminish 'yas-minor-mode)


(require 'auto-complete)
(add-to-list 'ac-dictionary-directories "~/.emacs.d/el-get/auto-comlete/ac-dict")

(require 'auto-complete-config)
(ac-config-default)

(require 'ac-dabbrev)
(add-to-list 'ac-sources 'ac-source-dabbrev)

(set-default 'ac-sources
'(ac-source-dictionary
ac-source-words-in-buffer
ac-source-words-in-same-mode-buffers
ac-source-semantic
ac-source-yasnippet))


;; Loading company mode also, for completion in org

(add-to-list 'load-path "/home/sschaumburg/.emacs.d/el-get/package/elpa/company-20140130.2109")

(require 'company)

(setq company-idle-delay 0.3 )
(setq company--include-capf t)

(defun add-pcomplete-to-capf ()
  (add-hook 'completion-at-point-functions 'pcomplete-completions-at-point nil t))

(add-hook 'org-mode-hook #'add-pcomplete-to-capf)


;; ;; Fixes für yasnippet und org, nach org-mode Anleitung
;; (add-hook 'org-mode-hook
;;           (lambda ()
;;             (org-set-local 'yas/trigger-key [tab])
;;             (define-key yas/keymap [tab] 'yas/next-field-or-maybe-expand)))

;; (defun yas/org-very-safe-expand ()
;;   (let ((yas/fallback-behavior 'return-nil)) (yas/expand)))

;; ;; make auto-complete work in org mode also
;; (add-hook 'org-mode-hook
;;           (lambda ()
;;             (make-variable-buffer-local 'yas/trigger-key)
;;             (setq yas/trigger-key [tab])
;;             (add-to-list 'org-tab-first-hook 'yas/org-very-safe-expand)
;;             (define-key yas/keymap [tab] 'yas/next-field)))

;; Damit autocomplete auch noch funktioninert, wenn die flyspell Rechtschreibprüfung aktiv ist (Default!!!)
