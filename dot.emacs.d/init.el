;; -*- Emacs-Lisp -*-
;; .emacs.el for Emacs 20.x (for English users)
;;
;;
;; * Wed Jul 26 2000 Masaru Yokoi <masaru@turbolinux.co.jp>
;; - Modified for English version.
;;
;; * Tue May 23 2000 Masaru Yokoi <masaru@turbolinux.co.jp>
;; - First release.
;;

(setq lang (getenv "LANG"))
(cond
 ((equal lang "ja_JP.UTF-8")
  (set-language-environment "Japanese")
  (prefer-coding-system 'utf-8)
  (set-buffer-file-coding-system 'utf-8)
  (set-terminal-coding-system 'utf-8)
  (set-keyboard-coding-system 'utf-8))
 (t
  (progn
    (set-language-environment "English")
    ;;(set-default-coding-system 'iso-8859-1)
    (set-buffer-file-coding-system 'iso8859-1)
    (set-terminal-coding-system 'iso8859-1)
    (set-keyboard-coding-system 'iso8859-1))))

;; Mule-UCS
;(require 'un-define)

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

;; Activate Backspace 
(global-set-key "\C-h" 'delete-backward-char)
(define-key function-key-map [delete] [8])
(put 'delete 'ascii-character 8)

;; Display time
(display-time)

;; Display line number
(line-number-mode t)

;; Display column number
(column-number-mode t)

;; Don't make new line when cursor is end of buffer.
(setq next-line-add-newlines nil)

;; Font-Lock mode
(global-font-lock-mode t)

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
;; key binds
(global-set-key "\M-c" 'compile)
(global-set-key "\M-g" 'goto-line)
(global-set-key "\M-c" 'compile)
;(global-set-key "\M-e" 'next-error)
(global-set-key [up] 'previous-error)
(global-set-key [down] 'next-error)
(global-set-key  [(f1)]  (lambda () (interactive) (manual-entry (current-word))))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Wanderlust
(autoload 'wl "wl" "Wanderlust" t)
(autoload 'wl-other-frame "wl" "Wanderlust on new frame." t)
(autoload 'wl-draft "wl-draft" "Write draft with Wanderlust." t)

(autoload 'wl "wl" "Wanderlust" t)
(autoload 'wl-other-frame "wl" "Wanderlust on new frame." t)
(autoload 'wl-draft "wl-draft" "Write draft with Wanderlust." t)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; mew

(autoload 'mew "mew" nil t)
(autoload 'mew-send "mew" nil t)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; gtags
(autoload 'gtags-mode "gtags" "" t)
(setq load-path (cons "/usr/local/share/gtags" load-path))

(setq c-mode-hook
      '(lambda ()
	 (gtags-mode 1)))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; navi2ch
(autoload 'navi2ch "navi2ch" "Navigator for 2ch for Emacs" t)
(setq navi2ch-list-bbstable-url "http://menu.2ch.net/bbsmenu.html")

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; ruby-mode
(add-hook 'ruby-mode-hook
          '(lambda ()
             (inf-ruby-keys)
             (setq tab-width 8)))
(setq ruby-indent-level 2)

(autoload 'rubydb "rubydb3x"
  "run rubydb on program file in buffer *gud-file*.
the directory containing file becomes the initial working directory
and source-file directory for your debugger." t)

;; patch file
(setq auto-mode-alist
      (append
       '(("\\.patch$" . fundamental-mode))
       auto-mode-alist))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;PO mode stuff

(setq auto-mode-alist
      (cons '("\\.pox?\\'" . po-mode) auto-mode-alist))
(autoload 'po-mode "po-mode")


 (global-set-key [(f1)] (lambda () (interactive) (manual-
       entry (current-word))))


;;; use space for indentation
(setq-default indent-tabs-mode nil)

(custom-set-variables
  ;; custom-set-variables was added by Custom -- don't edit or cut/paste it!
  ;; Your init file should contain only one such instance.
 '(c-basic-offset 4)
 '(c-default-style (quote ((c-mode . "linux") (c++-mode . "linux") (objc-mode . "linux") (idl-mode . "linux") (pike-mode . "linux") (other . "linux"))))
 '(c-insert-tab-function (quote insert-tab))
 '(c-tab-always-indent nil)
 '(inhibit-local-menu-bar-menus t)
 '(perl-indent-level 4))
(custom-set-faces
  ;; custom-set-faces was added by Custom -- don't edit or cut/paste it!
  ;; Your init file should contain only one such instance.
 )
