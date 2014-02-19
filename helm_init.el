;; All Helm configuration here
;; (add-to-list 'load-path "/home/sschaumburg/.emacs.d/el-get/package/elpa/helm-20140205.2333")

(use-package helm-config
  :init (helm-mode)
  :diminish helm-mode
  :config (setq  helm-always-two-windows t)
  (setq helm-split-window-default-side 'right))

(use-package helm-mu)

(require 'helm-orgcard)

(key-chord-define emacs-lisp-mode-map "qq" 'helm-imenu)
(key-chord-define org-mode-map "qq" 'helm-org-headlines)


(use-package ac-helm)

(use-package helm-c-yasnippet
  :config
  (setq helm-yas-space-match-any-greedy t))
 ;[default: nil]

(use-package helm-ls-git
  :config (setq helm-ls-git-status-command 'magit-status))


(use-package helm-descbinds
  :init helm-descbinds-mode
  :config (setq helm-descbinds-window-style 'split-window))


;; ;; Testing Stuff

;; (setq
;;  helm-grep-default-command                  "ack -Hn --smart-case --no-group --no-color %e %p %f"
;;  helm-grep-default-recurse-command          "ack -H --smart-case --no-group --no-color %e %p %f"
;; )
