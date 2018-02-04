(use-package highlight-symbol
  :ensure t
  :bind (("M-n" . highlight-symbol-next)
         ("M-p" . highlight-symbol-prev))
  :config
  (highlight-symbol-nav-mode))

(provide 'init-highlight-symbol)
