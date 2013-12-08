;; Need load-path here, because package is self compiled
(add-to-list 'load-path "/usr/local/share/emacs/site-lisp/mu4e")
(require 'mu4e)

;; default
;; (setq mu4e-maildir "~/Maildir")

(setq mu4e-drafts-folder "/[Gmail].Drafts")
(setq mu4e-sent-folder   "/[Gmail].Sent Mail")
(setq mu4e-trash-folder  "/[Gmail].Trash")

;; don't save message to Sent Messages, Gmail/IMAP takes care of this
(setq mu4e-sent-messages-behavior 'delete)

;; setup some handy shortcuts
;; you can quickly switch to your Inbox -- press ``ji''
;; then, when you want archive some messages, move them to
;; the 'All Mail' folder by pressing ``ma''.
(setq mu4e-maildir-shortcuts
        '( ("/INBOX"               . ?i)
           ("/[Gmail].Sent Mail"   . ?s)
           ("/[Gmail].Trash"       . ?p)
           ("/Tutorium Egl"        . ?t)
           ("/[Gmail].All Mail"    . ?a)))

;; allow for updating mail using 'U' in the main view:
;; disabled: Mails are fetched via a cronjob regularly. Hope that will do
(setq mu4e-get-mail-command "true")

;; something about ourselves
(setq
 user-mail-address "schaumburg777@gmail.com"
 user-full-name  "Samuel Schaumburg"
 message-signature
 (concat
  "Samuel Schaumburg\n"
  "Steinweg 12 , 35037 Marburg\n"))

;; sending mail -- replace USERNAME with your gmail username
;; also, make sure the gnutls command line utils are installed
;; package 'gnutls-bin' in Debian/Ubuntu

(require 'smtpmail)

;; Outgoing Mail
(setq message-send-mail-function 'smtpmail-send-it
     smtpmail-stream-type 'starttls
     smtpmail-default-smtp-server "smtp.gmail.com"
     smtpmail-smtp-server "smtp.gmail.com"
     smtpmail-smtp-service 587)

;; don't keep message buffers around
(setq message-kill-buffer-on-exit t)

;; Vermeidet doppelte Mails in Suchen
(setq  mu4e-headers-skip-duplicates  t)

(setq mu4e-attachment-dir  "~/Downloads")
(setq mu4e-view-show-images t )
;;(when (fboundp 'imagemagick-register-types)
;;  (imagemagick-register-types))
;;(setq mu4e-view-prefer-html t)
(setq mu4e-headers-show-threads nil)
(setq mu4e-html2text-command "html2text -utf8 -width 72")
(setq mu4e-update-interval 60)
;; adding a new mail sound here
(add-hook 'mu4e-index-updated-hook
          (defun new-mail-sound ()
            (shell-command "aplay /home/sschaumburg/Dokumente/cartoon005.wav&> /dev/null")))

;; allowing attachements with dired
(require 'gnus-dired)
;; make the `gnus-dired-mail-buffers' function also work on
;; message-mode derived modes, such as mu4e-compose-mode
(defun gnus-dired-mail-buffers ()
  "Return a list of active message buffers."
  (let (buffers)
    (save-current-buffer
      (dolist (buffer (buffer-list t))
        (set-buffer buffer)
        (when (and (derived-mode-p 'message-mode)
                   (null message-sent-message-via))
          (push (buffer-name buffer) buffers))))
    (nreverse buffers)))

(setq gnus-dired-mail-mode 'mu4e-user-agent)
(add-hook 'dired-mode-hook 'turn-on-gnus-dired-mode)
