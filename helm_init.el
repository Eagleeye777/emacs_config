;; Load Helm and remap Prefix and stuff
(use-package helm
  :ensure t
  :init
  (helm-mode 1)
  (with-eval-after-load 'helm-config
    (warn "Helm Config loaded"))
  :config
  (setq  helm-always-two-windows t)
  (setq helm-split-window-default-side 'right)
  (global-set-key (kbd "C-c h") 'helm-command-prefix)
  (global-unset-key (kbd "C-x c"))
  ;;(global-set-key (kbd "M-x") 'helm-M-x)
  (define-key helm-map (kbd "<tab>") 'helm-execute-persistent-action) ; rebind tab to run persistent action
  (define-key helm-map (kbd "C-i") 'helm-execute-persistent-action) ; make TAB works in terminal
  (define-key helm-map (kbd "C-z")  'helm-select-action) ; list actions using C-z
  :bind (
         "C-c r". helm-resume)

  :diminish helm-mode
  )

;; (require 'helm-config)
;; Make M-x use helm
(use-package helm-command
  :ensure helm
  :defer t
  :bind (([remap execute-extended-command] . helm-M-x))
  )
(use-package helm-org
  :ensure helm
  :defer t
  :bind ("C-c i" . helm-org-in-buffer-headings )
  )
;; Helm Buffers
(use-package helm-buffers
  :ensure helm
  :defer t
  :bind (
         ([remap switch-to-buffer] . helm-buffers-list)
         ("C-x C-b" . helm-buffers-list)
         :map helm-buffer-map ("C-+"  . helm-toggle-buffers-details)
         )
  :chords ("bb" . helm-mini)
  :config (setq helm-buffers-fuzzy-matching t)
  (setq ido-use-virtual-buffers t)
  )

(use-package helm-bookmark
  :ensure helm
  :defer t
  :chords (".b" . helm-bookmarks)
  )

;;Use Helm for find files
(use-package helm-files
  :ensure helm
  :defer t
  :bind (
         ([remap find-file] . helm-find-files)
         ( "C-x f" . helm-find-files)
         ("C-c f". helm-recentf)
         )
  :config
  (setq helm-recentf-fuzzy-match t
        helm-ff-file-name-history-use-recentf t
        helm-ff-search-library-in-sexp t)
  )

(use-package projectile
  :ensure t)

(use-package helm-projectile
  :ensure t)

(use-package helm-ag                    ; Helm frontend for Ag
  :ensure t
  :bind (("C-c s a" . helm-ag)
         ("C-c s A" . helm-do-ag))
  :config
  (validate-setq
   helm-ag-fuzzy-match t                ; Fuzzy matching
   helm-ag-insert-at-point 'symbol      ; Default to symbol at point
   helm-ag-edit-save t                  ; save buffers after editing
   ))

(use-package helm-imenu
  :ensure helm
  :defer t
  :config
  (setq helm-imenu-fuzzy-match    t)
  :bind (:map prog-mode-map ("C-c i". helm-imenu))
  )

;; Use apropos with helm
(use-package helm-elisp
  :ensure helm
  :defer t
  :bind (([remap apropos-command] . helm-apropos))
  :config (setq helm-apropos-fuzzy-match t)
  )
;;Helm-Swoop (Unfinished)
(use-package helm-swoop
  :ensure t
  :preface
  (defun my/swoop_wrapper (&optional arg)
    "docstring"
    (interactive "P")
    (save-excursion
      (push-mark-no-activate)
      (beginning-of-buffer))
    (helm-swoop)
    )
  :bind(
        ("M-i" . my/swoop_wrapper )
        ("M-I" . helm-swoop-back-to-last-point)
        ("C-c M-i" . helm-multi-swoop)
        ("C-x M-i" . helm-multi-swoop-all)
        :map helm-swoop-map
        ("C-r" . helm-previous-line)
        ("C-s" . helm-next-line)
        )
  :config
  (define-key isearch-mode-map (kbd "M-i") 'helm-swoop-from-isearch)
  )

;;Browse Mark Ring and Kill Ring
(use-package helm-ring
  :ensure helm
  :defer t
  :bind ("C-c d" . helm-all-mark-rings)
  :chords ("yy" . helm-show-kill-ring)
  )

;; Helm Descbinds
(use-package helm-descbinds
  :ensure t
  :init    (helm-descbinds-mode)
  :config (setq helm-descbinds-window-style 'split-window)
  :chords (".q" . helm-descbinds)
  )
