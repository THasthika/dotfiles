(use-package writegood-mode
  :ensure t
  :diminish writegood-mode
  :config
  (progn
    (add-hook 'text-mode-hook 'writegood-mode)))

(provide 'init-writegood-mode)
