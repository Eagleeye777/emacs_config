;; All Helm configuration here

(require 'helm-config)
(helm-mode)
(add-to-list 'load-path "~/.emacs.d/el-get/package/elpa/helm-git-20120630.1403")

(require 'helm-git)  ;; 

(autoload 'helm-company "helm-company") ;; Not necessary if using ELPA package
(eval-after-load 'company
  '(progn
     (define-key company-mode-map (kbd "C-:") 'helm-company)
     (define-key company-active-map (kbd "C-:") 'helm-company))
) ;; Helm completion mit Company-backend

(autoload 'helm-mu "helm-mu" "" t)
(autoload 'helm-mu-contacts "helm-mu" "" t)

(require 'helm-orgcard)
