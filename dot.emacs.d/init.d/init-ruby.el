(add-to-load-path "elisp/rhtml" "elisp/rinari")

;; Rinari
(require 'rinari)

;; RHTML mode (.erb stuff)
(require 'rhtml-mode)
(add-hook 'rhtml-mode-hook (lambda () (rinari-launch)))

;; ruby-mode
(add-hook 'ruby-mode-hook
          '(lambda ()
             (inf-ruby-keys)
             (setq tab-width 8)))
(setq ruby-indent-level 2)

(setq auto-mode-alist (append '(("\\.rb$" . ruby-mode)) auto-mode-alist))

;; rubydb
(autoload 'rubydb "rubydb3x"
  "run rubydb on program file in buffer *gud-file*.
the directory containing file becomes the initial working directory
and source-file directory for your debugger." t)

