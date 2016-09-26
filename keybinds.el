;;  keybinds.el --- Setting up my cuwstom binds here
(use-package bind-key
  :ensure t  )
;;   (bind-key "C-c x" 'my-ctrl-c-x-command)

;; C-c Map
(bind-keys
 ("C-c g" . find-file-at-point)
 ("C-c a" . org-agenda)
 ("C-c l" . org-store-link)
 ("C-c +" . text-scale-increase)
 ("C-c -" . text-scale-decrease)
 )

(global-set-key (kbd "C-c j") ((lambda () (interactive)
                                 (crux-with-region-or-line comment-or-uncomment-region))))

;;Global Map
(bind-keys
 ("C-ä" . delete-other-windows)
 ("M-n" . forward-paragraph)
 ("M-p" . backward-paragraph)
 )

;; Control-x B. ndings
(bind-key "C-x x" 'delete-window)

;; All the F-Keys I Bind so far
(bind-keys
 ("<C-f1>" . show-file-name)
 ("<f5>" . my-search-init-files)
 ("<S-f5>" . my-grep-org-files)
 ("<f9>" . org-capture)
 )

;;  Key-Chords bindings.

(bind-chords
 (".f" .  push-mark-no-activate)
 (".d" .  jump-to-mark)
 ("dd" . my/editing-utils/body)
 (".g" .  helm-do-ag)
 ("jj" . hippie-expand)
 ("jk" . ispell-word)
 (".k" . crux-kill-line-backwards)
 ("kk" .
  (lambda () (interactive)
    (move-beginning-of-line 1)
    (kill-line)))
 ("ää" . my_square_braces)
 ("öö" .  my_curly_braces)
 ("zz" . zop-to-char)
 ("uu" . avy-goto-word-or-subword-1)
 ("ii" . avy-goto-char)
 (".c" .  cua-mode)
 ("vv" . my/window-movement/body)
 ("qq" . hydra-learn-sp/body)
 ("--" . makey-key-mode-popup-rectangles))

(bind-keys :map company-active-map
           ("C-n" . company-select-next)
           ("C-p" . company-select-previous)
           ("TAB" . company-complete)
           ([tab] . company-complete)
           )

(bind-chords :map org-mode-map
             ("M-e" . org-emphasize)
             ("C-j" . org-insert-heading-respect-content)
             (".a" . my/org-hydra/body)
             ("ww" . org-todo)
             )

(bind-chords :map emacs-lisp-mode-map
             ("ee" . eval-last-sexp)
             )

(define-prefix-command 'my/prefix-map)

(define-key my/prefix-map (kbd "j") ((lambda () (interactive)
                                       (crux-with-region-or-line comment-or-uncomment-region))))
(key-chord-define-global ".." 'my/prefix-map)

(bind-key "h" 'my/multiple-cursors-hydra/body 'my/prefix-map)



;; (bind-chord ".." 'my/prefix-map)
