(use-package fill-column-indicator
  :ensure t
  :commands (fci-mode)
  :init
  (setq fci-rule-width 5
        fci-rule-column 79))

(provide 'init-fill-column-indicator)
