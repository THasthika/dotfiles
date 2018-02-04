(use-package fancy-battery
  :ensure t
  :init
  (setq fancy-battery-show-percentage t)
  :config
  (fancy-battery-mode))

(provide 'init-fancy-battery)
