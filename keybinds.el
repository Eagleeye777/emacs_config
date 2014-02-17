;c;  keybinds.el --- Setting up my custom binds here

;; Unsets
;; Unbind menu. Will be new modier for some commands maybe
(global-unset-key (kbd" <menu>"))
(global-set-key (kbd "<menu> a ") 'delete-other-windows)
(global-set-key (kbd "<menu> m") 'zap-up-to-char)

;; moved from Better defaults
(global-set-key (kbd "M-/") 'hippie-expand)
(global-set-key (kbd "C-s") 'isearch-forward-regexp)
(global-set-key (kbd "C-r") 'isearch-backward-regexp)
(global-set-key (kbd "C-M-s") 'isearch-forward)
(global-set-key (kbd "C-M-r") 'isearch-backward)


;; Rework company bindings if it goes well
(define-key company-active-map (kbd "C-n") 'company-select-next)
(define-key company-active-map (kbd "C-p") 'company-select-previous)
(define-key company-active-map (kbd "TAB") 'company-complete)
(define-key company-active-map [tab] 'company-complete)

;;; Setting up Org Keybindings
(global-set-key "\C-cl" 'org-store-link)
(global-set-key "\C-ca" 'org-agenda)
(global-set-key "\C-cb" 'org-iswitchb)
(define-key org-mode-map (kbd "M-e") 'org-emphasize)
(define-key org-mode-map (kbd "C-j") 'org-insert-heading-respect-content)
(define-key org-mode-map (kbd "<XF86Launch7>") 'helm-orgcard)

;;; Helm Keybindings
(global-set-key (kbd "C-x C-b") 'helm-buffers-list)
(global-set-key (kbd "C-c f") 'helm-recentf)
(global-set-key (kbd "C-c r") 'helm-resume)
(global-set-key (kbd "M-X") 'helm-M-x)
(global-set-key (kbd "C-c o") 'helm-projectile)
(global-set-key (kbd "C-c d") 'helm-all-mark-rings)
;; Undo-Tree Commands
(global-set-key (kbd "C-z") 'undo) ; 【Ctrl+z】
(global-set-key (kbd "M-z") 'redo) ; 【ALT+z】

;; Smex Stuff
(global-set-key (kbd "M-x") 'smex)
(global-set-key (kbd  "C-c n") 'global-my-nav-mode)

;; All the F-Keys I Bind so far
(global-set-key [C-f1] 'show-file-name)
(global-set-key (kbd "<f2>") ' mu4e)
(global-set-key (kbd "<S-f2>") 'helm-mu)
(global-set-key (kbd "<f5>") 'helm-do-grep)
(global-set-key (kbd "<S-f5>") 'my-helm-do-grep-recursive)
;; F6 Binding is taken, but had to be set up in gen_init.el to make it work (esh-toggle)

(global-set-key (kbd "<f7>") ' magit-status)
(global-set-key (kbd "<S-f7>") 'helm-ls-git-ls)
(define-key global-map (kbd "<f9>") 'org-capture)

(global-set-key (kbd "<XF86Launch7>") 'helm-descbinds)

;; don't know if I am happy with these. Might rebind
(global-set-key (kbd "M-<") ' prelude-google)
(global-set-key (kbd "C-<") ' browse-url)
(global-set-key (kbd "C-x C-o") 'browse-url-at-point)
(global-set-key (kbd "C-c y") 'bury-buffer)
(global-set-key (kbd "C-c C-d") 'insert-date)

;; Font size
(global-set-key (kbd "C-+") 'text-scale-increase)
(global-set-key (kbd "C--") 'text-scale-decrease)

;; These might get in the way. Maybe I have to figure out something differnt. Can't use  normal bindings though, because they are terribly inconvenient with german keyboard layout.
(global-set-key (kbd "M-n" ) 'forward-paragraph)
(global-set-key (kbd "M-p ") 'backward-paragraph)

;; Python related Bindings.
(define-key python-mode-map (kbd "C-x ö") 'py-execute-region)

;;  Key-Chords bindings.

(key-chord-define-global "cv" ' cua-mode) ; Sometimes cua get's in the way, and has to be disabled quickly.
(key-chord-define-global "jk" 'ispell-word)
(key-chord-define-global "cc" 'er/expand-region)
(key-chord-define gnus-dired-mode-map "öä" 'gnus-dired-attach)  ;Attaching a file to a mail
(key-chord-define-global "zz" 'zop-to-char)

(key-chord-define-global "uu" 'ace-jump-char-mode)
(key-chord-define-global "ii" 'ace-jump-line-mode)

(key-chord-define-global "fv" ' my-helm-do-grep-recursive)
(key-chord-define-global "yy" 'helm-show-kill-ring)
(key-chord-define-global "bb" 'helm-mini)
(key-chord-define company-mode-map ".." 'helm-company)
(key-chord-define company-active-map ".." 'helm-company)
(key-chord-define-global ",," 'helm-yas-complete)
;; (key-chord-define-global ".." 'ac-complete-with-helm)
;; (key-chord-define ac-mode-map ".." 'ac-complete-with-helm)



;; Muss UN2BEDINGT neu. Das tippe ich offensichtlich doch so häufig, dass ich mir dann immer die buffer kille, leider oft ohne save. Geht so nicht.

;; (key-chord-define-global  "xx" 'kill-buffer-and-window)
;; (key-chord-define-global "oi" 'other-frame)

(key-chord-define emacs-lisp-mode-map "qq" 'helm-imenu)
(key-chord-define emacs-lisp-mode-map "ee" 'eval-last-sexp)


(key-chord-define TeX-mode-map "qq" 'helm-imenu)
(key-chord-define org-mode-map "qq" 'helm-org-headlines)
(key-chord-define python-mode-map "qq" 'helm-imenu)
;; (key-chord-define-global "qq" 'helm-imenu)
(key-chord-define-global "jj" 'hippie-expand)
(key-chord-define-global "öö" 'my_curly_braces)
(key-chord-define-global "ää" 'my_square_braces)
(key-chord-define-global "ay" 'select-current-line)
(key-chord-define org-mode-map "ww" 'org-todo)
(key-chord-define-global "--" 'makey-key-mode-popup-rectangles)

;; Set these
(key-chord-define hs-minor-mode-map "hb" 'hs-hide-block)
(key-chord-define hs-minor-mode-map "hv" 'hs-show-block)

(key-chord-define hs-minor-mode-map "zh" 'hs-hide-all)

;; (key-chord-define-global "hb" 'hs-hide-block)
;; (key-chord-define-global "hv" 'hs-show-block)





;; ;; Okay, here are some possible rebinds, from standart
;; commands that i might never use.
;; C-k (kill-line)
;; C-o  (open-line)

;; Undefined keybinds so far

;; C-,
;; C-.
;; C-ä
;; C-ü

;; Possible keychords that are undefined:
;; qw
;; hh
;; zz
;; nn
;; mm
