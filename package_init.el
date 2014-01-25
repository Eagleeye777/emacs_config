;; Setting up package and Melpa

(require 'package)
(package-initialize)
(add-to-list 'package-archives
 '("melpa" . "http://melpa.milkbox.net/packages/") t)

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
         zenburn
         zenburn-theme
             
         ))) 

;; Call to get everything installed
(el-get 'sync my-el-get-packages)  
(el-get 'sync) 
