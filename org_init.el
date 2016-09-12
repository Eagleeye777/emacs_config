;; ;Setting up org-Mode here

;; Defining custom_enviroment variables, I will use to set up
;; templates and stuff later. If I decide to change a file I have
;; everything in one place

(defvar  master_file  "The org masterfile")
(defvar master_file_dir "Directory for my org-master-file")

(setq master_file "default.org") ;Plattformunabhängig


;; Auf Betriebssystem testen. Pfade entsprechend anpassen
(if gnulinux-p
    (progn
      (setq master_file_dir "~/Dropbox/org/")))
(if mswindows-p
    (progn
      (setq master_file_dir "c:/Dropbox/org/"))) ; Korrekten Pfad ermitteln

;; VIP Settings, Always do these first, so they not get lost
(setq org-support-shift-select t)
;; (setq org-replace-disputed-keys t) ;; Damit Windmove und Cua Funktionieren
(setq org-use-speed-commands t)
(setq org-use-property-inheritance t)

;; (add-hook 'org-mode-hook (lambda () (company-mode)))
;; deutsch as export language
(setq org-export-default-language "de")
;; for German Quotes, during latex-export
(setq org-export-with-smart-quotes t)

;; My org files (Setting up the enviroment)
(setq org-directory (expand-file-name (file-name-as-directory master_file_dir)))
(setq org-default-notes-file (concat org-directory "notes.org"))
(add-to-list 'auto-mode-alist '("\\.org\\'" . org-mode))

;; Files for mobile-org (Handy-Export)
(setq org-mobile-directory (expand-file-name "mobileOrg" org-directory))
(setq org-mobile-files  (expand-file-name master_file org-directory))
(setq org-mobile-inbox-for-pull (expand-file-name "from-mobile.org" org-directory))
(setq org-mobile-agendas '("a"))

;; org mode General Settings
(add-hook 'org-mode-hook 'turn-on-font-lock)
(add-hook 'text-mode-hook 'turn-on-auto-fill) ; automatische Zeilenumbrüche
(add-hook 'org-mode-hook 'flyspell-mode)
(setq org-completion-use-ido nil)
(setq org-return-follows-link t)
(setq org-use-speed-commands t)
(setq org-hide-leading-stars 'hidestars)

;; Calender Customization for german:
(setq calendar-week-start-day 1
      calendar-day-name-array
      ["Sonntag" "Montag" "Dienstag" "Mittwoch"
       "Donnerstag" "Freitag" "Samstag"]
      calendar-month-name-array
      ["Januar" "Februar" "März" "April" "Mai"
       "Juni" "Juli" "August" "September"
       "Oktober" "November" "Dezember"])


;; Setting up Agenda Files
;; (setq org-agenda-files (list org-directory (concat org-directory "notes") ))
(setq org-agenda-files (list org-directory))
;; (setq org-agenda-files org-directory)




;; ;; Setting up refiling stuff
;; (setq org-refile-use-outline-path 'file)
;; (setq org-refile-targets (quote ((org-agenda-files :maxlevel . 6) (nil :maxlevel . 6))))
;; (setq org-outline-path-complete-in-steps nil)

;;using sacha-chuas here, to see how that goes
(setq org-reverse-note-order nil)
(setq org-refile-use-outline-path nil)
(setq org-refile-allow-creating-parent-nodes 'confirm)
(setq org-refile-use-cache nil)
(setq org-refile-targets '((org-agenda-files . (:maxlevel . 6))))
(setq org-blank-before-new-entry nil)


;; Define Workflow states
(setq org-todo-keywords
      '((sequence "TODO(t)" "TERM(T)" "STARTED(s@)" "|" "FROZEN(f@)" "DONE(d@)")))

;; Defining faces for Todo Keywords
(setq org-todo-keyword-faces
      '(("TODO"  . (:foreground "#ff4500" :weight bold))
        ("TERM"  . (:foreground "#ffd700" :weight bold))
        ("STARTED"  . (:foreground "#ffd700" :weight bold))
        ("WAITING"  . (:foreground "orange" :weight bold))
        ("FROZEN" . (:foreground "cyan" :weight bold))
        ("DONE"  . (:foreground "forestgreen" :weight bold))
        ("CANCELED"  . shadow)))

;; Custom Tag Liste
(setq org-tag-persitent-alist '(("privat" . ?p)
                                ("org" . ?o)
                                ("emacs" . ?e)
                                ("computer" .?c)
                                ("irgendwann" . ?i)
                                ("Finanzen" . ?f)
                                ("wichtig" . ?w)
                                ("Schule" . ?s)))

(setq org-tag-alist '(("privat" . ?p)
                      ("org" . ?o)
                      ("emacs" . ?e)
                      ("computer" .?c)
                      ("Finanzen" . ?f)
                      ("irgendwann" . ?i)
                      ("wichtig" . ?w)
                      ("Schule" . ?s)))

;; Drawers and logging stuff
(setq org-drawers '("PROPERTIES" "CLOCK" "LOGBOOK" "RESULTS" "NOTES" "Termine"))
(setq org-log-into-drawer t) ;; Eigene Drawer nutzen
(setq org-log-done 'note) ;; Notiz bei Done

(setq org-checkbox-hierarchical-statistics nil)

;; (setq org-default-notes-file (concat org-directory "/notes.org"))

;; Templates for Org-capture
(setq org-capture-templates
      '(

        ("t" "TODO" entry (file+headline (concat master_file_dir master_file) "Todos")
         "* TODO %^{Entry} %^g \n:PROPERTIES:\n :CREATED: %U\n:END:\n %? \n" :empty-lines 1)

        ("T" "TERM" entry (file+headline (concat master_file_dir master_file) "Termine")
         "* TERM %? \n%^T\n :PROPERTIES:\n :CREATED: %U\n:END:\n" :empty-lines 1)

        ;; ("s" "Shopping List" checkitem (file+headline org-default-notes-file "Shopping List"))
        ("e" "Einkaufsliste" checkitem (file+headline (concat master_file_dir master_file) "Einkaufsliste")
         " [ ] %? \n ")

        ("n" "Notes" entry (file+headline (concat master_file_dir master_file) "Notes")
         "* %? :NOTE: \n%U\n%a\n"" :PROPERTIES:\n :CREATED: %U\n:END:\n" :empty-lines 1)

        ("b" "Emacs-Blog" entry (file+headline  "~/Dropbox/org/notes/emacs.org" "Emacs-Blog")
         "* %?\n :PROPERTIES:\n :CREATED: %U\n:END:\n" :empty-lines 1)

        ("d" "Diary" entry (file+datetree (concat master_file_dir "journal.org") )
         "* %? \n \n :PROPERTIES:\n :CREATED: %U\n:END:\n" :empty-lines 1)

        ("E" "Ehe" entry (file+datetree (concat master_file_dir "ehe.org") )
         "* %^{Entry} :ehe: \n CREATED: %U\n %? \n" :empty-lines 1)

        ("k" "Kinder" entry (file+datetree (concat master_file_dir "kinder.org") )
         "* %? \n CREATED: %U\n" :empty-lines 1)

        ("j" "Johanna" entry (file+datetree (concat master_file_dir "johanna.org") )
         "* %? \n Erstellt: %U \n " :empty-lines 1)

        ("i" "Inbox" entry (file+headline (concat master_file_dir master_file) "Inbox" )
         "** %?   \n:PROPERTIES:\n :CREATED: %U\n:END:\n"  :empty-lines 1)

        ("s" "Spiritual" entry (file+datetree (concat master_file_dir "spiritual.org" ))
         "** %?   \n :CREATED: %U\n%^{PROMPT}"  :empty-lines 1)))

;; In this file I define custom Latex-classes for export
(load "~/.emacs.d/org_latex.el")

(defun my-return-from-fn ()
"Making C-c C-c work in longer org-footnotes, no matter where I am currently positioned"
  (let* ((context (org-element-context))
	 (parent (org-element-property :parent context)))
    (when (eq (org-element-type parent) 'footnote-definition)
      (goto-char (org-element-property :post-affiliated context))
      (call-interactively 'org-footnote-action)
      (ergoemacs-forward-close-bracket))))

(add-hook 'org-ctrl-c-ctrl-c-final-hook 'my-return-from-fn)

;;Taken from John wiegly

(defun org-get-global-property (name)
  (save-excursion
    (goto-char (point-min))
    (and (re-search-forward (concat "#\\+PROPERTY: " name " \\(.*\\)") nil t)
         (match-string 1))))


(defun org-agenda-add-overlays (&optional line)
  "Add overlays found in OVERLAY properties to agenda items.
Note that habitual items are excluded, as they already
extensively use text properties to draw the habits graph.

For example, for work tasks I like to use a subtle, yellow
background color; for tasks involving other people, green; and
for tasks concerning only myself, blue.  This way I know at a
glance how different responsibilities are divided for any given
day.

To achieve this, I have the following in my todo file:

  * Work
    :PROPERTIES:
    :CATEGORY: Work
    :OVERLAY:  (face (:background \"#fdfdeb\"))
    :END:
  ** TODO Task
  * Family
    :PROPERTIES:
    :CATEGORY: Personal
    :OVERLAY:  (face (:background \"#e8f9e8\"))
    :END:
  ** TODO Task
  * Personal
    :PROPERTIES:
    :CATEGORY: Personal
    :OVERLAY:  (face (:background \"#e8eff9\"))
    :END:
  ** TODO Task

The colors (which only work well for white backgrounds) are:

  Yellow: #fdfdeb
  Green:  #e8f9e8
  Blue:   #e8eff9

To use this function, add it to `org-agenda-finalize-hook':

  (add-hook 'org-finalize-agenda-hook 'org-agenda-add-overlays)"
  (let ((inhibit-read-only t) l c
        (buffer-invisibility-spec '(org-link)))
    (save-excursion
      (goto-char (if line (point-at-bol) (point-min)))
      (while (not (eobp))
        (let ((org-marker (get-text-property (point) 'org-marker)))
          (when (and org-marker
                     (null (overlays-at (point)))
                     (not (get-text-property (point) 'org-habit-p))
                     (string-match "\\(sched\\|dead\\|todo\\)"
                                   (get-text-property (point) 'type)))
            (let ((overlays
                   (or (org-entry-get org-marker "OVERLAY" t)
                       (with-current-buffer (marker-buffer org-marker)
                         (org-get-global-property "OVERLAY")))))
              (when overlays
                (goto-char (line-end-position))
                (let ((rest (- (window-width) (current-column))))
                  (if (> rest 0)
                      (insert (make-string rest ? ))))
                (let ((ol (make-overlay (line-beginning-position)
                                        (line-end-position)))
                      (proplist (read overlays)))
                  (while proplist
                    (overlay-put ol (car proplist) (cadr proplist))
                    (setq proplist (cddr proplist))))))))
        (forward-line)))))

(add-hook 'org-finalize-agenda-hook 'org-agenda-add-overlays)




                                        ;setting up Deft for convenient notes view and search
                                        ; Todo: Get rid of Deft and replace with a customized Version of Hem-grep

;; Deft has been removed in Favour of helm-do-grep

;; (use-package deft
;;   :ensure   t
;;   :config
;;   (setq deft-extension "org")
;;   (setq deft-text-mode 'org-mode)
;;   (setq deft-directory "~/Dropbox/org/")
;;   (setq deft-recursive t)
;;   (setq deft-use-filename-as-title))


;; (require 'org-gcal)
;; (setq org-gcal-client-id "60571600375-7k1hkd0gd8170qh8t4eodupnh8cs9kh9.apps.googleusercontent.com")
;; (setq org-gcal-client-secret "tAELBEaMcPd8wXZL9qy4jhGP")
;; (setq org-gcal-file-alist '(("an5jn7d21lr01ti1j1dgpoeobs@group.calendar.google.com" .  "~/schedule.org")))
(use-package calfw
  :ensure t)
(use-package calfw-ical)
(use-package org-gcal
  :ensure t
  :config (setq org-gcal-client-id "60571600375-7k1hkd0gd8170qh8t4eodupnh8cs9kh9.apps.googleusercontent.com"
                org-gcal-client-secret "tAELBEaMcPd8wXZL9qy4jhGP"
                org-gcal-file-alist '(("samuel.schaumburg@googlemail.com" .  "~/schedule.org")
                                      ("an5jn7d21lr01ti1j1dgpoeobs@group.calendar.google.com"
                                       . "~/schedule.org"))))

;; (setq org-gcal-client-id "60571600375-7k1hkd0gd8170qh8t4eodupnh8cs9kh9.apps.googleusercontent.com")
;; (setq org-gcal-client-secret "tAELBEaMcPd8wXZL9qy4jhGP")
;; (setq org-gcal-file-alist '(("samuel.schaumburg@googlemail.com" . "~/schedule.org")))



;; org_init.el ends here


;; (setq org-latex-to-pdf-process
;;   '("latex -interaction nonstopmode %f"
;;      "latex -interaction nonstopmode %f")) ;; for multiple passes


;; ;;; Versuchter Kalenderexport. Das ganze schlägt momentan aber fehl
;; ;;; Hier die Anleitung http://orgmode.org/worg/org-tutorials/org-google-sync.html


;; ;;; define categories that should be excluded
;; (setq org-export-exclude-category (list "google" "private"))

;; ;;; define filter. The filter is called on each entry in the agenda.
;; ;;; It defines a regexp to search for two timestamps, gets the start
;; ;;; and end point of the entry and does a regexp search. It also
;; ;;; checks if the category of the entry is in an exclude list and
;; ;;; returns either t or nil to skip or include the entry.


;; (defun org-mycal-export-limit ()
;;   "Limit the export to items that have a date, time and a range. Also exclude certain categories."
;;   (setq org-tst-regexp "<\\([0-9]\\{4\\}-[0-9]\\{2\\}-[0-9]\\{2\\} ... [0-9]\\{2\\}:[0-9]\\{2\\}[^\r\n>]*?\
;; \)>")
;;   (setq org-tstr-regexp (concat org-tst-regexp "--?-?" org-tst-regexp))
;;   (save-excursion
;;     ; get categories
;;     (setq mycategory (org-get-category))
;;     ; get start and end of tree
;;     (org-back-to-heading t)
;;     (setq mystart    (point))
;;     (org-end-of-subtree)
;;     (setq myend      (point))
;;     (goto-char mystart)
;;     ; search for timerange
;;     (setq myresult (re-search-forward org-tstr-regexp myend t))
;;     ; search for categories to exclude
;;     (setq mycatp (member mycategory org-export-exclude-category))
;;     ; return t if ok, nil when not ok
;;     (if (and myresult (not mycatp)) t nil)))

;; ;;; activate filter and call export function
;; (defun org-mycal-export ()
;;   (let ((org-icalendar-verify-function 'org-mycal-export-limit))
;;     (org-export-icalendar-combine-agenda-files)))

;; (load "~/.emacs.d/org_ac_fix.el")
