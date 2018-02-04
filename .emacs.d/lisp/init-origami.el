(use-package origami
  :ensure t
  :commands (origami-toggle-node)
  :config
  (global-origami-mode)
  (global-set-key (kbd "C-c C-f") 'origami-toggle-node))

(provide 'init-origami)
