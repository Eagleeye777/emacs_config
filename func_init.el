;; Just trying to work around an issue wiht zsh Shell in Emacs.
;; Try to switch back to bash during emacsc use.
(setq shell-file-name "/bin/bash")

(require 'term)

;;requires whole-line-or-region
(defun my/copy_line (prefix)
  (interactive "p")
  (whole-line-or-region-kill-ring-save prefix)
  (message "Line copied")
  )

(defun visit-ansi-term ()
  "If the current buffer is:
     1) a running ansi-term named *ansi-term*, rename it.
     2) a stopped ansi-term, kill it and create a new one.
     3) a non ansi-term, go to an already running ansi-term
        or start a new one while killing a defunt one"
  (interactive)
  (let ((is-term (string= "term-mode" major-mode))
        (is-running (term-check-proc (buffer-name)))
        (term-cmd "/bin/bash")
        (anon-term (get-buffer "*ansi-term*")))
    (if is-term
        (if is-running
            (if (string= "*ansi-term*" (buffer-name))
                (call-interactively 'rename-buffer)
              (if anon-term
                  (switch-to-buffer "*ansi-term*")
                (ansi-term term-cmd)))
          (kill-buffer (buffer-name))
          (ansi-term term-cmd))
      (if anon-term
          (if (term-check-proc "*ansi-term*")
              (switch-to-buffer "*ansi-term*")
            (kill-buffer "*ansi-term*")
            (ansi-term term-cmd))
        (ansi-term term-cmd)))))

 ; Datumsfunktion einfügen
(defun insert-date ()
"Insert the Date at point"
(interactive)
(insert (format-time-string "%d.%m %Y")))

;; stealing from the Prelude pack

(defun prelude-search (query-url prompt)
  "Open the search url constructed with the QUERY-URL.
 PROMPT sets the `read-string prompt."
  (browse-url
   (concat query-url
           (url-hexify-string
            (if mark-active
                (buffer-substring (region-beginning) (region-end))
              (read-string prompt))))))

(defun prelude-google ()
  "Googles a query or region if any."
  (interactive)
  (prelude-search "http://www.google.de/search?q=" "Google: "))

(defun client-save-kill-emacs(&optional display)
  " This is a function that can bu used to shutdown save buffers and
shutdown the emacs daemon. It should be called using
emacsclient -e '(client-save-kill-emacs)'.  This function will
check to see if there are any modified buffers or active clients
or frame.  If so an x window will be opened and the user will
be prompted."

  (let (new-frame modified-buffers active-clients-or-frames)

    ; Check if there are modified buffers or active clients or frames.
    (setq modified-buffers (modified-buffers-exist))
    (setq active-clients-or-frames ( or (> (length server-clients) 1)
					(> (length (frame-list)) 1)
				       ))

    ; Create a new frame if prompts are needed.
    (when (or modified-buffers active-clients-or-frames)
      (when (not (eq window-system 'x))
	(message "Initializing x windows system.")
	(x-initialize-window-system))
      (when (not display) (setq display (getenv "DISPLAY")))
      (message "Opening frame on display: %s" display)
      (select-frame (make-frame-on-display display '((window-system . x)))))

    ; Save the current frame.
    (setq new-frame (selected-frame))


    ; When displaying the number of clients and frames:
    ; subtract 1 from the clients for this client.
    ; subtract 2 from the frames this frame (that we just created) and the default frame.
    (when ( or (not active-clients-or-frames)
	       (yes-or-no-p (format "There are currently %d clients and %d frames. Exit anyway?" (- (length server-clients) 1) (- (length (frame-list)) 2))))

      ; If the user quits during the save dialog then don't exit emacs.
      ; Still close the terminal though.
      (let((inhibit-quit t))
             ; Save buffers
	(with-local-quit
	  (save-some-buffers))

	(if quit-flag
	  (setq quit-flag nil)
          ; Kill all remaining clients
	  (progn
	    (dolist (client server-clients)
	      (server-delete-client client))
		 ; Exit emacs
	    (kill-emacs)))
	))

    ; If we made a frame then kill it.
    (when (or modified-buffers active-clients-or-frames) (delete-frame new-frame))
    )
  )

(defun modified-buffers-exist()
  "This function will check to see if there are any buffers
that have been modified.  It will return true if there are
and nil otherwise. Buffers that have buffer-offer-save set to
nil are ignored."
  (let (modified-found)
    (dolist (buffer (buffer-list))
      (when (and (buffer-live-p buffer)
		 (buffer-modified-p buffer)
		 (not (buffer-base-buffer buffer))
		 (or
		  (buffer-file-name buffer)
		  (progn
		    (set-buffer buffer)
		    (and buffer-offer-save (> (buffer-size) 0))))
		 )
	(setq modified-found t)
	)
      )
    modified-found
    )
  )

(defun ca-with-comment (str)
  (format "%s%s%s" comment-start str comment-end))

(defun ca-all-asscs (asslist query)
  "returns a list of all corresponding values (like rassoc)"
  (cond
   ((null asslist) nil)
   (t
    (if (equal (cdr (car asslist)) query)
        (cons (car (car asslist)) (ca-all-asscs (cdr asslist) query))
      (ca-all-asscs (cdr asslist) query)))))

;; Glaube, die hier habe ich immer noch nicht zum laufen gekriegt
(defun leo (word)
  (interactive "Word: ")
  (browse-url (format "http://dict.leo.org/?search=%s" word)))

(global-set-key (kbd "C-c C-l") 'leo-at-point)

(defun leo-at-point ()
  "Open the Leo dictionary for the word at point."
  (interactive)
  (let ((word (thing-at-point 'word)))
    (if (not word)
        (error "No word found at point")
      (browse-url-generic (format "http://dict.leo.org/?search=%s#results"
                          word)))))

;; Helper Functions for fixing the mark in Trancient mark mode

(defun push-mark-no-activate ()
  "Pushes `point' to `mark-ring' and does not activate the region
Equivalent to \\[set-mark-command] when \\[transient-mark-mode] is disabled"
  (interactive)
  (push-mark (point) t nil)
  (message "Pushed mark to ring"))

