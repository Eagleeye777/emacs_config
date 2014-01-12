(require 'auto-complete)
(add-to-list 'ac-dictionary-directories "~/.emacs.d/el-get/auto-comlete/ac-dict")
(require 'auto-complete-config)
(ac-config-default)
(global-auto-complete-mode t)

(require 'auto-complete+)

(set-default 'ac-sources
             '(ac-source-dictionary
               ac-source-words-in-buffer
               ac-source-words-in-same-mode-buffers
               ac-source-semantic
               ac-source-yasnippet))

(require 'yasnippet)
;; (setq yas-snippet-dirs "~/.emacs.d/el-get/yasnippet/snippets")
(setq yas-snippet-dirs '("~/.emacs.d/el-get/yasnippet/snippets"))
(add-to-list 'yas-snippet-dirs ' "~/.emacs.d/snippets")
(require 'yasnippet-config)
(yas-global-mode 1)
