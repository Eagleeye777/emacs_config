;; Setting up package and Melpa
(require 'cl)
(require 'package)
(add-to-list 'package-archives
             '("melpa" . "http://melpa.milkbox.net/packages/") t)
(add-to-list 'package-archives
             '("melpa-stable" . "https://stable.melpa.org/packages/") t)

(setq package-pinned-packages '((use-package . "melpa")))

(package-initialize)

;; Further configuration depends on use-package being installed, so make sure the package is loaded
(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))

;; Setting up use-package an use-package-chords
(eval-when-compile
  (require 'use-package))

(use-package use-package-chords
  :ensure   t
  :config (key-chord-mode 1)
  (setq key-chord-two-keys-delay 0.35)
  (setq key-chord-one-key-delay 0.25))

;; ; Setting up El-get here
;; I NO LONGER USE THIS ATM. Keeping the code for potential reuse

;; (add-to-list 'load-path "~/.emacs.d/el-get/el-get")
;; (unless (require 'el-get nil 'noerror)
;;   (with-current-buffer
;;       (url-retrieve-synchronously
;;        "https://raw.github.com/dimitri/el-get/master/el-get-install.el")
;;     (let (el-get-master-branch)
;;       (goto-char (point-max))
;;       (eval-print-last-sexp))))

;; ; list all packages I want to be installed automatically. Hopefully, after a fresh Install this will get everything I want

;; (setq my-el-get-packages
;;       (append
;;        '(
;;          ;;helm
;;          zop-to-char
;;          helm-descbinds
;;          helm-company
;;          helm-c-yasnippet
;;          helm-ls-git
;;          anzu
;;          autopair
;;          ;; bazaar
;;          ;; deft
;;          diminish
;;          dired+
;;          elisp-slime-nav
;;          emacs-w3m
;;          expand-region
;;          flx
;; 	 company-mode
;;          ;; flycheck
;;          ;; flymake
;;          ;;git-emacs
;;          guru-mode
;;          ido-hacks
;;          ido-ubiquitous
;; ;;         jedi
;; 	 discover
;;          key-chord
;;          ;;magit
;;          openwith
;;          projectile
;;          org-gcal
;;          powerline
;;          pydoc-info
;;          python-mode
;; 	 paredit
;;          rainbow-delimiters
;;          smart-operator
;;          smex
;;          twittering-mode
;;          undo-tree
;;          use-package
;;          volatile-highlights
;;          sauron
;; 	 yasnippet


;;                  ;; Call to get everything installed
;;                  (el-get 'sync my-el-get-packages))))
;; (el-get 'sync)
(package-initialize)
