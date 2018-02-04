(use-package rtags
  :ensure t
  :defer 2
  :bind (:map c++-mode-map
              ("C-c I" . rtags-print-symbol-info)
              ("C-c S" . rtags-find-symbol-at-point))
  :init
  (setq rtags-autostart-diagnostics t)
  (setq rtags-completions-enabled t))

(provide 'init-rtags)
