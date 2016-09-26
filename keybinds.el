;;  keybinds.el --- Setting up my cuwstom binds here
(use-package bind-key
  :ensure t  )
;;   (bind-key "C-c x" 'my-ctrl-c-x-command)

;; C-c Map
(bind-keys
 ("C-c g" . find-file-at-point)
 ("C-c j" . comment-or-uncomment-region)
 ("C-c a" . org-agenda)
 ("C-c l" . org-store-link)
 ("C-c +" . text-scale-increase)
 ("C-c -" . text-scale-decrease)
 )

;;Global Map
(bind-keys
 ("C-ä" . delete-other-windows)
 ("M-n" . forward-paragraph)
 ("M-p" . backward-paragraph)
 )

;; Control-x B. ndings
(bind-key "C-x x" 'delete-window)

;; Org Map
(bind-keys :org-mode-map
           ("M-e" . org-emphasize)
           ("C-j" . org-insert-heading-respect-content))

;; All the F-Keys I Bind so far
(bind-keys
 ("<C-f1>" . show-file-name)
 ("<f5>" . my-search-init-files)
 ("<S-f5>" . my-grep-org-files)
 ("<f9>" . org-capture)
 )

.;;    (bind-keys :prefix-map my-customize-prefix-map
;;               :prefix "C-c c"
;;               ("f" . customize-face)
;;               ("v" . customize-variable))


;; my own Prefix map C-y

(define-prefix-command 'my/prefix-map)
(define-key my/prefix-map (kbd "j") 'comment-or-uncomment-region)
(key-chord-define-global ".." 'my/prefix-map)

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
(key-chord-define-global "qq" 'hydra-learn-sp/body)
(key-chord-define org-mode-map "ww"'org-todo)
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
(bind-keys :map company-active-map
           ("C-n" . company-select-next)
           ("C-p" . company-select-previous)
           ("TAB" . company-complete)
           ([tab] . company-complete)
           )
