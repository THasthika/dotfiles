(use-package header2
  :ensure t
  :config
  (add-hook 'write-file-hooks 'auto-update-file-header)
  (add-hook 'emacs-lisp-mode-hook 'auto-make-header)
  (add-hook 'c-mode-common-hook   'auto-make-header)
  (add-hook 'sh-mode-hook 'auto-make-header)
  (add-hook 'asm-mode-hook 'auto-make-header))

(provide 'init-header2)