(defun jump-to-mark ()
  "Jumps to the local mark, respecting the `mark-ring' order.
This is the same as using \\[set-mark-command] with the prefix argument."
  (interactive)
  (set-mark-command 1))

(defun exchange-point-and-mark-no-activate ()
  "Identical to \\[exchange-point-and-mark] but will not activate the region."
  (interactive)
  (exchange-point-and-mark)
  (deactivate-mark nil))
(define-key global-map [remap exchange-point-and-mark] 'exchange-point-and-mark-no-activate)

;; Hilfsfunktionen, die ein paar Klammern einfügen und den Curor in die Mitte der Klammer setzten.
;; Ziel: Die im deutschen Tastaturlayout mühsam erreichbaren Klammern über einen Key-Chord effektiv einfügen, falls ich sie brauche.
(defun my_curly_braces ()
  "Trying to set up set of curly braces here"
  (interactive)
(insert "{}")
(backward-char 1)
)

(defun my_square_braces ()
  "Trying to set up set of square braces here"
  (interactive)
(insert "[]")
(backward-char 1)
)
(defun prelude-recompile-elc-on-save ()
  "Recompile your elc when saving an elisp file."
  (add-hook 'after-save-hook
            (lambda ()
              (when (file-exists-p (byte-compile-dest-file buffer-file-name))
                (emacs-lisp-byte-compile)))
            nil
           t))

(defun select-current-line ()
  "Select the current line"
  (interactive)
  (beginning-of-line) ; move to end of line
  (set-mark (line-end-position)))

(defun comment-line (arg)
  (interactive "*P")
  (select-current-line)
  (comment-dwim arg)
  )


;; convenien functions for setting up color themes easily
(defun zb ()
  (interactive)
  (unless (package-installed-p 'zenburn-theme)
    (package-install 'zenburn-theme))
  (load-theme 'zenburn)
  (set-face-background 'vertical-border "black")
  (set-face-foreground 'vertical-border "black")
  (require 'hl-line)
  (set-face-background 'hl-line "gray17")

  ;; (eval-after-load 'magit
  ;;   '(progn (set-face-background 'magit-item-highlight "black")
  ;;           (set-face-background 'diff-refine-change "grey10")))

  (set-face-foreground 'eshell-prompt "turquoise"))

(defun mk ()
  (interactive)
  (unless (package-installed-p 'monokai-theme)
    (package-install 'monokai-theme))
  (load-theme 'monokai)
  (set-face-background 'vertical-border "black")
  (set-face-foreground 'vertical-border "black")
  (require 'hl-line)
  (set-face-foreground 'eshell-prompt "turquoise1")
  (set-face-background 'hl-line "black")
  ;; (eval-after-load 'diff-mode
  ;;   '(set-face-background 'diff-refine-change "gray18"))
  (eval-after-load 'magit
    '(set-face-background 'magit-item-highlight "black"))
)

(defun db ()
  (interactive)
  (load-theme 'deeper-blue)
  (set-face-background 'hl-line "dark slate gray")
  (eval-after-load 'magit
    '(progn (set-face-background 'magit-item-highlight "black"))))

;;making helm work with golden ratio
(defun pl/helm-alive-p ()
  (if (boundp 'helm-alive-p)
      (symbol-value 'helm-alive-p)))
(add-to-list 'golden-ratio-inhibit-functions 'pl/helm-alive-p)

(defun show-file-name ()
  (interactive)
  (kill-new (buffer-file-name))
  (message (buffer-file-name)))

(defun my-hippie-expand-completions (&optional hippie-expand-function)
  "Return the full list of possible completions generated by `hippie-expand'.
    The optional argument can be generated with `make-hippie-expand-function'."
  (let ((this-command 'my-hippie-expand-completions)
        (last-command last-command)
        (buffer-modified (buffer-modified-p))
        (hippie-expand-function (or hippie-expand-function 'hippie-expand)))
    (cl-flet ((ding)) ; avoid the (ding) when hippie-expand exhausts its options.
      (while (progn
               (funcall hippie-expand-function nil)
               (setq last-command 'my-hippie-expand-completions)
               (not (equal he-num -1)))))
    ;; Evaluating the completions modifies the buffer, however we will finish
    ;; up in the same state that we began.
    (set-buffer-modified-p buffer-modified)
    ;; Provide the options in the order in which they are normally generated.
    (delete he-search-string (reverse he-tried-table))))

(defmacro my-ido-hippie-expand-with (hippie-expand-function)
  "Generate an interactively-callable function that offers ido-based completion
    using the specified hippie-expand function."
  `(call-interactively
    (lambda (&optional selection)
      (interactive
       (let ((options (my-hippie-expand-completions ,hippie-expand-function)))
         (if options
             (list (ido-completing-read "Completions: " options)))))
      (if selection
          (he-substitute-string selection t)
        (message "No expansion found")))))

(defun my-ido-hippie-expand ()
  "Offer ido-based completion for the word at point."
  (interactive)
  (my-ido-hippie-expand-with 'hippie-expand))

(global-set-key (kbd "C-c /") 'my-ido-hippie-expand)

(defun my-ido-hippie-expand-filename ()
  "Offer ido-based completion for the filename at point."
  (interactive)
  (my-ido-hippie-expand-with
   (make-hippie-expand-function '(try-complete-file-name))))

(global-set-key (kbd "C-c C-f") 'my-ido-hippie-expand-filename)

(eval-after-load 'tramp '(setenv "SHELL" "/bin/bash"))

(defadvice ido-find-file (after find-file-sudo activate)
  "Find file as root if necessary."
  (unless (and buffer-file-name
               (file-writable-p buffer-file-name))
    (find-alternate-file (concat "/sudo:root@localhost:" buffer-file-name))))



;; This is my replacement for the deft extension for Org-browsing

(defun my-grep-org-files ()
  (interactive)
  (let ((files (helm-walk-directory "~/Dropbox/org"
                                    :path 'full
                                    :directories nil
                                    :match ".*\\.org$"
                                    :skip-subdirs t)))
    (helm-do-grep-1 files)))

(defun my/switch-to-previous-buffer ()
  "Switch to previously open buffer.
Repeated invocations toggle between the two most recently open buffers."
  (interactive)
  (switch-to-buffer (other-buffer (current-buffer) 1)))

(defun my-search-init-files ()
  (interactive)
  (let ((files (helm-walk-directory "~/.emacs.d"
                                    :path 'full
                                    :directories nil
                                    :match ".*\\.el$"
                                    :skip-subdirs t)))
    (helm-do-grep-1 files)))

(defun my/org-check-agenda ()
  "Peek at agenda."
  (interactive)
  (cond
   ((derived-mode-p 'org-agenda-mode)
    (if (window-parent) (delete-window) (bury-buffer)))
   ((get-buffer "*Org Agenda*")
    (switch-to-buffer-other-window "*Org Agenda*"))
   (t (org-agenda nil "a"))))


(defun create-scratch-buffer ()
  "Create a new scratch buffer."
  (interactive)
  (progn
    (switch-to-buffer
     (get-buffer-create (generate-new-buffer-name "*scratch*")))
    (emacs-lisp-mode)
    (insert initial-scratch-message)))



(defun my-append-to-file (start end)
  "Append the contents of the region to the end of file FILENAME.
When called from a function, expects three arguments, START, END
and FILENAME. START and END are normally buffer positions
specifying the part of the buffer to write. If START is nil, that
means to use the entire buffer contents. If START is a string,
then output that string to the file instead of any buffer
contents; END is ignored."

  (interactive "r" )
  (write-region "\n" end "~/.emacs.d/leftover.org" t )
  (write-region start end "~/.emacs.d/leftover.org" t)
  (write-region "\n" end "~/.emacs.d/leftover.org" t ))

;; I have moved from paredi, so I might not need this one anymore
;; (defun my-paredit-delete (beg end)
;;   "Delete the region selected"
;;   (interactive "r")
;;   (unless (and beg end)
;;     (error "The mark is not set"))
;;   (kill-region beg end)  )

;; (defun my-paredit-autopair-switch ()
;;   (interactive)
;;   (paredit-mode 'toggle)
;;   (autopair-mode 'toggle)
;;   (if paredit-mode (message "Switched to paredit")
;;     (message "Switched to autopair")))

(defun endless/fill-or-unfill ()
  "Like `fill-paragraph', but unfill if used twice."
  (interactive)
  (let ((fill-column
         (if (eq last-command 'endless/fill-or-unfill)
             (progn (setq this-command nil)
                    (point-max))
           fill-column)))
    (call-interactively #'fill-paragraph)))

(global-set-key [remap fill-paragraph]
                #'endless/fill-or-unfill)


;; Automatically byte-compile lisp-files, incase they are already
(defun byte-compile-current-buffer ()
  "`byte-compile' current buffer if it's emacs-lisp-mode and compiled file exists."
  (interactive)
  (when (and (eq major-mode 'emacs-lisp-mode)
             (file-exists-p (byte-compile-dest-file buffer-file-name)))
    (byte-compile-file buffer-file-name)))

;; Könnte nicht mehr funktionieren, bin jetzt auf workgroup 2. prüfen

;; (defun create-temp-wg ()
;;   (interactive)
;;   (let (my-tmp-wg )
;;     (setq my-tmp-wg (wg-make-default-workgroup "tmp"))
;;     (wg-check-and-add my-tmp-wg)
;;     (wg-switch-to-workgroup my-tmp-wg)
;;     (wg-update-workgroup my-tmp-wg)))


(defun my/org-check-agenda ()
  "Peek at agenda."
  (interactive)
  (cond
   ((derived-mode-p 'org-agenda-mode)
    (if (window-parent) (delete-window) (bury-buffer)))
   ((get-buffer "*Org Agenda*")
    (switch-to-buffer-other-window "*Org Agenda*"))
   (t (org-agenda nil "a"))))

;; Copy entire buffer
(defun my/copy/buffer ()
  "Copy whole Buffer to clipboard"
  (interactive)
  (kill-new (buffer-string))
  (message "Buffer copied")
  )


(provide 'func-init)
;; ;; This would have been usefull, if I could make helm work with ack-grep

;; (defun eselect-toggle-grep ()
;;   (interactive)
;;   (when (y-or-n-p (format "Current grep program is %s, switching? "
;;                           (helm-grep-command)))
;;     (if (helm-grep-use-ack-p)
;;         (setq helm-grep-default-command
;;               "grep -d skip %e -n%cH -e %p %f"
;;               helm-grep-default-recurse-command
;;               "grep -d recurse %e -n%cH -e %p %f")
;;         (setq helm-grep-default-command
;;               "ack-grep -Hn --smart-case --no-group --no-color %e %p %f"
;;               helm-grep-default-recurse-command
;;               "ack-grep -H --smart-case --no-group --no-color %e %p %f"))
;;     (message "Switched to %s" (helm-grep-command))))
