;;  keybinds.el --- Setting up my cuwstom binds here

(global-set-key (kbd "C-ä") 'delete-other-windows)

;; Remapping global commands
;; (global-set-key (kbd "C-s") 'isearch-forward-regexp)
;; (global-set-key (kbd "C-r") 'isearch-backward-regexp)
;; (global-set-key (kbd "C-M-s") 'isearch-forward)
;; (global-set-key (kbd "C-M-r") 'isearch-backward)
(global-set-key (kbd "C-a") 'crux-move-beginning-of-line)

;; Control-c Bindings
(global-set-key "\C-ca" 'org-agenda)
(global-set-key "\C-cl" 'org-store-link)

;; Font size
(global-set-key (kbd "C-c +") 'text-scale-increase)
(global-set-key (kbd "C-c -") 'text-scale-decrease)

(global-set-key (kbd  "C-c g") 'find-file-at-point)

;; (global-set-key (kbd "C-c b") 'helm-apropos)
;;(global-set-key (kbd "C-c d") 'helm-all-mark-rings)
;; c-C E TAKEN BY WORKGROUPS IN INIT FILE
;;(global-set-key (kbd "C-c f") 'helm-recentf)
;; (global-set-key (kbd "C-c h") 'ergoemacs-backward-open-bracket)
;; (global-set-key (kbd "C-c j") 'ergoemacs-forward-close-bracket)

;;(global-set-key (kbd "C-c o") 'helm-projectile)
;; (global-set-key (kbd "C-c p") 'my-paredit-autopair-switch)
;;(global-set-key (kbd "C-c r") 'helm-resume)
;; (global-set-key (kbd "C-c s") 'create-scratch-buffer)
;; (global-set-key (kbd "C-c x") 'crux-kill-line-backwards)
;; (global-set-key (kbd "C-c C-v") 'sauron-toggle-hide-show)

;; Control-x Bindings
(global-set-key (kbd "C-x x") 'delete-window)
;; (global-set-key (kbd "C-x l") 'my-append-to-file)
;;(global-set-key (kbd "C-x f") ' helm-find-files)


;;; Setting up Org Keybindings

(define-key org-mode-map (kbd "M-e") 'org-emphasize)
(define-key org-mode-map (kbd "C-j") 'org-insert-heading-respect-content)

;;; Helm Keybindings (now bound via Usepackage in init_helm.el)
;;(global-set-key (kbd "C-x C-b") 'helm-buffers-list)
;;(global-set-key (kbd "C-x b") 'helm-buffers-list)
;;(global-set-key (kbd "M-X") 'helm-M-x)

;; Reworking some helm keys here
;;(define-key helm-buffer-map (kbd "C-+") 'helm-toggle-buffers-details)


;; Undo-Tree Commands
(global-set-key (kbd "C-z") 'undo) ; 【Ctrl+z】
(global-set-key (kbd "M-z") 'redo) ; 【ALT+z】

;; Smex Stuff
;;(global-set-key (kbd "M-x") 'smex)

;; All the F-Keys I Bind so far
(global-set-key [C-f1] 'show-file-name)
(global-set-key (kbd "<f2>") ' mu4e)
;; (global-set-key (kbd "<S-f2>") 'helm-mu)
(global-set-key (kbd "<f5>") 'my-search-init-files)
(global-set-key (kbd "<S-f5>") 'my-grep-org-files)
(define-key global-map (kbd "<f9>") 'org-capture)
;; F6 Binding is taken, but had to be set up in gen_init.el to make it work (esh-toggle)

;; (global-set-key (kbd "<f7>") ' magit-status)
;; (global-set-key (kbd "<S-f7>") 'helm-ls-git-ls)


;; don't know if I am happy with these. Might rebind
(global-set-key (kbd "M-<") ' prelude-google)
(global-set-key (kbd "C-<") ' browse-url)
(global-set-key (kbd "C-x C-o") 'browse-url-at-point)
(global-set-key (kbd "C-c C-d") 'insert-date)

;; These might get in the way. Maybe I have to figure out something
;; differnt. Can't use normal bindings though, because they are
;; terribly inconvenient with german keyboard layout.
(global-set-key (kbd "M-n" ) 'forward-paragraph)
(global-set-key (kbd "M-p ") 'backward-paragraph)

;;  Key-Chords bindings.

;; (key-chord-define-global ".l" ' my-append-to-file)
;; HOME-Row
(key-chord-define-global "ay" 'select-current-line)
(key-chord-define org-mode-map ".a" 'my/org-hydra/body)
(key-chord-define-global ".f" ' push-mark-no-activate)
(key-chord-define-global ".d" ' jump-to-mark)
(key-chord-define-global "dd" 'my/editing-utils/body)
(key-chord-define-global ".g" ' helm-do-ag)
(key-chord-define-global "jj" 'hippie-expand)
(key-chord-define-global "jk" 'ispell-word)

(key-chord-define-global ".k" ' crux-kill-line-backwards)
(key-chord-define-global "kk"
                         (lambda () (interactive)
                           (move-beginning-of-line 1)
                           (kill-line)))

(key-chord-define-global "ää" 'my_square_braces)
(key-chord-define-global "öö" ' my_curly_braces)

;;obere Reihe
;;qq
(key-chord-define org-mode-map "ww" 'org-todo)
(key-chord-define emacs-lisp-mode-map "ee" 'eval-last-sexp)
(key-chord-define lisp-interaction-mode-map "ee" 'eval-last-sexp)
;;rr
;;tt
(key-chord-define-global "zz" 'zop-to-char)
(key-chord-define-global "uu" 'avy-goto-word-or-subword-1)
(key-chord-define-global "ii" 'avy-goto-char)
(key-chord-define-global "<p"
                         ((lambda () (interactive)
                            (crux-with-region-or-line comment-or-uncomment-region))))
;; Untere Reihe

;;(key-chord-define-global "yy" 'helm-show-kill-ring)
;;xx
(key-chord-define-global ".c" ' cua-mode) ; Sometimes cua get's in the way, and has to be disabled quickly.
(key-chord-define-global "vv" 'my/window-movement/body)

;;Following chords are bound in init_helm directly if commented out

;;(key-chord-define-global ".b" ' helm-bookmarks)
;;(key-chord-define-global "bb" 'helm-mini)
;;(key-chord-define company-mode-map ".." 'helm-company)
;;(key-chord-define company-active-map ".." 'helm-company)
;;(key-chord-define-global ",," 'helm-yas-complete)
(key-chord-define-global "--" 'makey-key-mode-popup-rectangles) ; discover.el command


;; Rework company bindings if it goes well
(define-key company-active-map (kbd "C-n") 'company-select-next)
(define-key company-active-map (kbd "C-p") 'company-select-previous)
(define-key company-active-map (kbd "TAB") 'company-complete)
(define-key company-active-map [tab] 'company-complete)





;; Unsets
;; Unbind menu. Will be new modier for some commands maybe
;; (global-unset-key (kbd" <menu>"))
;; (global-set-key (kbd "<menu> a ") 'delete-other-windows)
;; (global-set-key (kbd "<menu> m") 'fzap-up-to-char)

;; Emacs Lips Settings
;; (define-key emacs-lisp-mode-map (kbd "C-w") 'my-paredit-delete)

;; (global-set-key (kbd "<XF86Launch7>") 'helm-descbinds)
;; (define-key org-mode-map (kbd "<XF86Launch7>") 'helm-orgcard)
;; (global-set-key (kbd "S-<XF86Launch7>") 'one-key-open-associated-menu-set)
;; (global-set-key (kbd "<XF86Launch8>") 'bury-buffer)
;; Python related Bindings.
;; (define-key python-mode-map (kbd "C-x ö") 'py-execute-region)

;;(global-set-key "\C-cb" 'helm-bookmarks)
