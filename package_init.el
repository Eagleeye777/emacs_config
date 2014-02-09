;; Setting up package and Melpa
(require 'cl)
(require 'package)
(add-to-list 'package-archives
 '("melpa" . "http://melpa.milkbox.net/packages/") t)

(package-initialize)

; Setting up El-get here

(add-to-list 'load-path "~/.emacs.d/el-get/el-get")
(unless (require 'el-get nil 'noerror)
  (with-current-buffer
      (url-retrieve-synchronously
       "https://raw.github.com/dimitri/el-get/master/el-get-install.el")
    (let (el-get-master-branch)
      (goto-char (point-max))
      (eval-print-last-sexp))))

; list all packages I want to be installed automatically. Hopefully, after a fresh Install this will get everything I want

(setq my-el-get-packages
      (append
       '(
         ace-jump-mode
         ac-math
         anzu
         autopair
         ;; bazaar
         ;; deft
         diminish
         dired+
         emacs-w3m
         expand-region
         flx
         ;; flycheck
         ;; flymake
         git-emacs
         guru-mode
         ido-hacks
         ido-ubiquitous
         jedi
         key-chord
         magit
         openwith
         powerline
         pydoc-info
         python-mode
         smart-operator
         smex
         twittering-mode
         undo-tree
         volatile-highlights
         windcycle
         workgroups
         yasnippet
         zenburn-theme
         )))

;; Call to get everything installed
(el-get 'sync my-el-get-packages)
(el-get 'sync)


(defvar my-package-dir "~/.emacs.d/el-get/package/elpa")
(defun add-subfolders-to-load-path (parent-dir)
  "Add all level PARENT-DIR subdirs to the `load-path'."
  (dolist (f (directory-files parent-dir))
    (let ((name (expand-file-name f parent-dir)))
      (when (and (file-directory-p name)
                 (not (equal f ".."))
                 (not (equal f ".")))
        (add-to-list 'load-path name)
        (add-subfolders-to-load-path name)))))

(add-subfolders-to-load-path my-package-dir)

;; Same thing here for package-Packages. Some stuff I cannot get via el-get. Those are collected here. (most of those are from Melpa rep)
;; Unfortunately, it is buggy from here. This stuff just does not work yet. I leave it defined, but do not call it.
;; (defvar my-elpa-packages
;;   '(

;;     auto-complete
;;     ace-jump-buffer
;;     ac-helm
;;     company
;;     discover
;;     helm
;;     helm-c-yasnippet
;;     helm-helm-commands
;;     helm-orgcard
;;     helm-git
;;     helm-projectile
;;     projectile

;;     )
  ;; "A list of packages to ensure are installed at launch.")

;; (defun my-packages-installed-p ()
;;   "Check if all packages in `my-elpa-packages' are installed."
;;   ;; (interactive)
;;   (every #'package-installed-p my-elpa-packages))

;; (defun my-require-package (package)
;;   "Install PACKAGE unless already installed."
;;   (unless (memq package my-elpa-packages)
;;     (add-to-list 'my-elpa-packages package))
;;   (unless (package-installed-p package)
;;     (package-install package)))

;; (defun my-require-packages (packages)
;;   "Ensure PACKAGES are installed.
;; Missing packages are installed automatically."
;;   (mapc #'my-require-package packages))

;; (defun my-install-packages ()
;;   "Install all packages listed in `my-elpa-packages'."
;;   (unless (my-packages-installed-p)
;;     ;; check for new packages (package versions)
;;     (message "%s" "Emacs is now refreshing its package database...")
;;     (package-refresh-contents)
;;     (message "%s" " done.")
;;     ;; install the missing packages
;;     (my-require-packages my-elpa-packages)))

;; Comment this out, in order to get elpa packages after a fresh install. Does not work, if packages are already insatlled. Configuration breaks then.
;; Reason: dunno yet
;; (my-install-packages)
