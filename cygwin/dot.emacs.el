;;; meadow 用設定ロード
(if (featurep 'meadow)
    (load "~/.meadow")
)
;;; 共通設定

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; key bind
(global-set-key "\C-h" 'delete-backward-char)
(global-set-key "\M-c" 'compile)
(global-set-key "\M-g" 'goto-line)
(global-set-key "\M-c" 'compile)
(global-set-key [up] 'previous-error)
(global-set-key [down] 'next-error)
(global-set-key  [(f1)]  (lambda () (interactive) (manual-entry (current-word))))

;; wanderlust
(autoload 'wl "wl" "Wanderlust" t)
(autoload 'wl-other-frame "wl" "Wanderlust on new frame." t)
(autoload 'wl-draft "wl-draft" "Write draft with Wanderlust." t)

;; navi2ch
(autoload 'navi2ch "navi2ch" "Navi2ch" t)
(setq navi2ch-net-http-proxy "127.0.0.1:3128")

;; scilab-mode
;;(load "scilab")
(autoload 'scilab-mode "scilab" "Scilab mode" t)
(setq auto-mode-alist (cons '("\\(\\.sci$\\|\\.sce$\\)" . scilab-mode)
auto-mode-alist))
(setq scilab-mode-hook '(lambda () (setq scilab-indent-level 4)))

;; custom
(custom-set-variables
  ;; custom-set-variables was added by Custom.
  ;; If you edit it by hand, you could mess it up, so be careful.
  ;; Your init file should contain only one such instance.
  ;; If there is more than one, they won't work right.
 '(c-basic-offset 4)
 '(c-default-style (quote ((c-mode . "linux") (c++-mode . "linux") (java-mode . "java") (other . "linux"))))
 '(c-tab-always-indent nil)
 '(safe-local-variable-values (quote ((syntax . elisp)))))
(custom-set-faces
  ;; custom-set-faces was added by Custom.
  ;; If you edit it by hand, you could mess it up, so be careful.
  ;; Your init file should contain only one such instance.
  ;; If there is more than one, they won't work right.
 )
