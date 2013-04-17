;;;; -*- mode: emacs-lisp; coding: utf-8 -*-
;;;;
;;;; Copyright (C) 2001 The Meadow Team

;; Author: Koichiro Ohba <koichiro@meadowy.org>
;;      Kyotaro HORIGUCHI <horiguti@meadowy.org>
;;      Hideyuki SHIRAI <shirai@meadowy.org>
;;      KOSEKI Yoshinori <kose@meadowy.org>
;;      and The Meadow Team.


;; ;;; Mule-UCS の設定
;; ;; ftp://ftp.m17n.org/pub/mule/Mule-UCS/ が オフィシャルサイトですが、
;; ;; http://www.meadowy.org/~shirai/elisp/mule-ucs.tar.gz に既知のパッチ
;; ;; をすべて適用したものがおいてあります。
;; ;; (set-language-environment) の前に設定します
(require 'jisx0213)

;;; IMEの設定
(mw32-ime-initialize)
(setq default-input-method "MW32-IME")
(setq-default mw32-ime-mode-line-state-indicator "[--]")
(setq mw32-ime-mode-line-state-indicator-list '("[--]" "[あ]" "[--]"))
(add-hook 'mw32-ime-on-hook
	  (function (lambda () (set-cursor-height 2))))
(add-hook 'mw32-ime-off-hook
	  (function (lambda () (set-cursor-height 4))))


;; ;;; カーソルの設定
;; ;; (set-cursor-type 'box)            ; Meadow-1.10互換 (SKK等で色が変る設定)
;; ;; (set-cursor-type 'hairline-caret) ; 縦棒キャレット


;;; マウスカーソルを消す設定
;(setq w32-hide-mouse-on-key t)
;(setq w32-hide-mouse-timeout 5000)

;;; フォント設定 (Meadow wiki のフォント設定ページから)
(w32-add-font
     "private-fontset"
     '((spec
	((:char-spec ascii :height any)
	 strict
	 (w32-logfont "MS Gothic" 0 -16 400 0 nil nil nil 0 1 3 0))
	((:char-spec ascii :height any :weight bold)
	 strict
	 (w32-logfont "MS Gothic" 0 -16 700 0 nil nil nil 0 1 3 0)
	 ((spacing . -1)))
	((:char-spec ascii :height any :slant italic)
	 strict
	 (w32-logfont "MS Gothic" 0 -16 400 0   t nil nil 0 1 3 0))
	((:char-spec ascii :height any :weight bold :slant italic)
	 strict
	 (w32-logfont "MS Gothic" 0 -16 700 0   t nil nil 0 1 3 0)
	 ((spacing . -1)))
	((:char-spec japanese-jisx0208 :height any)
	 strict
	 (w32-logfont "MS Gothic" 0 -16 400 0 nil nil nil 128 1 3 0))
	((:char-spec japanese-jisx0208 :height any :weight bold)
	 strict
	 (w32-logfont "MS Gothic" 0 -16 700 0 nil nil nil 128 1 3 0)
	 ((spacing . -1)))
	((:char-spec japanese-jisx0208 :height any :slant italic)
	 strict
	 (w32-logfont "MS Gothic" 0 -16 400 0   t nil nil 128 1 3 0))
	((:char-spec japanese-jisx0208 :height any :weight bold :slant italic)
	 strict
	 (w32-logfont "MS Gothic" 0 -16 700 0   t nil nil 128 1 3 0)
	 ((spacing . -1))))))

;; (set-face-attribute 'variable-pitch nil :family "*")

;; 初期フレームの設定
(setq default-frame-alist
      (append (list '(foreground-color . "black")
;		    '(background-color . "LemonChiffon")
		    '(background-color . "white")
;		    '(background-color . "gray")
		    '(border-color . "black")
		    '(mouse-color . "white")
		    '(cursor-color . "black")
;;		    '(ime-font . (w32-logfont "ＭＳ ゴシック"
;;					      0 16 400 0 nil nil nil
;;					      128 1 3 49)) ; TrueType のみ
;;		    '(font . "bdf-fontset")    ; BDF
		    '(font . "private-fontset"); TrueType
		    '(width . 100)
		    '(height . 56)
;		    '(top . 100)
;		    '(left . 100)
		    )
	      default-frame-alist))

;; ;;; shell の設定

;; ;;; Cygwin の bash を使う場合
(setq explicit-shell-file-name "bash")
(setq shell-file-name "sh")
(setq shell-command-switch "-c") 

;;; argument-editing の設定
(require 'mw32script)
(mw32script-init)

;; ;;; browse-url の設定
;; (global-set-key [S-mouse-2] 'browse-url-at-mouse)


;; ;;; 印刷の設定
;; ;; この設定で M-x print-buffer RET などでの印刷ができるようになります
;; ;;
;; ;;  notepad に与えるパラメータの形式の設定
;; (define-process-argument-editing "notepad"
;;   (lambda (x) (general-process-argument-editing-function x nil t)))
;;
;; (defun w32-print-region (start end
;; 				  &optional lpr-prog delete-text buf display
;; 				  &rest rest)
;;   (interactive)
;;   (let ((tmpfile (convert-standard-filename (buffer-name)))
;; 	   (w32-start-process-show-window t)
;; 	   ;; もし、dos 窓が見えていやな人は上記の `t' を `nil' にします
;; 	   ;; ただし、`nil' にすると Meadow が固まる環境もあるかもしれません
;; 	   (coding-system-for-write w32-system-coding-system))
;;     (while (string-match "[/\\]" tmpfile)
;; 	 (setq tmpfile (replace-match "_" t nil tmpfile)))
;;     (setq tmpfile (expand-file-name (concat "_" tmpfile "_")
;; 				       temporary-file-directory))
;;     (write-region start end tmpfile nil 'nomsg)
;;     (call-process "notepad" nil nil nil "/p" tmpfile)
;;     (and (file-readable-p tmpfile) (file-writable-p tmpfile)
;; 	    (delete-file tmpfile))))
;; 
;; (setq print-region-function 'w32-print-region)

;; ;;; fakecygpty の設定
;; ;; この設定で cygwin の仮想端末を要求するプログラムを Meadow から
;; ;; 扱えるようになります
;; (setq mw32-process-wrapper-alist
;;       '(("/\\(bash\\|tcsh\\|svn\\|ssh\\|gpg[esvk]?\\)\\.exe" .
;; 	  (nil . ("fakecygpty.exe" . set-process-connection-type-pty)))))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; ツールバー/メニューバーを非表示
(tool-bar-mode -99)
(menu-bar-mode -99)

;; wanderlust
(autoload 'wl "wl" "Wanderlust" t)
(autoload 'wl-other-frame "wl" "Wanderlust on new frame." t)
(autoload 'wl-draft "wl-draft" "Write draft with Wanderlust." t)

;; navi2ch
(autoload 'navi2ch "navi2ch" "Navi2ch" t)
;(setq navi2ch-net-http-proxy "127.0.0.1:3128")
