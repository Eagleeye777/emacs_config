(require 'mu4e)

;;Setting up the default Gmail Folders
(setq mu4e-drafts-folder "/[Google Mail].Entw&APw-rfe")
(setq mu4e-sent-folder   "/[Google Mail].Gesendet")
(setq mu4e-trash-folder  "/[Google Mail].Papierkorb/")

;; don't save message to Sent Messages, Gmail/IMAP takes care of this
(setq mu4e-sent-messages-behavior 'delete)

;; setup some handy shortcuts
(setq mu4e-maildir-shortcuts
        '( ("/INBOX"                       . ?i)
           ("/[Google Mail].Gesendet"       . ?s)
           ("/[Google Mail].Papierkorb"          . ?p)
           ("/[Google Mail].Alle Nachrichten"    . ?a)))

;; allow for updating mail using 'U' in the main view:
;; disabled: Mails are fetched via a cronjob regularly. Hope that will do
(setq mu4e-get-mail-command "true")

;; something about ourselves
(setq
 user-mail-address "samuel.schaumburg@gmail.com"
 user-full-name  "Samuel Schaumburg"
 message-signature
 (concat
  "Samuel Schaumburg\n"
  "Steinweg 12 , 35037 Marburg\n"))

;; hopefully fixing the signature bug here
(setq mu4e-compose-signature message-signature)

;; sending mail -- replace USERNAME with your gmail username
;; also, make sure the gnutls command line utils are installed
;; package 'gnutls-bin' in Debian/Ubuntu

(require 'smtpmail)
    (setq starttls-use-gnutls t)
    (setq starttls-gnutls-program "gnutls-cli")
    (setq starttls-extra-arguments nil)
;; ;; Outgoing Mail
;; (setq message-send-mail-function 'smtpmail-send-it
;;       starttls-use-gnutls t
;;       smtpmail-auth-credentials
;;       '(("smtp.gmail.com" 587 "samuel.schaumburg@googlemail.com" nil))
;;       smtpmail-default-smtp-server "smtp.gmail.com"
;;       smtpmail-smtp-server "smtp.gmail.com"
;;       smtpmail-smtp-service 587)

(setq message-send-mail-function 'smtpmail-send-it
      starttls-use-gnutls t
      smtpmail-starttls-credentials '(("smtp.gmail.com" 587 nil nil))
      smtpmail-default-smtp-server "smtp.gmail.com"
      smtpmail-smtp-server "smtp.gmail.com"
      smtpmail-smtp-service 587
      smtpmail-debug-info t
      smtpmail-auth-credentials)

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
(setq mu4e-update-interval nil)
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

;; Making sure we can link mail to org
;;(require 'org-mu4e)

;; Multiple Account settings here


(defvar my-mu4e-account-alist
  '(("Gmail"
     (mu4e-sent-folder "/Gmail/[Gmail].Sent Mail")
     (mu4e-drafts-folder "/Gmail/[Gmail].Drafts")
     (user-mail-address "samuel.schaumburg@gmail.com")
     (smtpmail-default-smtp-server "smtp.gmail.com")
     (smtpmail-smtp-server "smtp.gmail.com")
     (smtpmail-stream-type starttls)
     (smtpmail-smtp-service 587))
    ;; ("Hotmail"
    ;;  (mu4e-sent-folder "/Hotmail/Saved Items")
    ;;  (mu4e-drafts-folder "/Hotmail/Drafts")
    ;;  (user-mail-address "eagleeye777@hotmail.de")
    ;;  (smtpmail-default-smtp-server "smtp-mail.outlook.com")
    ;;  (smtpmail-smtp-server "smtp-mail.outlook.com")
    ;;  (smtpmail-stream-type starttls)
    ;;  (smtpmail-smtp-service 587)))
    ))

(defun my-mu4e-set-account ()
  "Set the account for composing a message."
  (let* ((account
          (if mu4e-compose-parent-message
              (let ((maildir (mu4e-message-field mu4e-compose-parent-message :maildir)))
                (string-match "/\\(.*?\\)/" maildir)
                (match-string 1 maildir))
            (completing-read (format "Compose with account: (%s) "
                                     (mapconcat #'(lambda (var) (car var)) my-mu4e-account-alist "/"))
                             (mapcar #'(lambda (var) (car var)) my-mu4e-account-alist)
                             nil t nil nil (caar my-mu4e-account-alist))))
         (account-vars (cdr (assoc account my-mu4e-account-alist))))
    (if account-vars
        (mapc #'(lambda (var)
                  (set (car var) (cadr var)))
              account-vars)
      (error "No email account found"))))

(add-hook 'mu4e-compose-pre-hook 'my-mu4e-set-account)
