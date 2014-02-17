;; All Helm configuration here
;; (add-to-list 'load-path "/home/sschaumburg/.emacs.d/el-get/package/elpa/helm-20140205.2333")

(use-package helm-config
  :init (helm-mode)
  :diminish helm-mode
  :config (setq  helm-always-two-windows t))


(use-package helm-mu)

(require 'helm-orgcard)

(key-chord-define emacs-lisp-mode-map "qq" 'helm-imenu)
(key-chord-define org-mode-map "qq" 'helm-org-headlines)

;; (add-to-list 'load-path "/home/sschaumburg/.emacs.d/el-get/package/elpa/ac-helm-20131224.647")

(require 'ac-helm)

;; (add-to-list 'load-path "/home/sschaumburg/.emacs.d/el-get/package/elpa/helm-c-yasnippet-20140131.226")
(require 'helm-c-yasnippet)
(setq helm-yas-space-match-any-greedy t) ;[default: nil]


(setq helm-ls-git-status-command 'magit-status)
(setq helm-split-window-default-side 'right)

;; ;; Testing Stuff

;; (setq
;;  helm-grep-default-command                  "ack -Hn --smart-case --no-group --no-color %e %p %f"
;;  helm-grep-default-recurse-command          "ack -H --smart-case --no-group --no-color %e %p %f"
;; )
