; Setting up El-get
(require 'package)
(add-to-list 'package-archives
  '("melpa" . "http://melpa.milkbox.net/packages/") t)

(package-initialize)

(add-to-list 'load-path "~/.emacs.d/el-get/el-get")
(unless (require 'el-get nil 'noerror)
  (with-current-buffer
      (url-retrieve-synchronously
       "https://raw.github.com/dimitri/el-get/master/el-get-install.el")
    (let (el-get-master-branch)
      (goto-char (point-max))
      (eval-print-last-sexp))))

;;(setq package-archives '(("gnu" . "http://elpa.gnu.org/packages/")
;;                         ("marmalade" . "http://marmalade-repo.org/packages/")
  ;;                     ("melpa" . "http://melpa.milkbox.net/packages/")))


; list all packages you want installed  

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
         expand-region    
         flx
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
         flycheck    
         ))) 

(el-get 'sync my-el-get-packages)  
(el-get 'sync) 
