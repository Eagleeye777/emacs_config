
;; Turn on Eldoc

(add-hook 'emacs-lisp-mode-hook 'turn-on-eldoc-mode)
(add-hook 'lisp-interaction-mode-hook 'turn-on-eldoc-mode)
(add-hook 'ielm-mode-hook 'turn-on-eldoc-mode)

;; Elisp starts in paredit by default
(autoload 'enable-paredit-mode "paredit"
  "Turn on pseudo-structural editing of Lisp code."
  t)

(add-hook 'emacs-lisp-mode-hook 'enable-paredit-mode)

;; So we turn-off autopair in elisp-modes
(add-hook 'emacs-lisp-mode-hook
          #'(lambda ()
            (setq autopair-dont-activate t)
            (autopair-mode -1)))

(add-hook 'lisp-interaction-mode-hook
          #'(lambda ()
            (setq autopair-dont-activate t)
            (autopair-mode -1)))


(use-package elisp-slime-nav
  :init
  (hook-into-modes #'elisp-slime-nav  '(emacs-lock-mode-hook
                                        ielm-mode-hook
                                        ))
  :diminish elisp-slime-nav-mode)
