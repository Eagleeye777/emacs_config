;; Setting up package and Melpa
(require 'cl)
(require 'package)
(add-to-list 'package-archives
             '("melpa" . "http://melpa.milkbox.net/packages/") t)


;; ; Setting up El-get here

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
