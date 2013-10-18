424;;  keybinds.el --- Setting up my custom binds here
(global-set-key (kbd "M-x") 'smex)
(global-set-key (kbd "M-X") 'smex-major-mode-commands)
(global-set-key (kbd "C-a") 'mark-whole-buffer)
(global-set-key (kbd "<f2>") ' mu4e) 
(global-set-key (kbd "<f3>") ' cua-mode)
(global-set-key (kbd "<f4>") 'goto-line) ; 
(global-set-key (kbd "<f6>") 'visit-ansi-term)
(global-set-key (kbd "<f7>") ' magit-status)
(global-set-key (kbd "M-<") ' prelude-google)
(global-set-key (kbd "C-<") ' browse-url)
(global-set-key (kbd "C-x C-o") 'browse-url-at-point)
(global-set-key (kbd "C-c y") 'bury-buffer)
(global-set-key (kbd "C-c d") 'insert-date)
(global-set-key (kbd "C-f") 'ispell-word)
(global-set-key (kbd "C-x C-i") 'helm-imenu )

;; Setting up Key-Chords here
;; Binding a Bunch of useful stuff for convenient acess. 
(key-chord-define-global  "dw" 'delete-window)
(key-chord-define-global "jk" 'ispell-word)
(key-chord-define-global "uu" 'ace-jump-mode)
(key-chord-define-global "bb" 'helm-mini)
(key-chord-define-global "öä" 'deft)
(key-chord-define-global "cc" 'er/expand-region)

;;(global-set-key (kbd "<menu>") 'delete-window)
;;(global-set-key (kbd "<f5>") 'delete-window) ; 
