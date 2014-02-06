;c;  keybinds.el --- Setting up my custom binds here


;; Unsets

;; Unbind menu. Will be new modier for some commands maybe
(global-unset-key (kbd" <menu>"))

(global-set-key (kbd "<menu> a ") 'delete-other-windows)

;; moved from Better defaults
(global-set-key (kbd "M-/") 'hippie-expand)
(global-set-key (kbd "C-s") 'isearch-forward-regexp)
(global-set-key (kbd "C-r") 'isearch-backward-regexp)
(global-set-key (kbd "C-M-s") 'isearch-forward)
(global-set-key (kbd "C-M-r") 'isearch-backward)
;; (global-set-key (kbd "M-y") 'helm-show-kill-ring)

;;; Setting up Org Keybindings

(global-set-key "\C-cl" 'org-store-link)
(global-set-key "\C-ca" 'org-agenda)
(global-set-key "\C-cb" 'org-iswitchb)
(define-key global-map "\C-cc" 'org-capture)
(define-key global-map (kbd "<f9>") 'org-capture)
(global-set-key (kbd "C-x C-b") 'helm-buffers-list)


;; Undo-Tree Commands
(global-set-key (kbd "C-z") 'undo) ; 【Ctrl+z】
(global-set-key (kbd "M-z") 'redo) ; 【ALT+z】

;; Smex Stuff
(global-set-key (kbd "M-x") 'smex)
;; (global-set-key (kbd "M-X") 'smex-major-mode-commands)
(global-set-key (kbd "M-X") 'helm-M-x)

;; All the F-Keys I Bind so far
(global-set-key [C-f1] 'show-file-name) ; Immature Function so far, but anyhow
(global-set-key (kbd "<f2>") ' mu4e)
(global-set-key (kbd "<S-f2>") 'helm-mu)
(global-set-key (kbd "<f5>") 'helm-do-grep)
(global-set-key (kbd "<f6>") 'visit-ansi-term)
(global-set-key (kbd "<f7>") ' magit-status)
(global-set-key (kbd "<S-f7>") 'helm-git-find-files)
(global-set-key (kbd "C-c o") 'helm-projectile)
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
;; Binding a bunch of useful stuff for convenient acess.
(key-chord-define-global "cv" ' cua-mode) ; enable or Disable. Sometimes cua get's in the way, and has to be disabled quickly.
(key-chord-define-global "fv" ' my-helm-grep-recursive)

;; Muss UN2BEDINGT neu. Das tippe ich offensichtlich doch so häufig, dass ich mir dann immer die buffer kille, leider oft ohne save. Geht so nicht.
;; (key-chord-define-global  "xx" 'kill-buffer-and-window)

;; (key-chord-define-global "oi" 'other-frame)
(key-chord-define-global "jk" 'ispell-word)

(key-chord-define-global "yy" 'helm-show-kill-ring)

(key-chord-define-global "uu" 'ace-jump-mode)
;; (key-chord-define-global "oo" 'ace-jump-buffer)
(key-chord-define-global "ii" 'ace-jump-line-mode)
(key-chord-define-global "bb" 'helm-mini)

(key-chord-define-global "öä" 'deft)
(key-chord-define-global "cc" 'er/expand-region)
(key-chord-define gnus-dired-mode-map "öä" 'gnus-dired-attach)
;; So schade es ist, ich muss auf das Binding in dieser Form verzichten. Tippe ich im deutschen dann doch viel öfter als ich dachte, von daher keine optino in dieser Formy
;; (key-chord-define-global "rf" 'helm-recentf)


(key-chord-define-global ".." 'ac-complete-with-helm)
(key-chord-define ac-mode-map ".." 'ac-complete-with-helm)

(key-chord-define-global ",," 'helm-yas-complete)
;; Helm-Company
(eval-after-load 'company
  '(progn
     (key-chord-define company-mode-map ".." 'helm-company)
     (key-chord-define company-active-map ".." 'helm-company)))


;; (key-chord-define-global "dd" 'delete-window) ;; Untauglich, das kommt beim schreiben doch immer wieder vor. Ersetzt durch das Default Binding
(key-chord-define-global "zz" 'zap-to-char)
(key-chord-define emacs-lisp-mode-map "qq" 'helm-imenu)
(key-chord-define org-mode-map "qq" 'helm-org-headlines)
(key-chord-define python-mode-map "qq" 'helm-imenu)
;; (key-chord-define-global "qq" 'helm-imenu)
(key-chord-define-global "jj" 'hippie-expand)
(key-chord-define-global "öö" 'my_curly_braces)
(key-chord-define-global "ää" 'my_square_braces)
(key-chord-define-global "ay" 'select-current-line)
(key-chord-define org-mode-map "ww" 'org-todo)
(key-chord-define-global "--" 'makey-key-mode-popup-rectangles)

;; ;; Okay, here are some possible rebinds, from standart commands that i might never use.
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
