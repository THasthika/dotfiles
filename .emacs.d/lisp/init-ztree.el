(use-package ztree
  :ensure t
  :bind* (("M-m g v" . ztree-dir)
          ("M-m g V" . ztree-diff))
  :init
  (setq ztree-dir-move-focus t))

(provide 'init-ztree)
