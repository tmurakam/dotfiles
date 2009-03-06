;; cache file name
(let* ((file-dir "~/.emacs-flc"))
  (if (file-exists-p file-dir) 
      (setq fast-lock-cache-directories (list file-dir))))

;; Activate Backspace 
;(load-library "term/keyswap")
;(define-key function-key-map [delete] [8])
;(put 'delete 'ascii-character 8)
(global-set-key "\C-h" 'delete-backward-char)

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
(setq font-lock-support-mode 'fast-lock-mode)

;; When new file that is not exist yet is opened, insert a template file.
;(add-hook 'find-file-hooks 'auto-insert)
;(setq auto-insert-directory "~/.template/"	;; Template file directory
;      auto-insert-alist (append 		;; Template file alist
;			 '((html-mode . "insert.html")
;			   (rpm-mode  . "insert.spec"))
;			 auto-insert-alist))
;(require 'autoinsert)

(setq minibuffer-max-depth nil)

;; Use space instead of tab for indentation
(setq-default indent-tabs-mode nil)
