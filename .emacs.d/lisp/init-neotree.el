(use-package neotree
  :ensure t
  :bind* (("M-m SPC n". neotree-toggle))
  :init
  (setq neo-smart-open t))

(provide 'init-neotree)
