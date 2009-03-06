;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; key bind
(global-set-key "\M-c" 'compile)
;(global-set-key "\C-\\" 'canna-toggle-japanese-mode)
;(global-set-key "\M-t" 'canna-touroku-region)
(global-set-key "\M-g" 'goto-line)
(global-set-key "\M-c" 'compile)
;(global-set-key "\M-e" 'next-error)
(global-set-key [up] 'previous-error)
(global-set-key [down] 'next-error)
(global-set-key  [(f1)]  (lambda () (interactive) (manual-entry (current-word))))
