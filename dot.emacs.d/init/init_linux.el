;;; For Linux

(cond
 ((eq window-system 'x)
  ;; When running on X 
  (set-face-foreground 'modeline "yellow")
  (set-face-background 'modeline "navy")
  (set-scroll-bar-mode 'right)
  (setq 
   ;;tool-bar-mode nil			;; Remove toolbar in Emacs-21
   default-frame-alist '(append
			 ((font . "fontset-standard")
			  (menu-bar . 1)
			  ;;(width	. 80)
			  ;;(height . 25)
			  default-frame-alist))))
 (t
  ;; When running on any terminal (e.g. emacs -nw)
  ;; Remove menu bar
  (menu-bar-mode -1)))

; cache file name
(let* ((file-dir "~/.emacs-flc"))
  (if (file-exists-p file-dir) 
      (setq fast-lock-cache-directories (list file-dir))))


;; Use fast-lock-mode to display faster.
;; '10/9/21: この設定を使うと Java ファイルのオープン時にエラーになるためコメントアウト
;(setq font-lock-support-mode 'fast-lock-mode)

;; Wheel mouse
(defun down-slightly () (interactive) (scroll-down 5))
(defun up-slightly   () (interactive) (scroll-up   5))
(global-set-key [mouse-4] 'down-slightly)
(global-set-key [mouse-5] 'up-slightly  )
(defun down-one () (interactive) (scroll-down 1))
(defun up-one   () (interactive) (scroll-up   1))
(global-set-key [S-mouse-4] 'down-one)
(global-set-key [S-mouse-5] 'up-one  )
(defun down-a-lot () (interactive) (scroll-down))
(defun up-a-lot   () (interactive) (scroll-up  ))
(global-set-key [C-mouse-4] 'down-a-lot)
(global-set-key [C-mouse-5] 'up-a-lot  )

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; auto install
;; auto-install
(require 'auto-install)
(setq auto-install-directory "~/.emacs.d/auto-install/")
;(auto-install-update-emacswiki-package-name t)
(auto-install-compatibility-setup)             ; 互換性確保
