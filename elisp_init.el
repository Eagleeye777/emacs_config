;; Turn on Eldoc
(use-package eldoc
  :ensure t
  :init
  (add-hook 'emacs-lisp-mode-hook 'turn-on-eldoc-mode)
  (add-hook 'lisp-interaction-mode-hook 'turn-on-eldoc-mode)
  (add-hook 'ielm-mode-hook 'turn-on-eldoc-mode)
  :diminish eldoc-mode)


(use-package elisp-slime-nav
  :ensure t
  :init (hook-into-modes #'elisp-slime-nav-mode '(emacs-lock-mode-hook
                                                  emacs-lisp-mode-hook
                                                  ielm-mode-hook ))
  :diminish elisp-slime-nav-mode)
