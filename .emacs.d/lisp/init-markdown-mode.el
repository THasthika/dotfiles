(use-package markdown-mode
  :ensure t
  :mode ("\\.markdown\\'" "\\.mkd\\'" "\\.md\\'")
  :config
  (use-package pandoc-mode
    :ensure t
    :mode ("\\.markdown\\'" "\\.mkd\\'" "\\.md\\'")))

(provide 'init-markdown-mode)
