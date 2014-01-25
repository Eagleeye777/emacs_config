;c;  keybinds.el --- Setting up my custom binds here

;; moved from Better defaults

(global-set-key (kbd "M-/") 'hippie-expand)
(global-set-key (kbd "C-x C-b") 'ibuffer)
(global-set-key (kbd "C-s") 'isearch-forward-regexp)
(global-set-key (kbd "C-r") 'isearch-backward-regexp)
(global-set-key (kbd "C-M-s") 'isearch-forward)
(global-set-key (kbd "C-M-r") 'isearch-backward)

;; Undo-Tree Commands 
(global-set-key (kbd "C-z") 'undo) ; 【Ctrl+z】
(global-set-key (kbd "M-z") 'redo) ; 【ALT+z】

;; Smex Stuff
(global-set-key (kbd "M-x") 'smex)
(global-set-key (kbd "M-X") 'smex-major-mode-commands)

;; All the F-Keys I Bind so far
(global-set-key (kbd "<f2>") ' mu4e) 
(global-set-key (kbd "<f6>") 'visit-ansi-term)
(global-set-key (kbd "<f7>") ' magit-status)
(global-set-key (kbd "<S-f7>") 'helm-git-find-files)
;; don't know if I am happy with these. Might rebind 
(global-set-key (kbd "M-<") ' prelude-google)
(global-set-key (kbd "C-<") ' browse-url)
(global-set-key (kbd "C-x C-o") 'browse-url-at-point)
(global-set-key (kbd "C-c y") 'bury-buffer)
(global-set-key (kbd "C-c C-d") 'insert-date)
(global-set-key  (kbd "C-c i") 'prelude-ido-goto-symbol)

;; Font size
(global-set-key (kbd "C-+") 'text-scale-increase)
(global-set-key (kbd "C--") 'text-scale-decrease)

;; These might get in the way. Maybe I have to figure out something differnt. Can't use  normal bindings though, because they are terribly inconvenient with german keyboard layout. 
(global-set-key (kbd "M-n" ) 'forward-paragraph)
(global-set-key (kbd "M-p ") 'backward-paragraph)

;; Python related Bindings.
(define-key python-mode-map (kbd "C-x ö") 'py-execute-region)

;;  Key-Chords bindings. 
;; Binding a bunch of useful stuff for convenient acess. 
(key-chord-define-global "cv" ' cua-mode) ; enable or Disable. Sometimes cua get's in the way, and has to be disabled quickly. 

(key-chord-define-global  "dw" 'kill-buffer-and-window) ; Might need rebind.

(key-chord-define-global "jk" 'ispell-word)
(key-chord-define-global "uu" 'ace-jump-mode)
(key-chord-define-global "ii" 'ace-jump-buffer)
(key-chord-define-global "ui" 'ace-jump-line-mode)
(key-chord-define-global "bb" 'helm-mini)
(key-chord-define-global "öä" 'deft)
(key-chord-define-global "cc" 'er/expand-region)
(key-chord-define gnus-dired-mode-map "öä" 'gnus-dired-attach)
(key-chord-define-global "rf" 'helm-recentf)
;; (key-chord-define-global "dd" 'delete-window) ;; Untauglich, das kommt beim schreiben doch immer wieder vor. Ersetzt durch das Default Binding 
(key-chord-define-global "qq" 'helm-imenu)
(key-chord-define-global "##" 'hippie-expand)
(key-chord-define-global "öö" 'my_curly_braces)
(key-chord-define-global "ää" 'my_square_braces)
(key-chord-define-global "dd" 'select-current-line)
