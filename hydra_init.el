1;; Defining hydras
;; Hydras can be used to set up commands faster and bind them together

(use-package hydra
  :ensure t)

(defhydra my/multiple-cursors-hydra (:hint nil)
  "
     ^Up^            ^Down^        ^Miscellaneous^
----------------------------------------------
[_p_]   Next    [_n_]   Next    [_l_] Edit lines
[_P_]   Skip    [_N_]   Skip    [_a_] Mark all
[_M-p_] Unmark  [_M-n_] Unmark  [_q_] Quit"
  ("l" mc/edit-lines)
  ("a" mc/mark-all-like-this :exit t)
  ("n" mc/mark-next-like-this)
  ("N" mc/skip-to-next-like-this)
  ("M-n" mc/unmark-next-like-this)
  ("p" mc/mark-previous-like-this)
  ("P" mc/skip-to-previous-like-this)
  ("M-p" mc/unmark-previous-like-this)
("q" nil)
)

;; make windmove available
(use-package windmove)
;; windmove hydra
(defhydra my/org-navigation ()
  "OrgNav"
  ("a" org-next-visible-heading "VisNext")
  ("s" org-previous-visible-heading "VisPrev")
  ("d" org-forward-heading-same-level "ForwSame")
  ("f" org-backward-heading-same-level "BackSame")
  ("g" outline-up-heading "UpLevel")
  ("h" org-goto "Goto")
  ("q" nil :exit t)
  )

