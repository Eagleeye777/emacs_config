; Setting up El-get
(add-to-list 'load-path "~/.emacs.d/el-get/el-get")
(unless (require 'el-get nil 'noerror)
  (with-current-buffer
      (url-retrieve-synchronously
       "https://raw.github.com/dimitri/el-get/master/el-get-install.el")
    (let (el-get-master-branch)
      (goto-char (point-max))
      (eval-print-last-sexp))))

(require 'package) ; hier werden die Packetrepositories für emacs definiert, damit emacs erweiterungen direct in emacs installiert werden können. 


;;(setq package-archives '(("gnu" . "http://elpa.gnu.org/packages/")
;;                         ("marmalade" . "http://marmalade-repo.org/packages/")
  ;;                     ("melpa" . "http://melpa.milkbox.net/packages/")))

(add-to-list 'package-archives
  '("melpa" . "http://melpa.milkbox.net/packages/") t)

(package-initialize)

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
