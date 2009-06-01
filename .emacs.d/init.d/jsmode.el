;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; javascript mode
(autoload 'javascript-mode "javascript" "My javascript major mode" t)

(setq auto-mode-alist
      (append
       '(("\\.js$" . javascript-mode))
       auto-mode-alist))
