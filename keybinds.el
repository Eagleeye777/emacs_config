;;  keybinds.el --- Setting up my custom binds here
(global-set-key (kbd "M-x") 'smex)
(global-set-key (kbd "M-X") 'smex-major-mode-commands)
(global-set-key (kbd "C-a") 'mark-whole-buffer)
(global-set-key (kbd "<f2>") ' mu4e) 
;;(global-set-key (kbd "<f3>") ' ) 
;;(global-set-key (kbd "<f4>") 'goto-line) ; 
(global-set-key (kbd "<f6>") 'visit-ansi-term)
(global-set-key (kbd "<f7>") ' magit-status)
(global-set-key (kbd "M-<") ' prelude-google)
(global-set-key (kbd "C-<") ' browse-url)
(global-set-key (kbd "C-x C-o") 'browse-url-at-point)
(global-set-key (kbd "C-c y") 'bury-buffer)
(global-set-key (kbd "C-c C-d") 'insert-date)
(global-set-key (kbd "C-x C-r") 'helm-imenu)
;; Font size
(global-set-key (kbd "C-+") 'text-scale-increase)
(global-set-key (kbd "C--") 'text-scale-decrease)
;; (eval-after-load 'python-mode           ;
;; (define-key python-mode-map (kbd "C-c ö") 'py-execute-region)
;; Setting up Key-Chords here
;; Binding a bunch of useful stuff for convenient acess. 
(key-chord-define-global "cv" ' cua-mode)
(key-chord-define-global  "dw" 'kill-buffer-and-window)
(key-chord-define-global "jk" 'ispell-word)
(key-chord-define-global "uu" 'ace-jump-mode)
(key-chord-define-global "bb" 'helm-mini)
(key-chord-define-global "öä" 'deft)
(key-chord-define-global "cc" 'er/expand-region)
(key-chord-define gnus-dired-mode-map "öä" 'gnus-dired-attach)
(key-chord-define-global "rf" 'helm-recentf)
(key-chord-define-global "dd" 'delete-window)
;;(global-set-key (kbd "<menu>") 'delete-window)
;;(global-set-key (kbd "<f5>") 'delete-window) ; 
