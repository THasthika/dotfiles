(use-package undo-tree
  :ensure t
  :diminish (undo-tree-mode)
  :config
  (global-undo-tree-mode 1)
  :bind (("C-/" . undo-tree-undo)
	  ("C-S-/" . undo-tree-redo))
  :bind* (("M-m u" . undo-tree-undo)
          ("M-m r" . undo-tree-redo)
          ("M-m U" . undo-tree-visualize)))

(provide 'init-undo-tree)
