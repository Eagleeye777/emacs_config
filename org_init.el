;; ;Setting up org-Mode here

;; Defining custom_enviroment variables, I will use to set up
;; templates and stuff later. If I decide to change a file I have
;; everything in one place

(defvar  master_file  "The org masterfile")
(defvar master_file_dir "Directory for my org-master-file")

(setq master_file "default.org")
(setq master_file_dir "~/Dropbox/org/")


;; VIP Settings, Always do these first, so they not get lost
(setq org-support-shift-select t)
(setq org-replace-disputed-keys t) ;; Damit Windmove und Cua Funktionieren


(add-hook 'org-mode-hook (lambda () (company-mode)))
;; Very important: With org-mode >V. 7 use ox-latex here, not org-latex as before

;; deutsch as export language
(setq org-export-default-language "de")
;; for German Quotes, during latex-export
(setq org-export-with-smart-quotes t)

;; My org files (Setting up the enviroment)
(setq org-directory (expand-file-name (file-name-as-directory master_file_dir)))
(setq org-default-notes-file (concat org-directory "/notes.org"))
(add-to-list 'auto-mode-alist '("\\.org\\'" . org-mode))

;; Files for mobile-org (Handy-Export)
(setq org-mobile-directory (expand-file-name "mobileOrg" org-directory))
(setq org-mobile-files  (expand-file-name master_file org-directory))
(setq org-mobile-inbox-for-pull (expand-file-name "from-mobile.org" org-directory))

;; org mode General Settings
(add-hook 'org-mode-hook 'turn-on-font-lock)
(add-hook 'text-mode-hook 'turn-on-auto-fill) ; automatische Zeilenumbrüche
(add-hook 'org-mode-hook 'flyspell-mode)
(setq org-completion-use-ido t)
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
(setq org-agenda-files (list org-directory (concat org-directory "/notes") ))

;; Setting up refiling stuff
(setq org-refile-use-outline-path 'file)
(setq org-refile-targets (quote ((org-agenda-files :maxlevel . 3) (nil :maxlevel . 3))))

;; Define Workflow states
(setq org-todo-keywords
      '((sequence "TODO(t)" "STARTED(s)" "|" "FROZEN(f@)" "DONE(d@)")))

;; Custom Tag Liste
(setq org-tag-alist '(("privat" . ?p)
                      ("uni" . ?u)
                      ("org" . ?o)
                      ("emacs" . ?e)
                      ("linux" .?l)
                      ("someday" . ?s)))

;; Drawers and logging stuff
(setq org-drawers '("PROPERTIES" "CLOCK" "LOGBOOK" "RESULTS" "NOTES"))
(setq org-log-into-drawer t)
(setq org-log-done 'note)


;; (setq org-default-notes-file (concat org-directory "/notes.org"))

;; Templates for Org-capture
(setq org-capture-templates
      '(
        ("t" "TODO" entry (file+headline (concat master_file_dir master_file) "Todos")
         "* TODO %? \n:PROPERTIES:\n :CREATED: %U\n:END:\n" :empty-lines 1)

        ("n" "Notes" entry (file (concat org-default-notes-file))
         "* %?  \n :PROPERTIES:\n :CREATED: %U\n:END:\n" :empty-lines 1)

        ("e" "Emacs-Blog" entry (file+headline  "~/Dropbox/org/notes/emacs.org" "Emacs-Blog")
         "* %?\n :PROPERTIES:\n :CREATED: %U\n:END:\n" :empty-lines 1)

        ("j" "Journal" entry (file+datetree (concat master_file_dir "journal.org") )
         "* %? \n \n :PROPERTIES:\n :CREATED: %U\n:END:\n" :empty-lines 1)

        ("i" "Inbox" entry (file+headline (concat master_file_dir master_file) "Inbox" )
         "** %?  \nErstellt am %U\n" :empty-lines 1)))

;; In this file I define custom Latex-classes for export
(load "~/.emacs.d/org_latex.el")


;setting up Deft for convenient notes view and search
; Todo: Get rid of Deft and replace with a customized Version of Helm-grep

(require 'deft)
(setq deft-extension "org")
(setq deft-text-mode 'org-mode)
(setq deft-directories
       '("~/Dropbox/org/notes"))
(add-to-list 'deft-directories "~/Dropbox/org/egl_tutorium")
(add-to-list 'deft-directories "~/Dropbox/org/")
(add-to-list 'deft-directories "~/Dropbox/Staatsexamen/Hericks_Klausur")
(setq deft-use-filename-as-title t)


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
