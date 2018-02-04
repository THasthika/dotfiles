(use-package goto-chg
  :ensure t
  :bind* (("M-m g ;" . goto-last-change)
          ("M-m g ," . goto-last-change-reverse)))

(provide 'init-goto-chg)
