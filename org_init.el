;; ;Setting up org-Mode here

;; My org files (Setting up the enviroment)
(setq org-directory (expand-file-name (file-name-as-directory "~/Dropbox/org")))
(setq org-default-notes-file (concat org-directory "/notes.org"))
(add-to-list 'auto-mode-alist '("\\.org\\'" . org-mode))

;; Files for mobile-org:
(setq org-mobile-directory (expand-file-name "mobileOrg" org-directory))
(setq org-mobile-files  (expand-file-name "default.org" org-directory))
(setq org-mobile-inbox-for-pull (expand-file-name "from-mobile.org" org-directory))

;; org mode General Settings
(add-hook 'org-mode-hook 'turn-on-font-lock) 
(add-hook 'text-mode-hook 'turn-on-auto-fill) ; automatische Zeilenumbrüche
(setq org-completion-use-ido t)
(setq org-return-follows-link t)
(setq org-support-shift-select t)
(setq org-replace-disputed-keys t) ;; Damit Windmove und Cua Funktionieren
(setq org-use-speed-commands t)

;;(setq org-outline-path-complete-in-steps nil)

;; Setting up Agenda Files
(setq org-agenda-files (list "~/Dropbox/org/" "~/Dropbox/org/notes"))

;; Das hier ist fürs refiling 
(setq org-refile-use-outline-path 'file)
(setq org-refile-targets (quote ((org-agenda-files :maxlevel . 3) (nil :maxlevel . 3))))

;; Eigene Workflow States definieren 
(setq org-todo-keywords
      '((sequence "TODO" "STARTED" "|" "FROZEN" "DONE" "DELEGATED")))
;;here was hin
;; Eigene Tag Liste
(setq org-tag-alist '(("privat") ("uni")("Computer")("Linux") ("Someday")))

;; Drawers und log
(setq org-drawers '("PROPERTIES" "CLOCK" "LOGBOOK" "RESULTS" "NOTES"))
(setq org-log-into-drawer t)

;; Setting up Org Keybindings 

(global-set-key "\C-cl" 'org-store-link)
(global-set-key "\C-ca" 'org-agenda)
(global-set-key "\C-cb" 'org-iswitchb)
(define-key global-map "\C-cc" 'org-capture)
(define-key global-map (kbd "<f9>") 'org-capture)

;; Templates für Capture definieren
(setq org-capture-templates 
        '(("t" "TODO" entry (file+headline "~/Dropbox/org/default.org" "Todos") "* TODO %? \nErstellt am %U\n" :empty-lines 1) 
          ("n" "Notes" entry (file "~/Dropbox/org/notes.org") "* %?  \nErstellt am %U \n%A" :empty-lines 1 ) 
          ("j" "Journal" entry (file+datetree "~/Dropbox/org/journal.org") "* %?  Erstellt am %U\n" :empty-lines 1)
          ("i" "Inbox" entry (file+headline  "~/Dropbox/org/default.org" "Inbox" ) "** %?  \nErstellt am %U\n" :empty-lines 1)
))



;setting up Deft (Notiz-Verwaltung, in Kombination mit Org-Mode)
(add-to-list 'load-path "~/.emacs.d/el-get/deft")
(require 'deft)
(setq deft-extension "org")
(setq deft-text-mode 'org-mode)
(setq deft-directory  "~/Dropbox/org/notes")
(setq deft-use-filename-as-title t)

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


;;; org_init.el ends here
