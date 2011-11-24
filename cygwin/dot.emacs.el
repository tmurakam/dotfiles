;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; key bind
(global-set-key "\C-h" 'delete-backward-char)
(global-set-key "\M-c" 'compile)
(global-set-key "\M-g" 'goto-line)
(global-set-key "\M-c" 'compile)
(global-set-key [up] 'previous-error)
(global-set-key [down] 'next-error)
(global-set-key  [(f1)]  (lambda () (interactive) (manual-entry (current-word))))
