(use-package git-timemachine
  :ensure t
  :commands (git-timemachine-toggle
             git-timemachine-switch-branch)
  :bind* (("M-m g l" . git-timemachine-toggle)
          ("M-m g L" . git-timemachine-switch-branch)))

(provide 'init-git-timemachine)
