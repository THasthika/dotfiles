(use-package emacs-lisp-mode
  :mode ("\\.el$" . emacs-lisp-mode)
  :bind (:map emacs-lisp-mode-map
              ("C-c I" . describe-function)
              ("C-c S" . find-function-at-point)))

(provide 'init-emacs-lisp-mode)
