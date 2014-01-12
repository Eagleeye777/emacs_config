;;; this file provides some settings for using python with emacs
(package-initialize)
(elpy-enable)
;; (elpy-use-ipython "ipython3")

;; ;;Setting up pyhton-mode
(require 'python-mode)
(add-to-list 'auto-mode-alist '("\\.py\\'" . python-mode))
(add-to-list 'interpreter-mode-alist '("python" . python-mode))

(setq-default py-shell-name "ipython3")
(setq-default py-which-bufname "IPython3")

;; ; use the wx backend, for both mayavi and matplotlib
(setq py-python-command-args
  '("--gui=wx" "--pylab=wx" "-colors" "Linux"))
(setq py-force-py-shell-name-p t)

(setq py-shell-switch-buffers-on-execute-p t)
(setq py-smart-indentation t)

;; ;; ; switch to the interpreter after executing code
;; ;; (setq py-shell-switch-buffers-on-execute-p t)
;; ;; (setq py-switch-buffers-on-execute-p t)
;; ;; ; don't split windows
;; ;; (setq py-split-windows-on-execute-p nil)
;; ;; ; try to automagically figure out indentation

(add-hook 'python-mode-hook 'auto-complete-mode)
(add-hook 'python-mode-hook 'jedi:ac-setup)

;; ;emacs iypthon notebook (mal gucken ob ich was damit anfangen kann)
;; ;;(require 'ein)

;; ;; (add-to-list 'load-path "/home/sschaumburg/.emacs.d/el-get/pymacs")
;; ;; (autoload 'pymacs-apply "pymacs")
;; ;; (autoload 'pymacs-call "pymacs")
;; ;; (autoload 'pymacs-eval "pymacs" nil t)
;; ;; (autoload 'pymacs-exec "pymacs" nil t)
;; ;; (autoload 'pymacs-load "pymacs" nil t)
;; ;; (autoload 'pymacs-autoload "pymacs")
;; ;; (setq py-load-pymacs-p t)

;; ; ropemacs
;; ;;(require 'pymacs)
;; ;;(pymacs-load "ropemacs" "rope-")


;; ;; (add-hook 'python-mode-hook
;; ;;          (lambda ()
;; ;;          (jedi:setup)
;; ;;          (jedi:ac-setup)
;; ;;             (local-set-key "\C-cd" 'jedi:show-doc)
;; ;;             (local-set-key (kbd "M-q") 'jedi:complete)
;; ;;             (local-set-key (kbd "M-.") 'jedi:goto-definition)))

;; ;; Flymake settings for Python
(defun flymake-python-init ()
  (let* ((temp-file (flymake-init-create-temp-buffer-copy
                     'flymake-create-temp-inplace))
         (local-file (file-relative-name
                      temp-file
                      (file-name-directory buffer-file-name))))
    (list "epylint" (list local-file))))

(defun flymake-activate ()
  "Activates flymake when real buffer and you have write access"
  (if (and
       (buffer-file-name)
       (file-writable-p buffer-file-name))
      (progn
        (flymake-mode t)
        ;; this is necessary since there is no flymake-mode-hook...
        (local-set-key (kbd "C-c n") 'flymake-goto-next-error)
        (local-set-key (kbd "C-c p") 'flymake-goto-prev-error))))

(defun ca-flymake-show-help ()
  (when (get-char-property (point) 'flymake-overlay)
    (let ((help (get-char-property (point) 'help-echo)))
      (if help (message "%s" help)))))

(add-hook 'post-command-hook 'ca-flymake-show-help)


(add-to-list 'flymake-allowed-file-name-masks
             '("\\.py\\'" flymake-python-init))

(add-hook 'python-mode-hook 'flymake-activate)
(add-hook 'python-mode-hook 'auto-complete-mode)
