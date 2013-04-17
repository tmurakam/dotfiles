;;; package.el 設定

(when (require 'package nil t)
  ;; Marmalade, 開発者運営 ELPA を追加
  (add-to-list 'package-archives
               '("marmalade" . "http://marmalade-repo.org/packages/"))
  (add-to-list 'package-archives '("ELPA" . "http://tromey.com/elpa/"))

  ;; ELPA にロードパスを通して読み込む
  (package-initialize))