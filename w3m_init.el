;;; w3m and other setup

;;setting up conkeror as an additional web broweser
(setq  browse-url-generic-program "con") ;; requires a launch script of some kind for conqeror

(require 'w3m)
(setq browse-url-browser-function 'w3m-browse-url)
 (autoload 'w3m-browse-url "w3m" "Ask a WWW browser to show a URL." t)

(setq w3m-use-cookies t)

;just in case 
(setq w3m-coding-system 'utf-8
      w3m-file-coding-system 'utf-8
      w3m-file-name-coding-system 'utf-8
      w3m-input-coding-system 'utf-8
      w3m-output-coding-system 'utf-8
      w3m-terminal-coding-system 'utf-8)

(defun w3m-open-current-page-in-firefox ()
  "Open the current URL in Mozilla Firefox."
  (interactive)
  (browse-url-firefox w3m-current-url)) ;; (1)

(defun w3m-open-link-or-image-in-firefox ()
  "Open the current link or image in Firefox."
  (interactive)
  (browse-url-firefox (or (w3m-anchor) ;; (2)
                          (w3m-image)))) ;; (3)

(defun w3m-open-current-page-in-conqeror ()
  "Open the current URL in Mozilla Firefox."
  (interactive)
  (browse-url-generic w3m-current-url)) ;; (1)

(define-key w3m-mode-map "f" 'w3m-open-current-page-in-firefox)
(define-key w3m-mode-map "F" 'w3m-open-link-or-image-in-firefox)
(define-key w3m-mode-map "c" 'w3m-open-current-page-in-conqeror)
