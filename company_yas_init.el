;; (require 'yasnippet)
(use-package yasnippet
  :ensure t
  :config (setq yas-snippet-dirs '("/home/deepthought/.emacs.d/snippets/"))
  :init (yas-global-mode 1)
  :diminish (yas-minor-mode)  )


;; Loading company mode for completion in org
(use-package company
  :ensure t
  :config
  (setq company-idle-delay 0.3 )
  ;; set default `company-backends'
  (setq company-include-capf t)
  (setq company-backends
        '((company-files)
          ;; (company-ispell)
          (company-abbrev company-dabbrev company-capf company-yasnippet)))

  ;; (add-hook 'org-mode-hook
  ;;           (lambda ()
  ;;             (add-to-list (make-local-variable 'company-backends)
  ;;                          'company-ispell)))


  :init (global-company-mode t)
  :diminish (company-mode))


;;Setting up this package, to quickly switch backends, if company
;;completion does not find anything suitable. Other backend will be
;;used then
(use-package company-try-hard
  :ensure   t
  :bind   ("C-ö" . company-try-hard))

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
