;smart operator
(add-to-list 'load-path "/home/sschaumburg/.emacs.d/el-get/smart-operator")
(autoload 'smart-operator "smart-operator" "Start smart-operator" t)

;Twittering mode
(autoload 'twittering-mode "twittering-mode" "Start twittering mode" t)
(setq twittering-use-master-password t)
(setq twittering-icon-mode t)


(add-to-list 'load-path "/home/sschaumburg/.emacs.d/el-get/helm")
(require 'helm-config)

;; git emacs
(add-to-list 'load-path "/home/sschaumburg/.emacs.d/el-get/git-emacs")
(require 'git-emacs)
