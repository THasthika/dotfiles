;; (use-package markdown-mode
;;   :ensure t
;;   :mode ("\\.markdown\\'" "\\.mkd\\'" "\\.md\\'")
;;   :config
;;   (use-package pandoc-mode
;;     :ensure t
;;     :mode ("\\.markdown\\'" "\\.mkd\\'" "\\.md\\'")))

(use-package markdown-mode
  :ensure t
  :mode ("\\.markdown\\'" "\\.mkd\\'" "\\.md\\'")
  :bind (("C-c b" . markdown-insert-bold)))

(provide 'init-markdown-mode)
