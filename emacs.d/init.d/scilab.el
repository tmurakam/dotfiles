;; scilab-mode
(autoload 'scilab-mode "scilab" "Scilab mode" t)
(setq auto-mode-alist (cons '("\\(\\.sci$\\|\\.sce$\\)" . scilab-mode)
auto-mode-alist))
(setq scilab-mode-hook '(lambda () (setq scilab-indent-level 4)))
