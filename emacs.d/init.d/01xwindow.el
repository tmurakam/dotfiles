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
			  default-frame-alist)))))

(tool-bar-mode -1)
(menu-bar-mode -1)