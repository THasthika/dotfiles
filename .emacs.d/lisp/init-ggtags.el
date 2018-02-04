(use-package ggtags
  :ensure t
  :diminish ggtags-mode
  :bind* (("M-m T"   . ggtags-find-tag-regexp)
          ("M-m g t" . ggtags-create-tags)
          ("M-m g T" . ggtags-update-tags))
  :init
  (setq-local imenu-create-index-function #'ggtags-build-imenu-index)
  :config
  (add-hook 'prog-mode-hook 'ggtags-mode))

(provide 'init-ggtags)
