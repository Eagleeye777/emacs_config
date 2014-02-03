;c;  keybinds.el --- Setting up my custom binds here


;; Unsets

;; Unbind menu. Will be new modier for some commands maybe
(global-unset-key (kbd" <menu>"))

;; moved from Better defaults
(global-set-key (kbd "M-/") 'hippie-expand)
(global-set-key (kbd "C-x C-b") 'ibuffer)
(global-set-key (kbd "C-s") 'isearch-forward-regexp)
(global-set-key (kbd "C-r") 'isearch-backward-regexp)
(global-set-key (kbd "C-M-s") 'isearch-forward)
(global-set-key (kbd "C-M-r") 'isearch-backward)

;; Font size
(global-set-key (kbd "C-+") 'text-scale-increase)
(global-set-key (kbd "C--") 'text-scale-decrease)

(global-set-key (kbd "M-n" ) 'forward-paragraph)
(global-set-key (kbd "M-p ") 'backward-paragraph)


;;;; ----------------------------------- Rest disabled in minimal


;; ;;; Setting up Org Keybindings 

;; (global-set-key "\C-cl" 'org-store-link)
;; (global-set-key "\C-ca" 'org-agenda)
;; (global-set-key "\C-cb" 'org-iswitchb)
;; (define-key global-map "\C-cc" 'org-capture)
;; (define-key global-map (kbd "<f9>") 'org-capture)



;; ;; Undo-Tree Commands 
;; (global-set-key (kbd "C-z") 'undo) ; 【Ctrl+z】
;; (global-set-key (kbd "M-z") 'redo) ; 【ALT+z】

;; ;; Smex Stuff
;; (global-set-key (kbd "M-x") 'smex)
;; ;; (global-set-key (kbd "M-X") 'smex-major-mode-commands)
;; (global-set-key (kbd "M-X") 'helm-M-x)

;; All the F-Keys I Bind so far
;; (global-set-key [C-f1] 'show-file-name) ; Immature Function so far, but anyhow
;; (global-set-key (kbd "<f2>") ' mu4e) 
;; (global-set-key (kbd "<S-f2>") 'helm-mu)
;; (global-set-key (kbd "<f5>") 'helm-do-grep)
;; (global-set-key (kbd "<f6>") 'visit-ansi-term)
;; (global-set-key (kbd "<f7>") ' magit-status)
;; (global-set-key (kbd "<S-f7>") 'helm-git-find-files)
;; (global-set-key (kbd "C-c o") 'helm-projectile)
;; ;; don't know if I am happy with these. Might rebind 
;; (global-set-key (kbd "M-<") ' prelude-google)
;; (global-set-key (kbd "C-<") ' browse-url)
;; (global-set-key (kbd "C-x C-o") 'browse-url-at-point)
;; (global-set-key (kbd "C-c y") 'bury-buffer)
;; (global-set-key (kbd "C-c C-d") 'insert-date)


;; These might get in the way. Maybe I have to figure out something differnt. Can't use  normal bindings though, because they are terribly inconvenient with german keyboard layout. 

;; Python related Bindings.
;; (define-key python-mode-map (kbd "C-x ö") 'py-execute-region)



;; ;;  Key-Chords bindings. 
;; ;; Binding a bunch of useful stuff for convenient acess. 
;; (key-chord-define-global "cv" ' cua-mode) ; enable or Disable. Sometimes cua get's in the way, and has to be disabled quickly. 

;; ;; Muss UN2BEDINGT neu. Das tippe ich offensichtlich doch so häufig, dass ich mir dann immer die buffer kille, leider oft ohne save. Geht so nicht. 
;; (key-chord-define-global  "xx" 'kill-buffer-and-window)

;; (key-chord-define-global "jk" 'ispell-word)

;; (key-chord-define-global "yy" 'helm-show-kill-ring)

;; (key-chord-define-global "uu" 'ace-jump-mode)
;; (key-chord-define-global "ii" 'ace-jump-buffer)
;; (key-chord-define-global "ui" 'ace-jump-line-mode)
;; (key-chord-define-global "bb" 'helm-mini)
;; (key-chord-define-global "fg" 'helm-find-files)

;; (key-chord-define-global "öä" 'deft)
;; (key-chord-define-global "cc" 'er/expand-region)
;; (key-chord-define gnus-dired-mode-map "öä" 'gnus-dired-attach)
;; (key-chord-define-global "rf" 'helm-recentf)
;; (key-chord-define-global ".." 'ac-complete-with-helm)
;; (key-chord-define ac-mode-map ".." 'ac-complete-with-helm)

;; ;; (key-chord-define-global "dd" 'delete-window) ;; Untauglich, das kommt beim schreiben doch immer wieder vor. Ersetzt durch das Default Binding 

;; (key-chord-define emacs-lisp-mode-map "qq" 'helm-imenu)
;; (key-chord-define org-mode-map "qq" 'helm-org-headlines)
;; (key-chord-define python-mode-map "qq" 'helm-imenu)
;; ;; (key-chord-define-global "qq" 'helm-imenu)
;; (key-chord-define-global "##" 'hippie-expand)
;; (key-chord-define-global "öö" 'my_curly_braces)
;; (key-chord-define-global "ää" 'my_square_braces)
;; (key-chord-define-global "dd" 'select-current-line)
;; (key-chord-define org-mode-map "ww" 'org-todo)

;; ;; Okay, here are some possible rebinds, from standart commands that i might never use.

;; C-k (kill-line)
;; C-l (recenter-top-bottom)
;; C-o  (open-line) 
;; Undefined sofar

;; C-,
;; C-. 
;; C-ä
;; C-ü 

;; Possible keychords that are undefined:

;; hh
;; zz
;; nn
;; mm

