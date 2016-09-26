;;; various_init.el -- Putting a bunch of stuff here that found no other place yet

(use-package disable-mouse
  :ensure t
  :config (global-disable-mouse-mode 1))

;; ace-isearch
(use-package ace-isearch
  :ensure t
  :config
  (setq ace-isearch-function 'avy-goto-char)
  (global-ace-isearch-mode 1)
  :diminish (ace-isearch-mode)
  )

;; Twittering mode
;; (use-package twittering-mode
;;   :ensure t
;;   :config (setq twittering-use-master-password t)
;;   (setq twittering-icon-mode t)
;;   (add-hook 'twittering-mode-hook 'sauron-start)
;;   )

;;magit stuff : Git-Version Controll for emacs
(use-package magit
  :ensure t
  :config
  (eval-after-load 'magit
    '(progn
       (set-face-foreground 'magit-diff-added "green4")
       (set-face-foreground 'magit-diff-removed "red3")
       (setq magit-repository-directories "~/.emacs.d")
       ))
  :bind ("<f7>" . magit-status)
  )

;; Pdf's aus emacs an evince weitergeben
(use-package openwith
  :ensure   t
  :init (openwith-mode t))

;; .zsh file is shell script too
(add-to-list 'auto-mode-alist '("\\.zsh\\'" . shell-script-mode))

;; flyspell-mode does spell-checking on the fly as you type
(use-package flyspell
  :ensure t
  :diminish flyspell-mode
  )

(use-package ispell
  :config (setq ispell-program-name "aspell" ; use aspell instead of ispell
                ispell-extra-args '("--sug-mode=ultra")
                ispell-dictionary "german8"
                ispell-silently-savep t)
  )
(use-package validate
  :ensure t  )

;;fixing open-with attachemnt trouble Here
(require 'mm-util)
(add-to-list 'mm-inhibit-file-name-handlers 'openwith-file-handler)

;; (use-package sauron
;;   :config (setq sauron-dbus-cookie t))

;; Improved zap-to char functionallyty
(use-package zop-to-char
  :ensure t)

;; (require 'hideshow)
;; (diminish 'hs-minor-mode)
;; (add-hook 'prog-mode-hook 'hs-minor-mode)

;; Stuff to make preview pane working as I want to
;; I might have to manually reenable openwith afterwards though
(add-hook 'latex-mode-hook '(lambda () (openwith-mode -1)))
(setq doc-view-continuous t)

;; Automatically byte-compile elisp-files
(add-hook 'after-save-hook 'byte-compile-current-buffer)


;; Setting up registers for quick jump to specified files Hat glaub
;; ich eher symbolischen Charakter. Aktuell finde ich Bookmarks um
;; einiges praktischer
(defvar my/refile-map (make-sparse-keymap))

(defmacro my/defshortcut (key file)
  `(progn
     (set-register ,key (cons 'file ,file))
     (define-key my/refile-map
       (char-to-string ,key)
       (lambda (prefix)
         (interactive "p")
         (let ((org-refile-targets '(((,file) :maxlevel . 6)))
               (current-prefix-arg (or current-prefix-arg '(4))))
           (call-interactively 'org-refile))))))

(my/defshortcut ?i "~/.emacs.d/init.el")
(my/defshortcut ?g "~/.emacs.d/gen_init.el")
(my/defshortcut ?l "~/.emacs.d/layout_init.el")
(my/defshortcut ?s "~/Dropbox/org/spiritual.org")
(my/defshortcut ?d "~/Dropbox/org/default.org")

(defun disable-final-newline ()
  (if (equal (file-name-extension buffer-file-name)
             "plstore")
      (setq require-final-newline nil)))
(add-hook 'write-file-functions 'disable-final-newline)

(use-package bbdb
  :config
  (setq bbdb-file "~/Dropbox/bbdb")
  )
(use-package bbdb-vcard)

;;(use-package switch-window
;;  :ensure t
;;  :config
;;  (setq-default switch-window-shortcut-style 'alphabet)
;;  (setq-default switch-window-timeout nil)
;;  :bind (([remap other-window] . switch-window)))
