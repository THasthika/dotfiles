(use-package js2-mode
  :ensure t
  :mode ("\\.js$" . js2-mode)
  :init
  (setq js2-strict-inconsistent-return-warning nil))

(provide 'init-js2-mode)
