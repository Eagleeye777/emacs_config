4;; Custom Keybindings 
;; Important (set smex keybinds after ido hacks)                  
(global-set-key (kbd "M-x") 'smex)
(global-set-key (kbd "M-X") 'smex-major-mode-commands)
(global-set-key (kbd "<menu>") 'delete-window)
(global-set-key (kbd "C-a") 'mark-whole-buffer)
(global-set-key (kbd "C-b") ' helm-mini)
(global-set-key (kbd "<f2>") ' mu4e) 
(global-set-key (kbd "<f3>") ' cua-mode)
(global-set-key (kbd "<f4>") 'goto-line) ; 
;;(global-set-key (kbd "<f5>") 'delete-window) ; 
(global-set-key (kbd "<f6>") 'visit-ansi-term)
(global-set-key (kbd "<f7>") ' magit-status)
(global-set-key (kbd "M-<") ' prelude-google)
(global-set-key (kbd "C-<") ' browse-url)
(global-set-key (kbd "C-x C-o") 'browse-url-at-point)
(global-set-key (kbd "C-c y") 'bury-buffer)
(global-set-key (kbd "C-c d") 'insert-date)
blub
