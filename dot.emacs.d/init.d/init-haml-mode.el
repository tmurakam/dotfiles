;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; haml-mode
(when (autoload-if-found 'haml-mode "haml-mode" "haml major mode" t)
  (add-to-list 'auto-mode-alist '("\\.haml\\'" . haml-mode))
  (add-hook 'haml-mode-hook
            (lambda ()
              (setq indent-tabs-mode nil)
              (define-key haml-mode-map "\C-m" 'newline-and-indent)))
)


