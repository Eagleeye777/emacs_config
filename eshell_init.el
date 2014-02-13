;; init e-shell during start-up
(require 'pcomplete-extension)
(add-hook 'emacs-startup-hook #'(lambda ()
                                  (let ((default-directory (getenv "HOME")))
                                    (command-execute 'eshell)
                                    (bury-buffer))))

;; Set-up Completion
(add-hook 'eshell-mode-hook
          #'(lambda ()
              (define-key eshell-mode-map
                [remap eshell-pcomplete]
                'helm-esh-pcomplete)))


(defun pcomplete/sudo ()
  (let ((prec (pcomplete-arg 'last -1)))
    (cond ((string= "sudo" prec)
           (while (pcomplete-here*
                    (funcall pcomplete-command-completion-function)
                    (pcomplete-arg 'last) t))))))

(add-hook 'eshell-mode-hook
          #'(lambda ()
              (define-key eshell-mode-map
                (kbd "M-p")
                'helm-eshell-history)))

(defun eshell-clears-buffer ()
  "Deletes the contents of eshell buffer, except the last prompt"
  (interactive)
  (save-excursion
    (goto-char eshell-last-output-end)
    (let ((lines (count-lines 1 (point)))
          (inhibit-read-only t))
      (beginning-of-line)
      (let ((pos (point)))
        (if (bobp)
            (if (interactive-p)
                (error "Buffer too short to truncate"))
          (delete-region (point-min) (point))
          (if (interactive-p)
              (message "Buffer cleared")))))))
