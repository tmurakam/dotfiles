;; Mule-UCS
;;(if (string-match "^4\\.1" mule-version) (require 'un-define))

(setq lang (getenv "LANG"))
(cond
 ((or
   (equal lang "ja_JP.eucJP")
   (equal lang "ja_JP.ujis")
   (equal lang "ja_JP.EUC")
   (equal lang "japanese.euc"))
  (set-language-environment "Japanese")
  (require 'un-define) ;; Mule-UCS
  (prefer-coding-system 'euc-jp-unix)
  (set-buffer-file-coding-system 'euc-jp-unix)
  (set-terminal-coding-system 'euc-jp-unix)
  (set-keyboard-coding-system 'euc-jp-unix)
  )
 ((equal lang "ja_JP.UTF-8")
  (set-language-environment "Japanese")
  (prefer-coding-system 'utf-8)
  (set-buffer-file-coding-system 'utf-8)
  (set-terminal-coding-system 'utf-8)
  (set-keyboard-coding-system 'utf-8)
  )
 (t
  (progn
    (set-language-environment "English")
    (prefer-coding-system 'utf-8)
    (set-buffer-file-coding-system 'utf-8)
    (set-terminal-coding-system 'utf-8)
    (set-keyboard-coding-system 'utf-8))))
