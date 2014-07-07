;; disable comments to compile once in a while
;; (byte-recompile-directory (expand-file-name "~/.emacs.d") 0)

;; Fixing a gnutls error warning and raising sercurity level of tls encyption
(setq gnutls-min-prime-bits '"1024")

;; Few things I cannot get anywhere via packages. These go here
(add-to-list 'load-path "~/.emacs.d/custom/")

;; Set up el get und Package repos and instalxl packages if not there (buggy on the elpa side)
(load "~/.emacs.d/package_init.el")

;; ;; Allgemeine grundlegende Einstellungen
(load "/home/sschaumburg/.emacs.d/gen_init.el")

;; ;; Winner Mode configuration, esp. to work better with helm
(load "/home/sschaumburg/.emacs.d/winner_init.el")

;; Display Settings
(load "~/.emacs.d/layout_init.el")

;;All the Ido Stuff
(load "~/.emacs.d/ido_init.el")

;; autocomplete and yasnippet
(load "~/.emacs.d/ac_yas_init.el")

; setting up org mode and deft(extern File)
(load "~/.emacs.d/org_init.el" )

;; Init stuff around elisp
(load "~/.emacs.d/elisp_init.el")

;; Setting up the E-Mail Client (Mu4e)
(load "/home/sschaumburg/.emacs.d/mu4e_init.el.gpg")
(setq mail-user-agent 'mu4e-user-agent)

; Custom Functions (All helper functions and whatever)
(load "/home/sschaumburg/.emacs.d/func_init.el")

;; Whatever is left still
(load "~/.emacs.d/various_init.el")

;;w3m Configurations
(load "~/.emacs.d/w3m_init.el")


;; auctex und ac.amath
(load "~/.emacs.d/auctex_init.el")

;;All the Helm Stuff
(load "/home/sschaumburg/.emacs.d/helm_init.el")

;; Python Stuff
(load "~/.emacs.d/python_init.el")

(load "~/.emacs.d/edit_utils.el")

;; keybindings
(load "~/.emacs.d/keybinds.el")

(load "~/.emacs.d/evernote.el")

(load "~/.emacs.d/eshell_init.el")

;; garbage collection settings
(setq gc-cons-threshold 50000000)
;; why is this here???
;; (diminish 'auto-revert-mode)
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ac-ispell-requires 4)
 '(compilation-message-face (quote default))
 '(custom-safe-themes (quote ("52588047a0fe3727e3cd8a90e76d7f078c9bd62c0b246324e557dfa5112e0d0c" "cf08ae4c26cacce2eebff39d129ea0a21c9d7bf70ea9b945588c1c66392578d1" "5ee12d8250b0952deefc88814cf0672327d7ee70b16344372db9460e9a0e3ffc" "1157a4055504672be1df1232bed784ba575c60ab44d8e6c7b3800ae76b42f8bd" "7f1263c969f04a8e58f9441f4ba4d7fb1302243355cb9faecb55aec878a06ee9" "4aee8551b53a43a883cb0b7f3255d6859d766b6c5e14bcb01bed572fcbef4328" "06f0b439b62164c6f8f84fdda32b62fb50b6d00e8b01c2208e55543a6337433a" "628278136f88aa1a151bb2d6c8a86bf2b7631fbea5f0f76cba2a0079cd910f7d" "bb08c73af94ee74453c90422485b29e5643b73b05e8de029a6909af6a3fb3f58" "1b8d67b43ff1723960eb5e0cba512a2c7a2ad544ddb2533a90101fd1852b426e" "82d2cac368ccdec2fcc7573f24c3f79654b78bf133096f9b40c20d97ec1d8016" "d677ef584c6dfc0697901a44b885cc18e206f05114c8a3b7fde674fce6180879" "e16a771a13a202ee6e276d06098bc77f008b73bbac4d526f160faa2d76c1dd0e" "8aedc342b67e6ca6de84f154c1536b6007d8b0b2d1b2fc86c642689eeff51097" "a3d519ee30c0aa4b45a277ae41c4fa1ae80e52f04098a2654979b1ab859ab0bf" "73fe242ddbaf2b985689e6ec12e29fab2ecd59f765453ad0e93bc502e6e478d6" "a7816e280688829bde537faf2a1ec736d383ce6d97e39e1439d65d153143c2fa" "e9bb17437af915e0d16ad22be4965b26c51a3c978ba5778d59c20588ee269c9e" "8aebf25556399b58091e533e455dd50a6a9cba958cc4ebb0aab175863c25b9a4" "9c26d896b2668f212f39f5b0206c5e3f0ac301611ced8a6f74afe4ee9c7e6311" "9370aeac615012366188359cb05011aea721c73e1cb194798bc18576025cabeb" "1e7e097ec8cb1f8c3a912d7e1e0331caeed49fef6cff220be63bd2a6ba4cc365" "fc5fcb6f1f1c1bc01305694c59a1a861b008c534cae8d0e48e4d5e81ad718bc6" "d6a00ef5e53adf9b6fe417d2b4404895f26210c52bb8716971be106550cea257" default)))
 '(dired-listing-switches "-alhog")
 '(font-lock-maximum-decoration (quote ((t . t)))))
 ;; '(global-my-nav-mode nil)
 ;; '(helm-ack-grep-executable "ack")
 ;; '(highlight-changes-colors (quote ("#FD5FF0" "#AE81FF")))
 ;; '(highlight-tail-colors (quote (("#49483E" . 0) ("#67930F" . 20) ("#349B8D" . 30) ("#21889B" . 50) ("#968B26" . 60) ("#A45E0A" . 70) ("#A41F99" . 85) ("#49483E" . 100))))
 ;; '(magit-diff-use-overlays nil)
 ;; '(openwith-associations (quote (("\\.pdf\\'" "evince" (file)) ("\\.docx\\'" "libreoffice" (file)) ("\\.doc\\'" "libreoffice" (file)) ("\\.odt\\'" "libreoffice" (file)) ("\\.\\(?:mpe?g\\|avi\\|wmv\\)\\'" "mplayer" ("-idx" file)) ("\\.epub\\'" "calibre" (file)) ("\\.\\(?:jp?g\\|png\\)\\'" "display" (file)))))
 ;; '(syslog-debug-face (quote ((t :background unspecified :foreground "#A1EFE4" :weight bold))))
 ;; '(syslog-error-face (quote ((t :background unspecified :foreground "#F92672" :weight bold))))
 ;; '(syslog-hour-face (quote ((t :background unspecified :foreground "#A6E22E"))))
 ;; '(syslog-info-face (quote ((t :background unspecified :foreground "#66D9EF" :weight bold))))
 ;; '(syslog-ip-face (quote ((t :background unspecified :foreground "#E6DB74"))))
 ;; '(syslog-su-face (quote ((t :background unspecified :foreground "#FD5FF0"))))
 ;; '(syslog-warn-face (quote ((t :background unspecified :foreground "#FD971F" :weight bold))))
 ;; '(weechat-color-list (quote (unspecified "#272822" "#49483E" "#A20C41" "#F92672" "#67930F" "#A6E22E" "#968B26" "#E6DB74" "#21889B" "#66D9EF" "#A41F99" "#FD5FF0" "#349B8D" "#A1EFE4" "#F8F8F2" "#F8F8F0"))))
;; (custom-set-faces
;;  ;; custom-set-faces was added by Custom.
;;  ;; If you edit it by hand, you could mess it up, so be careful.
;;  ;; Your init file should contain only one such instance.
;;  ;; If there is more than one, they won't work right.
;;  '(mode-line ((((class color) (min-colors 89)) (2:inverse-video unspecified :underline unspecified :foreground "#66cccc" :background "#eee8d5" :box (:line-width 1 :color "#eee8d5" :style unspecified))))))
(load-theme 'tomorrow-night)
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
