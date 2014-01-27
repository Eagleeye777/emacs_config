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
         auto-complete
         auto-complete+
         autopair
         bazaar
         browse-kill-ring
         deft
         diminish         
         dired+
         emacs-w3m
         expand-region    
         flx
         flycheck
         flymake    
         git-emacs
         guru-mode
         helm    
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
         yasnippet-config
         zenburn-theme
             
         ))) 

;; Call to get everything installed
(el-get 'sync my-el-get-packages)  
(el-get 'sync) 


;; Same thing here for package-Packages. Some stuff I cannot get via el-get. Those are collected here. (most of those are from Melpa rep)

(defvar my-elpa-packages
  '(
    ace-jump-buffer
    company
    helm-company
    helm-git
    helm-projectile
    projectile
    )
  "A list of packages to ensure are installed at launch.")

(defun my-packages-installed-p ()
  "Check if all packages in `my-elpa-packages' are installed."
  ;; (interactive)
  (every #'package-installed-p my-elpa-packages))

(defun my-require-package (package)
  "Install PACKAGE unless already installed."
  (unless (memq package my-elpa-packages)
    (add-to-list 'my-elpa-packages package))
  (unless (package-installed-p package)
    (package-install package)))

(defun my-require-packages (packages)
  "Ensure PACKAGES are installed.
Missing packages are installed automatically."
  (mapc #'my-require-package packages))

(defun my-install-packages ()
  "Install all packages listed in `my-elpa-packages'."
  (unless (my-packages-installed-p)
    ;; check for new packages (package versions)
    (message "%s" "Emacs is now refreshing its package database...")
    (package-refresh-contents)
    (message "%s" " done.")
    ;; install the missing packages
    (my-require-packages my-elpa-packages)))
;; Comment this out, in order to get elpa packages after a fresh install. Does not work, if packages are already insatlled. Configuration breaks then. 
;; Reason: dunno yet
;; (my-install-packages)
