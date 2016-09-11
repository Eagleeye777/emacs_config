;; Defining hydras
;; Hydras can be used to set up commands faster and bind them together

(use-package hydra
  :ensure t)

(defhydra my/org-hydra (:color blue)
  "Org"
  ("a" my/org-check-agenda "Agenda" :exit t)
  ("s" org-set-tags "Tags" :exit t)
  ("d" helm-org-in-buffer-headings "BufHead")
  ("g" org-time-stamp-inactive "TimeIn")
  ("h" org-time-stamp "TimeAkt")
  ("j" org-todo "TODO")
  ;; ("t" org-set-tags-command "Tag")

  ("m" org-mark-subtree "MarkTree")
  ("q" nil "Quit")
  ("w" widen "Widen")
  ("t" hydra-org-template/body "Templates")
  ("i" (org-emphasize ?*) "Bold")
  ("z" org-next-visible-heading "SubForw" :exit nil)
  ("u" org-previous-visible-heading "SubBack" :exit nil)
  ("n" org-narrow-to-subtree "Narrow")
  )

;; Hilfsfunktion, die in der folgenden Hydra aufgerufen wird.
;; Code von https://github.com/abo-abo/hydra/wiki/Org-mode-block-templates
(defun hot-expand (str &optional mod)
  "Expand org template."
  (insert str)
  (org-try-structure-completion)
  (when mod (insert mod) (forward-line)))

;; Messing around with this one. See if i can get used to rectange
(defhydra hydra-rectangle (:body-pre (cua-rectangle-mark-mode 1)
                                     :color pink
                                     :post (deactivate-mark))
  "
  ^_k_^     _d_elete    _s_tring
_h_   _l_   _o_k        _y_ank
  ^_j_^     _n_ew-copy  _r_eset
^^^^        _e_xchange  _u_ndo
^^^^        ^ ^         _p_aste
"
  ("h" backward-char nil)
  ("l" forward-char nil)
  ("k" previous-line nil)
  ("j" next-line nil)
  ("e" exchange-point-and-mark nil)
  ("n" copy-rectangle-as-kill nil)
  ("d" delete-rectangle nil)
  ("r" (if (region-active-p)
           (deactivate-mark)
         (rectangle-mark-mode 1)) nil)
  ("y" yank-rectangle nil)
  ("u" undo nil)
  ("s" string-rectangle nil)
  ("p" kill-rectangle nil)
  ("o" nil nil))
(global-set-key (kbd "C-x SPC") 'hydra-rectangle/body)


;; Das hier ist sehr reizvoll, um die verschiedenen Org-Blöcke direkt über
;; hydra einzufügen. Ich werde hier wohl noch das ein oder andere anpassen müssen
;; Code von https://github.com/abo-abo/hydra/wiki/Org-mode-block-templates

(defhydra hydra-org-template (:color blue :hint nil)
  "
_c_enter  _q_uote     _e_macs-lisp    _L_aTeX:
_l_atex   _E_xample   _p_erl          _i_ndex:
_a_scii   _v_erse     ^ ^             _I_NCLUDE:
_s_rc     ^ ^         plant_u_ml      _H_TML:
_h_tml    ^ ^         ^ ^             _A_SCII:
"
  ("s" (hot-expand "<s"))
  ("E" (hot-expand "<e"))
  ("q" (hot-expand "<q"))
  ("v" (hot-expand "<v"))
  ("c" (hot-expand "<c"))
  ("l" (hot-expand "<l"))
  ("h" (hot-expand "<h"))
  ("a" (hot-expand "<a"))
  ("L" (hot-expand "<L"))
  ("i" (hot-expand "<i"))
  ("e" (hot-expand "<s" "emacs-lisp"))
  ("p" (hot-expand "<s" "perl"))
  ("u" (hot-expand "<s" "plantuml :file CHANGE.png"))
  ;; ("P" (progn
  ;;        (insert "#+HEADERS: :results output :exports both :shebang \"#!/usr/bin/env perl\"\n")
  ;;        (hot-expand "<s" "perl"))
  ("I" (hot-expand "<I"))
  ("H" (hot-expand "<H"))
  ("A" (hot-expand "<A"))
  ("<" self-insert-command "ins")
  ("o" nil "quit"))

(defhydra my/window-movement (:color blue)
  "Movement"
  ;; Top
  ("q" nil "Quit")
  ("o" delete-other-windows "Del other ":color pink :exit t)
  ("u" avy-goto-char "Char")
  ("e" mc/mark-next-like-this "MC" :exit nil)
  ;; home
  ("a" my/org-check-agenda "Agenda")
  ("s" my/switch-to-previous-buffer "Switch Buffer")
  ("d" helm-recentf "RecentFiles")
  ("f" scroll-up "Scroll +")
  ("h" helm-bookmarks "Bookmarks")
  ("k" kill-this-buffer "KillBuff")
  ("l" avy-goto-line "line")
  ("ö" ace-window "AceWindow")
  ("ä" sent-rectangular-region-anchor "Rect")
  ;; down
  ("y" other-window "other")
  ("v" scroll-down "Scroll -")
  ("b" helm-buffers-list "HelmBuf")
  ("m" helm-all-mark-rings "Mark-Ring")
  ("." helm-apropos "Apropos")
  )

(defhydra my/editing-utils (:color red)
  "Edit Utils"
  ("a" beginning-of-buffer "BegBuf")
  ("e" end-of-buffer "EndBuf")
  ("f" forward-word "FoWo")
  ("b" backward-word "BaWo")
  ("F" forward-sentence "FoSe")
  ("B" backward-sentence "BaSe")
  ("n" forward-paragraph "FoPa")
  ("p" backward-paragraph "BaPa")
  ("k" crux-kill-line-backwards "Kill line backward" :exit t)
  ("z" zop-to-char "ZopChar" :exit t)
  ("u" avy-goto-char "Avy-Char" :exit t)
  ("<return>" nil "Quit"))
