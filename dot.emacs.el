;; load all files in .emacs.d
(let* ((dir "~/.emacs.d/init.d")
       (el-suffix "\\.el\\'")
       (files (mapcar
	              (lambda (path) (replace-regexp-in-string el-suffix "" path))
		             (directory-files dir t el-suffix))))
  (while files
    (load (car files))
    (setq files (cdr files))))

;;;; M-x customize
(custom-set-variables
  ;; custom-set-variables was added by Custom -- don't edit or cut/paste it!
  ;; Your init file should contain only one such instance.
 '(c-basic-offset 4)
 '(c-default-style (quote ((c-mode . "linux") (c++-mode . "linux") (java-mode . "java"))))
 '(c-tab-always-indent nil)
 '(inhibit-local-menu-bar-menus t)
 '(perl-indent-level 4))
(custom-set-faces
  ;; custom-set-faces was added by Custom -- don't edit or cut/paste it!
  ;; Your init file should contain only one such instance.
 )


