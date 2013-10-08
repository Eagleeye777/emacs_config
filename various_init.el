;smart operator
(add-to-list 'load-path "/home/sschaumburg/.emacs.d/el-get/smart-operator")
(autoload 'smart-operator "smart-operator" "Start smart-operator" t)

;Twittering mode
(autoload 'twittering-mode "twittering-mode" "Start twittering mode" t)
(setq twittering-use-master-password t)
(setq twittering-icon-mode t)


;; Smex
(add-to-list 'load-path "/home/sschaumburg/.emacs.d/el-get/smex")

(require 'smex) ; Not needed if you use package.el
(smex-initialize) ; Can be omitted. This might cause a (minimal) delay
                  ; when Smex is auto-initialized on its first run.
(global-set-key (kbd "M-x") 'smex)
(global-set-key (kbd "M-X") 'smex-major-mode-commands)
;; This is your old M-x.
(global-set-key (kbd "C-c C-c M-x") 'execute-extended-command)

; w3m als emacs Browser
 (setq browse-url-browser-function 'w3m-browse-url)
 (autoload 'w3m-browse-url "w3m" "Ask a WWW browser to show a URL." t)
 ;; optional keyboard short-cut (muss ich umdefiniere, da dieses Binding mit dem Mail-Kommando in Konflikt steht
;; (global-set-key "\C-xm" 'browse-url-at-point)


;; git emacs
(add-to-list 'load-path "/home/sschaumburg/.emacs.d/el-get/git-emacs")
(require 'git-emacs)
