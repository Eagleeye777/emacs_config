;c;  keybinds.el --- Setting up my custom binds here
(global-set-key (kbd "M-x") 'smex)
(global-set-key (kbd "M-X") 'smex-major-mode-commands)
;; (global-set-key (kbd "C-a") 'mark-whole-buffer)
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
;; Font size
(global-set-key (kbd "C-+") 'text-scale-increase)
(global-set-key (kbd "C--") 'text-scale-decrease)
(global-set-key (kbd "M-n" ) 'forward-paragraph)
(global-set-key (kbd "M-p ") 'backward-paragraph)
;; (eval-after-load 'python-mode           ;
(define-key python-mode-map (kbd "C-x ö") 'py-execute-region)

;; Setting up Key-Chords here
;; Binding a bunch of useful stuff for convenient acess. 
(key-chord-define-global "cv" ' cua-mode) ; enable or Disable. Sometimes get's in the way. 
(key-chord-define-global  "dw" 'kill-buffer-and-window)
(key-chord-define-global "jk" 'ispell-word)
(key-chord-define-global "uu" 'ace-jump-mode)
(key-chord-define-global "bb" 'helm-mini)
(key-chord-define-global "öä" 'deft)
(key-chord-define-global "cc" 'er/expand-region)
(key-chord-define gnus-dired-mode-map "öä" 'gnus-dired-attach)
(key-chord-define-global "rf" 'helm-recentf)
;; (key-chord-define-global "dd" 'delete-window) ;; Untauglich, das kommt beim schreiben doch immer wieder vor. Ersetzt durch das Default Binding 
(key-chord-define-global "qq" 'helm-imenu)
(key-chord-define-global "ii" 'ace-jump-buffer)
(key-chord-define-global "##" 'hippie-expand)
(key-chord-define-global "öö" 'my_curly_braces)
(key-chord-define-global "ää" 'my_square_braces)

