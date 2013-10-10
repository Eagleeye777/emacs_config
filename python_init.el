;;; this file provides some settings for using python with emacs

;;Setting up pyhton-mode
(autoload 'python-mode "python-mode" "Python Mode." t)
(add-to-list 'auto-mode-alist '("\\.py\\'" . python-mode))
(add-to-list 'interpreter-mode-alist '("python" . python-mode))


; use IPython
(setq-default py-shell-name "ipython")
(setq-default py-which-bufname "IPython")

;emacs iypthon notebook (mal gucken ob ich was damit anfangen kann)
(require 'ein)

(add-hook 'python-mode-hook 'auto-complete-mode)

(add-hook 'python-mode-hook 'jedi:ac-setup)

(add-to-list 'load-path "/home/sschaumburg/.emacs.d/el-get/autopair")

(require 'autopair)

(autopair-global-mode) ;; to enable in all buffers

(add-to-list 'load-path "/home/sschaumburg/.emacs.d/el-get/pymacs")
(autoload 'pymacs-apply "pymacs")
(autoload 'pymacs-call "pymacs")
(autoload 'pymacs-eval "pymacs" nil t)
(autoload 'pymacs-exec "pymacs" nil t)
(autoload 'pymacs-load "pymacs" nil t)
(autoload 'pymacs-autoload "pymacs")
(setq py-load-pymacs-p t)

; ropemacs
(require 'pymacs)
(pymacs-load "ropemacs" "rope-")
