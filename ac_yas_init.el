(require 'yasnippet)
(setq yas-snippet-dirs '("~/.emacs.d/el-get/yasnippet/snippets"))
(add-to-list 'yas-snippet-dirs ' "~/.emacs.d/snippets")
(require 'yasnippet-config)
(yas-global-mode 1)
(diminish 'yas-minor-mode)
;; (yas/set-ac-modes)


(require 'auto-complete)
(add-to-list 'ac-dictionary-directories "~/.emacs.d/el-get/auto-comlete/ac-dict")

(require 'auto-complete-config)
(ac-config-default)

;; (require 'auto-complete+)
;; (define-key ac-complete-mode-map [tab] 'ac-expand)

(set-default 'ac-sources
'(ac-source-dictionary
ac-source-words-in-buffer
ac-source-words-in-same-mode-buffers
ac-source-semantic
ac-source-yasnippet))

(ac-flyspell-workaround)


;; Das hier war ein Versuch, die Auto-complete-Config Datei zu überladen. Ich hätte gerne die genaue Funktion aufgerufen, allerdings einige Dinge einfach gestrichen. Laut Stackoverflow hätte das eigentlich auch gehen müssen, tut es aber nun doch nicht. 
;; http://stackoverflow.com/questions/15717103/preferred-method-of-overriding-an-emacs-lisp-function

;; (eval-after-load "auto-complete-config"
;;  '(defun ac-config-default ()
;;     (setq-default ac-sources '(ac-source-abbrev ac-source-dictionary ac-source-words-in-same-mode-buffers))
;;     (add-hook 'emacs-lisp-mode-hook 'ac-emacs-lisp-mode-setup)
;;     (add-hook 'c-mode-common-hook 'ac-cc-mode-setup)
;;     (add-hook 'ruby-mode-hook 'ac-ruby-mode-setup)
;;     (add-hook 'css-mode-hook 'ac-css-mode-setup)
;;     (add-hook 'auto-complete-mode-hook 'ac-common-setup)))


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

    
