
(defvar my-nav-mode-map
  (let ((map (make-sparse-keymap)))
    (global-set-key (kbd "S-C-<left>") 'shrink-window-horizontally)
    (global-set-key (kbd "S-C-<right>") 'enlarge-window-horizontally)
    (global-set-key (kbd "S-C-<down>") 'shrink-window)
    (global-set-key (kbd "S-C-<up>") 'enlarge-window)
    map)
  "Keymap for my-nav mode.")

(define-minor-mode my-nav-mode nil "Nav-Mode")

(provide 'my-nav-mode)
