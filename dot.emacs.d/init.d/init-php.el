(when (autoload-if-found 'php-mode "php-mode")
  (add-to-list 'auto-mode-alist '("\\.php\\'" . php-mode))
  ;(setq php-mode-force-pear t)
)



