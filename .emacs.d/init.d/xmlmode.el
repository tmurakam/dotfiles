;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; pgsml for XML
(autoload 'sgml-mode "psgml" "My SGML Major Mode" t)

;; docbook
(defun my-docbook-hook ()
  (sgml-load-dtd "docbook.ced")
  (local-set-key "\M-l"
                 '(lambda ()
                    (interactive)
                    (sgml-insert-element 'listitem)
                    (sgml-insert-element 'para)
                    (sgml-indent-line)))
  (local-set-key "\M-p"
                 '(lambda ()
                    (interactive)
                    (sgml-indent-line)
                    (sgml-insert-element 'para)
                    (sgml-indent-line)))
;  (local-set-key "<" 'sgml-insert-element)
  )

(add-hook 'sgml-mode-hook 'my-docbook-hook)

(defun docbook-mode ()
  (interactive)
  (sgml-mode)
)

;(setq auto-mode-alist
;      (append
;       '(("\\.xml$" . docbook-mode))
;       auto-mode-alist))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; nXML mode

(autoload 'nxml-mode "nxml-mode" "nXML mode" t)

(setq auto-mode-alist
      (append
       '(("\\.\\(xml\\|xsl\\|xhtml\\)$" . nxml-mode))
       auto-mode-alist))

;; Fix up indentation of data...
(setq-default sgml-indent-data t)

;; XML markup faces.

(setq-default sgml-set-face t)

;; faces
(make-face 'sgml-comment-face)
(make-face 'sgml-doctype-face)
(make-face 'sgml-end-tag-face)
(make-face 'sgml-entity-face)
(make-face 'sgml-ignored-face)
(make-face 'sgml-ms-end-face)
(make-face 'sgml-ms-start-face)
(make-face 'sgml-pi-face)
(make-face 'sgml-sgml-face)
(make-face 'sgml-short-ref-face)
(make-face 'sgml-start-tag-face)

(set-face-foreground 'sgml-comment-face "maroon")
(set-face-foreground 'sgml-doctype-face "dark green")
(set-face-foreground 'sgml-end-tag-face "blue2")
(set-face-foreground 'sgml-entity-face "red2")
(set-face-foreground 'sgml-ignored-face "maroon")
(set-face-background 'sgml-ignored-face "gray90")
(set-face-foreground 'sgml-ms-end-face "maroon")
(set-face-foreground 'sgml-ms-start-face "maroon")
(set-face-foreground 'sgml-pi-face "maroon")
(set-face-foreground 'sgml-sgml-face "maroon")
(set-face-foreground 'sgml-short-ref-face "goldenrod")
(set-face-foreground 'sgml-start-tag-face "blue2")

(setq-default sgml-markup-faces
              '((comment . sgml-comment-face)
                (doctype . sgml-doctype-face)
                (end-tag . sgml-end-tag-face)
                (entity . sgml-entity-face)
                (ignored . sgml-ignored-face)
                (ms-end . sgml-ms-end-face)
                (ms-start . sgml-ms-start-face)
                (pi . sgml-pi-face)
                (sgml . sgml-sgml-face)
                (short-ref . sgml-short-ref-face)
                (start-tag . sgml-start-tag-face)))
