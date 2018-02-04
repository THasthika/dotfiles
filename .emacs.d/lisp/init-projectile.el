(use-package projectile
  :ensure t
  :bind* (("C-c p f"   . projectile-find-file)
          ("C-c p F"   . projectile-switch-project)
          ("C-c p TAB" . projectile-find-other-file)
	  ("C-c p c" . projectile-compile-project))
  :init
  (setq projectile-file-exists-remote-cache-expire (* 10 60))
  :diminish projectile-mode
  :config
  (projectile-global-mode))

(provide 'init-projectile)
