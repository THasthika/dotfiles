(use-package beacon
  :ensure t
  :demand t
  :diminish beacon-mode
  :bind* (("M-m g z" . beacon-blink))
  :config
  (beacon-mode 1))

(provide 'init-beacon)
