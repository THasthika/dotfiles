(use-package magit
  :ensure t
  :bind* (("M-m SPC e" . magit-status)
          ("M-m g b"   . magit-blame)))

(provide 'init-magit)