(defhydra my/org-hydra (:color blue)
  "Org"
  ("a" my/org-check-agenda "Agenda" :exit t)
  ("s" org-set-tags "Tags" :exit t)
  ("d" helm-org-in-buffer-headings "BufHead")
  ("f" my/org-navigation/body "Nav")
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

(defhydra my/windmove-hydra ()
  "Windmove"
  ("q" nil "Quit" :exit t)
  ("w" windmove-up "Up")
  ("s" windmove-down "Down")
  ("a" windmove-left "left")
  ("d" windmove-right "Right")
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

(defhydra my/window-movement (:color red)
  "Movement"
  ;; Top
  ("q" nil "Quit")
  ("w" my/windmove-hydra/body "WindMove" :color blue)
  ("o" delete-other-windows "Del other ":color blue )
  ("u" avy-goto-char "Char")
  ("e" mc/edit-lines "MC" :exit nil)
  ;; home
  ("a" my/org-check-agenda "Agenda" :color blue)
  ("s" crux-switch-to-previous-buffer "Switch Buffer" :color blue)
  ("d" helm-recentf "RecentFiles")
  ("f" scroll-up "Scroll +")
  ("g" my/smartparens/body "SpNav" :color blue)
  ("h" helm-bookmarks "Bookmarks" :color blue)
  ("k" kill-this-buffer "KillBuff" :color blue)
  ("K" kill-buffer-and-window "Buff&Window" :color blue)
  ("l" avy-goto-line "line")
  ("ö" ace-window "AceWindow")
  ("ä" sent-rectangular-region-anchor "Rect")
  ;; down
  ("y" other-window "other")
  ("v" scroll-down "Scroll -")
  ("b" helm-buffers-list "HelmBuf")
  ("m" helm-all-mark-rings "Mark-Ring")
  ("." helm-apropos "Apropos"))

(defhydra my/editing-utils (:color red)
  "Edit Utils"
  ;; Top
  ("e" end-of-buffer "EndBuf")
  ;; ("p" backward-paragraph "BaPa")
  ("p" comment-or-uncomment-region "Comment" :color blue)
  ("z" zop-to-char "ZopChar" :exit t)
  ("u" avy-goto-char "Avy-Char" :exit t)
  ;; Home
  ("a" beginning-of-buffer "BegBuf")
  ("s" (switch-to-buffer "*scratch*") :color blue)
  ("F" forward-sentence "FoSe")
  ("f" forward-word "FoWo")
  ("k" crux-kill-line-backwards "Kill line backward" :exit t)
  ;; bottom
  ("b" backward-word "BaWo")
  ("B" backward-sentence "BaSe")
  ("n" forward-paragraph "FoPa")
  ("<return>" nil "Quit"))

(defhydra my/smartparens (:color red)
  "SP"
  ("q" nil :exit t)
  ("b" sp-backward-sexp "BaSp" )
  ("f" sp-forward-sexp  "FowSp")
  ("n" sp-backward-down-sexp "BaDoSp" )
  ("p" sp-backward-up-sexp "BaUpSp" )
  ("d" sp-down-sexp "DoSp" )
  ("u" sp-up-sexp "UpSp")
  ("N" sp-next-sexp "NextSp")
  ("P" sp-previous-sexp "PrevSp")
  ("C-f" sp-forward-symbol "FowSym")
  ("C-b" sp-backward-symbol "BackSym")
  ("a" sp-beginning-of-sexp "BegSp")
  ("z" sp-end-of-sexp "EndSp")
  ("e" eval-last-sexp "EvalEx" :color blue)
  ("c" er/expand-region "ExpandRegeion")
  )
(defhydra hydra-learn-sp (:hint nil)
  "
  _B_ backward-sexp            -----
  _F_ forward-sexp               _s_ splice-sexp
  _L_ backward-down-sexp         _df_ splice-sexp-killing-forward
  _H_ backward-up-sexp           _db_ splice-sexp-killing-backward
^^------                         _da_ splice-sexp-killing-around
  _k_ down-sexp                -----
  _j_ up-sexp                    _C-s_ select-next-thing-exchange
-^^-----                         _C-p_ select-previous-thing
  _n_ next-sexp                  _C-n_ select-next-thing
  _p_ previous-sexp            -----
  _a_ beginning-of-sexp          _C-f_ forward-symbol
  _z_ end-of-sexp                _C-b_ backward-symbol
--^^-                          -----
  _t_ transpose-sexp             _c_ convolute-sexp
-^^--                            _g_ absorb-sexp
  _x_ delete-char                _q_ emit-sexp
  _dw_ kill-word               -----
  _dd_ kill-sexp                 _,b_ extract-before-sexp
-^^--                            _,a_ extract-after-sexp
  _S_ unwrap-sexp              -----
-^^--                            _AP_ add-to-previous-sexp
  _C-h_ forward-slurp-sexp       _AN_ add-to-next-sexp
  _C-l_ forward-barf-sexp      -----
  _C-S-h_ backward-slurp-sexp    _ join-sexp
  _C-S-l_ backward-barf-sexp     _|_ split-sexp"
  ;; TODO: Use () and [] - + * | <space>
  ("B" sp-backward-sexp );; similiar to VIM b
  ("F" sp-forward-sexp);; similar to VIM f
  ;;
  ("L" sp-backward-down-sexp )
  ("H" sp-backward-up-sexp )
  ;;
  ("k" sp-down-sexp ) ; root - towards the root
  ("j" sp-up-sexp )
  ;;
  ("n" sp-next-sexp )
  ("p" sp-previous-sexp )
  ;; a..z
  ("a" sp-beginning-of-sexp )
  ("z" sp-end-of-sexp )
  ;;
  ("t" sp-transpose-sexp )
  ;;
  ("x" sp-delete-char )
  ("dw" sp-kill-word )
  ;;("ds" sp-kill-symbol ) ;; Prefer kill-sexp
  ("dd" sp-kill-sexp )
  ;;("yy" sp-copy-sexp ) ;; Don't like it. Pref visual selection
  ;;
  ("S" sp-unwrap-sexp ) ;; Strip!
  ;;("wh" sp-backward-unwrap-sexp ) ;; Too similar to above
  ;;
  ("C-h" sp-forward-slurp-sexp )
  ("C-l" sp-forward-barf-sexp )
  ("C-S-h" sp-backward-slurp-sexp )
  ("C-S-l" sp-backward-barf-sexp )
  ;;
  ;;("C-[" (bind (sp-wrap-with-pair "[")) ) ;;FIXME
  ;;("C-(" (bind (sp-wrap-with-pair "(")) )
  ;;
  ("s" sp-splice-sexp )
  ("df" sp-splice-sexp-killing-forward )
  ("db" sp-splice-sexp-killing-backward )
  ("da" sp-splice-sexp-killing-around )
  ;;
  ("C-s" sp-select-next-thing-exchange )  ("C-p" sp-select-previous-thing )
  ("C-n" sp-select-next-thing )
  ;;
  ("C-f" sp-forward-symbol )
  ("C-b" sp-backward-symbol )
  ;;
  ;;("C-t" sp-prefix-tag-object)
  ;;("H-p" sp-prefix-pair-object)
  ("c" sp-convolute-sexp )
  ("g" sp-absorb-sexp )
  ("q" sp-emit-sexp )
  ;;
  (",b" sp-extract-before-sexp )
  (",a" sp-extract-after-sexp )
  ;;
  ("AP" sp-add-to-previous-sexp );; Difference to slurp?
  ("AN" sp-add-to-next-sexp )
  ;;
  ("_" sp-join-sexp ) ;;Good
  ("|" sp-split-sexp ))
