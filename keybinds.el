;c;  keybinds.el --- Setting up my cuwstom binds here

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

;; Control-c Bindings
(global-set-key "\C-ca" 'org-agenda)
(global-set-key "\C-cb" 'org-iswitchb)
(global-set-key (kbd "C-c d") 'helm-all-mark-rings)
(global-set-key (kbd "C-c f") 'helm-recentf)
(global-set-key (kbd "C-c h") 'ergoemacs-backward-open-bracket)
(global-set-key (kbd "C-c j") 'ergoemacs-forward-close-bracket)
(global-set-key "\C-cl" 'org-store-link)
(global-set-key (kbd  "C-c n") 'global-my-nav-mode)

(global-set-key (kbd "C-c o") 'helm-projectile)
(global-set-key (kbd "C-c p") 'my-paredit-autopair-switch)
(global-set-key (kbd "C-c r") 'helm-resume)
(global-set-key (kbd "C-c s") 'create-scratch-buffer)
(global-set-key (kbd "C-c C-v") 'sauron-toggle-hide-show)

;; Control-x Bindings

(global-set-key (kbd "C-x x") 'delete-window)
;; Buffer-navigation Bindings
(global-set-key (kbd "C-x <up>") 'windmove-up-cycle)
(global-set-key (kbd "C-x <down>") 'windmove-down-cycle)
(global-set-key (kbd "C-x <right>") 'windmove-right-cycle)
(global-set-key (kbd "C-x <left>") 'windmove-left-cycle)

;; Rework company bindings if it goes well
(define-key company-active-map (kbd "C-n") 'company-select-next)
(define-key company-active-map (kbd "C-p") 'company-select-previous)
(define-key company-active-map (kbd "TAB") 'company-complete)
(define-key company-active-map [tab] 'company-complete)


;; Emacs Lips Settings
(define-key emacs-lisp-mode-map (kbd "C-w") 'my-paredit-delete)

;;; Setting up Org Keybindings

(define-key org-mode-map (kbd "M-e") 'org-emphasize)

(define-key org-mode-map (kbd "C-j") 'org-insert-heading-respect-content)

(global-set-key (kbd "<XF86Launch7>") 'helm-descbinds)
(define-key org-mode-map (kbd "<XF86Launch7>") 'helm-orgcard)
;; (global-set-key (kbd "S-<XF86Launch7>") 'one-key-open-associated-menu-set)

(global-set-key (kbd "<XF86Launch8>") 'bury-buffer)

;;; Helm Keybindings
(global-set-key (kbd "C-x C-b") 'helm-buffers-list)
(global-set-key (kbd "M-X") 'helm-M-x)

;; Undo-Tree Commands
(global-set-key (kbd "C-z") 'undo) ; 【Ctrl+z】
(global-set-key (kbd "M-z") 'redo) ; 【ALT+z】

;; Smex Stuff
(global-set-key (kbd "M-x") 'smex)

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


;; don't know if I am happy with these. Might rebind
(global-set-key (kbd "M-<") ' prelude-google)
(global-set-key (kbd "C-<") ' browse-url)
(global-set-key (kbd "C-x C-o") 'browse-url-at-point)
(global-set-key (kbd "C-c C-d") 'insert-date)


;; Font size
(global-set-key (kbd "C-+") 'text-scale-increase)
(global-set-key (kbd "C--") 'text-scale-decrease)

;; These might get in the way. Maybe I have to figure out something differnt. Can't use  normal bindings though, because they are terribly inconvenient with german keyboard layout.
(global-set-key (kbd "M-n" ) 'forward-paragraph)
(global-set-key (kbd "M-p ") 'backward-paragraph)

;; Python related Bindings.
(define-key python-mode-map (kbd "C-x ö") 'py-execute-region)


;; Reworking some helm keys here
(define-key helm-buffer-map (kbd "C-+") 'helm-toggle-buffers-details)

;;  Key-Chords bindings.

;; kills current line from anywhere (mimic C-a C-k)
(key-chord-define-global "kk"
                         (lambda () (interactive)
                           (move-beginning-of-line 1)
                           (kill-line)
                           (kill-line)))

;; (key-chord-define-global "pw" 'wg-switch-to-previous-workgroup)
;; (key-chord-define-global "tw" 'wg-switch-to-previous-workgroup)


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

;;Elisp
(key-chord-define emacs-lisp-mode-map "qq" 'helm-imenu)
(key-chord-define emacs-lisp-mode-map "ee" 'eval-last-sexp)
(key-chord-define lisp-interaction-mode-map "ee" 'eval-last-sexp)

(key-chord-define TeX-mode-map "qq" 'helm-imenu)
(key-chord-define org-mode-map "qq" 'helm-org-headlines)
(key-chord-define python-mode-map "qq" 'helm-imenu)

;;Edit Utils
(key-chord-define-global "öö" 'my_curly_braces)
(key-chord-define-global "ää" 'my_square_braces)
(key-chord-define-global "ay" 'select-current-line)
(key-chord-define-global "pp" 'comment-line)


(key-chord-define-global "jj" 'hippie-expand)
(key-chord-define org-mode-map "ww" 'org-todo)
(key-chord-define-global "--" 'makey-key-mode-popup-rectangles)

;; Set these
(key-chord-define hs-minor-mode-map "hb" 'hs-hide-block)
(key-chord-define hs-minor-mode-map "hv" 'hs-show-block)
(key-chord-define hs-minor-mode-map "zh" 'hs-hide-all)


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
