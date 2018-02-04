(use-package diff-hl
  :ensure t
  :commands (global-diff-hl-mode
             diff-hl-mode
             diff-hl-next-hunk
             diff-hl-previous-hunk
             diff-hl-mark-hunk
             diff-hl-diff-goto-hunk
             diff-hl-revert-hunk)
  :bind* (("M-m ] h" . diff-hl-next-hunk)
          ("M-m [ h" . diff-hl-previous-hunk)
          ("M-m i h" . diff-hl-mark-hunk)
          ("M-m a h" . diff-hl-mark-hunk)
          ("M-m g h" . diff-hl-diff-goto-hunk)
          ("M-m g H" . diff-hl-revert-hunk))
  :config
  (global-diff-hl-mode)
  (diff-hl-flydiff-mode)
  (diff-hl-margin-mode)
  (diff-hl-dired-mode))

(provide 'init-diff-hl)
