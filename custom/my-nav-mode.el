;;; My-nav-mode.el

;; This is a minor mode for Window and Buffer Managment in Emacs
;; It provides a key-map and some convenience Funktions


(defvar my-nav-mode-map
  (let ((map (make-sparse-keymap)))
    (define-key map (kbd "S-C-<left>") 'shrink-window-horizontally)
    (define-key map (kbd "S-C-<right>") 'enlarge-window-horizontally)
    (define-key map (kbd "S-C-<down>") 'shrink-window)
    (define-key map (kbd "S-C-<up>") 'enlarge-window)

    (define-key map (kbd "S-M-<up>") 'buffer-up-swap)
    (define-key map (kbd "S-M-<down>") 'buffer-down-swap)
    (define-key map (kbd "S-M-<right>") 'buffer-right-swap)
    (define-key map (kbd "S-M-<left>") 'buffer-left-swap)


    (define-key map (kbd "C-x <up>") 'windmove-up-cycle)
    (define-key map (kbd "C-x <down>") 'windmove-down-cycle)
    (define-key map (kbd "C-x <right>") 'windmove-right-cycle)
    (define-key map (kbd "C-x <left>") 'windmove-left-cycle)

    (define-key map (kbd "w") 'windmove-up-cycle)
    (define-key map (kbd "s") 'windmove-down-cycle)
    (define-key map (kbd "d") 'windmove-right-cycle)
    (define-key map (kbd "a") 'windmove-left-cycle)
    (define-key map (kbd "q") 'global-my-nav-mode)
    ;; (define-key map (kbd "M-<up>") 'windmove-up-cycle)
    ;; (define-key map (kbd "M-<down>") 'windmove-down-cycle)
    ;; (define-key map (kbd "M-<right>") 'windmove-right-cycle)
    ;; (define-key map (kbd "M-<left>") 'windmove-left-cycle)

    (define-key map (kbd "S-C-<left>") 'shrink-window-horizontally)
    (define-key map (kbd "S-C-<right>") 'enlarge-window-horizontally)
    (define-key map (kbd "S-C-<down>") 'shrink-window)
    (define-key map (kbd "S-C-<up>") 'enlarge-window)
    (define-key map (kbd "C-x x") 'delete-window)


    (define-key map (kbd "TAB") 'other-window)
    ;; (define-key map (kbd "C-c s") 'other-window)
    map)
  "Keymap for my-nav mode.")

(define-minor-mode my-nav-mode
  "Buffer Navigation Mode providing some additional keybinds and
functions for switching Buffers"
  :init-value nil
  :lighter "Nav"
  :keymap my-nav-mode-map
  :group my-nav-mode
  )

(define-global-minor-mode global-my-nav-mode my-nav-mode
  my-nav-mode-activate)

(defun my-nav-mode-activate ()
  (my-nav-mode 1)
  )
;; Moving the windcycle pack here

(defun windmove-up-cycle()
  (interactive)
  (condition-case nil (windmove-up)
    (error (condition-case nil (windmove-down)
	          (error (condition-case nil (windmove-right) (error (condition-case nil (windmove-left) (error (windmove-up))))))))))

(defun windmove-down-cycle()
  (interactive)
  (condition-case nil (windmove-down)
    (error (condition-case nil (windmove-up)
	          (error (condition-case nil (windmove-left) (error (condition-case nil (windmove-right) (error (windmove-down))))))))))

(defun windmove-right-cycle()
  (interactive)
  (condition-case nil (windmove-right)
    (error (condition-case nil (windmove-left)
	          (error (condition-case nil (windmove-up) (error (condition-case nil (windmove-down) (error (windmove-right))))))))))

(defun windmove-left-cycle()
  (interactive)
  (condition-case nil (windmove-left)
    (error (condition-case nil (windmove-right)
	          (error (condition-case nil (windmove-down) (error (condition-case nil (windmove-up) (error (windmove-left))))))))))

;; Buffer swaping
(defun buffer-up-swap()
  (interactive)
  (let ((current-window (selected-window))
	(current-buffer (buffer-name))
	(swaped-window nil)
	(swaped-buffer nil))
	(progn (windmove-up-cycle)
	 (setq swaped-window (selected-window))
	 (setq swaped-buffer (buffer-name))
	 (if (and (not (string= swaped-buffer current-buffer)))
	     (progn (set-window-buffer swaped-window current-buffer)
		    (set-window-buffer current-window swaped-buffer))))))

(defun buffer-down-swap()
  (interactive)
  (let ((current-window (selected-window))
	(current-buffer (buffer-name))
	(swaped-window nil)
	(swaped-buffer nil))
	(progn (windmove-down-cycle)
	 (setq swaped-window (selected-window))
	 (setq swaped-buffer (buffer-name))
	 (if (and (not (string= swaped-buffer current-buffer)))
	     (progn (set-window-buffer swaped-window current-buffer)
		    (set-window-buffer current-window swaped-buffer))))))

(defun buffer-right-swap()
  (interactive)
  (let ((current-window (selected-window))
	(current-buffer (buffer-name))
	(swaped-window nil)
	(swaped-buffer nil))
	(progn (windmove-right-cycle)
	 (setq swaped-window (selected-window))
	 (setq swaped-buffer (buffer-name))
	 (if (and (not (string= swaped-buffer current-buffer)))
	     (progn (set-window-buffer swaped-window current-buffer)
		    (set-window-buffer current-window swaped-buffer))))))

(defun buffer-left-swap()
  (interactive)
  (let ((current-window (selected-window))
	(current-buffer (buffer-name))
	(swaped-window nil)
	(swaped-buffer nil))
	(progn (windmove-left-cycle)
	 (setq swaped-window (selected-window))
	 (setq swaped-buffer (buffer-name))
	 (if (and (not (string= swaped-buffer current-buffer)))
	     (progn (set-window-buffer swaped-window current-buffer)
		    (set-window-buffer current-window swaped-buffer))))))

;; Window Dedicated Toggle Function
(defun toggle-dedicated-window ()
  (interactive)
  (let ((d (window-dedicated-p (selected-window))))
    (progn (set-window-dedicated-p (selected-window) (not d))
	   (if d (message "Window is not dedicated") (message "Window is now dedicated")))))


;; ;; Switch window keybindings

;; ;; Swap window keybindings

;; ;; ;; Window Resizing keybindings

;; ;; Window Split keybindings
;; (define-key map (kbd "C-x -") 'split-window-vertically)
;; (define-key map (kbd "C-x |") 'split-window-horizontally)

;; ;; Window Close keybindings

;; ;; (define-key map (kbd "S-C-<left>") 'shrink-window-horizontally)
;; ;; (define-key map (kbd "S-C-<right>") 'enlarge-window-horizontally)
;; ;; (define-key map (kbd "S-C-<down>") 'shrink-window)
;; ;; (define-key map (kbd "S-C-<up>") 'enlarge-window)
;; (define-key map (kbd "C-x x") 'delete-window)

;; ;; iTerm meta-shift-<arrows> fix
;; (define-key input-decode-map "\e[1;10A" [M-S-up])
;; (define-key input-decode-map "\e[1;10B" [M-S-down])
;; (define-key input-decode-map "\e[1;10C" [M-S-right])
;; (define-key input-decode-map "\e[1;10D" [M-S-left])



(provide 'my-nav-mode)
