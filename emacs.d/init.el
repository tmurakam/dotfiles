(setq user-full-name "Takuya Murakami")
(setq user-mail-address "murakami@da.jp.nec.com")

;; Emacs 設定ディレクトリを設定 (Emacs 22以下用)
(unless (boundp 'user-emacs-directory)
  (defvar user-emacs-directory (expand-file-name "~/.emacs.d/")))

;; load-path 追加関数
;; normal-top-level-add-subdirs-to-load-path はディレクトリの中で
;; [A-Za-z] で開始する物だけ追加するので、追加したくない物は . や _ を先頭に付与しておけばロードしない
;; dolist は Emacs 21 から標準関数なので積極的に利用して良い
(defun add-to-load-path (&rest paths)
  (let (path)
    (dolist (path paths paths)
      (let ((default-directory (expand-file-name (concat user-emacs-directory path))))
        (add-to-list 'load-path default-directory)
        (if (fboundp 'normal-top-level-add-subdirs-to-load-path)
            (normal-top-level-add-subdirs-to-load-path))))))

;; Emacs Lisp のPathを通す
(add-to-load-path "lisp" "local-lisp" "auto-install" "private" "init.d")

;; auto-install
(require 'auto-install)
(setq auto-install-directory (concat user-emacs-directory "auto-install"))
(setq url-proxy-services '(("http" . "proxygate2.nic.nec.co.jp:8080")))
(auto-install-compatibility-setup)
;(auto-install-update-emacswiki-package-name t)

;; load all files in .init.d
(let* ((dir (concat user-emacs-directory "init.d"))
       (el-suffix "\\.el\\'")
       (files (mapcar
	              (lambda (path) (replace-regexp-in-string el-suffix "" path))
		             (directory-files dir t el-suffix))))
  (while files
    (load (car files))
    (setq files (cdr files))))

;; anything
;(defvar org-directory "")
;(require 'anything-startup)

;; magit (git frontend)
;(require 'magit)

;;;; M-x customize
(custom-set-variables
  ;; custom-set-variables was added by Custom -- don't edit or cut/paste it!
  ;; Your init file should contain only one such instance.
 '(c-basic-offset 4)
 '(c-default-style (quote ((c-mode . "linux") (c++-mode . "linux") (java-mode . "java"))))
 '(c-tab-always-indent nil)
 '(c-auto-newline t)
 '(inhibit-local-menu-bar-menus t)
 '(perl-indent-level 4))
(custom-set-faces
  ;; custom-set-faces was added by Custom -- don't edit or cut/paste it!
  ;; Your init file should contain only one such instance.
 )


