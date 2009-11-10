;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; javascript mode
(autoload 'javascript-mode "javascript" "My javascript major mode" t)
(autoload 'js2-mode "js2" "My javascript major mode" t)

(setq auto-mode-alist
      (append
       '(("\\.js$" . js2-mode))
       auto-mode-alist))

(setq js2-cleanup-whitespace nil
      js2-mirror-mode nil
      js2-bounce-indent-flag nil)

(defun indent-and-back-to-indentation ()
  (interactive)
  (indent-for-tab-command)
  (let ((point-of-indentation
	 (save-excursion
	   (back-to-indentation)
	   (point))))
    (skip-chars-forward "\\s " point-of-indentation)))

;(define-key js2-mode-map "\C-i" 'indent-and-back-to-indentation)

;(define-key js2-mode-map "\C-m" nil)
