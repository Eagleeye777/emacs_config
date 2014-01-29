;; All Helm configuration here

(require 'helm-config)
(helm-mode)
(add-to-list 'load-path "~/.emacs.d/el-get/package/elpa/helm-git-20120630.1403")

(require 'helm-git)  ;; 


(autoload 'helm-mu "helm-mu" "" t)
(autoload 'helm-mu-contacts "helm-mu" "" t)

(add-to-list 'load-path "/home/sschaumburg/.emacs.d/el-get/package/elpa/helm-orgcard-20130608.430")

(require 'helm-orgcard)

(key-chord-define emacs-lisp-mode-map "qq" 'helm-imenu)
(key-chord-define org-mode-map "qq" 'helm-org-headlines)

(add-to-list 'load-path "/home/sschaumburg/.emacs.d/el-get/package/elpa/ac-helm-20131224.647")

(require 'ac-helm)
