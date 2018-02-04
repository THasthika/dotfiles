(use-package company
  :ensure t
  :commands (company-mode
             company-complete
             company-complete-common
             company-complete-common-or-cycle
             company-files
             company-dabbrev
             company-ispell
             company-c-headers
             company-jedi
             company-tern
             company-web-html
             company-auctex)
  :init
  (setq company-minimum-prefix-length 2
        company-require-match 0
        company-selection-wrap-around t
        company-dabbrev-downcase nil
        company-tooltip-limit 20                      ; bigger popup window
        company-tooltip-align-annotations 't          ; align annotations to the right tooltip border
        company-idle-delay .4                         ; decrease delay before autocompletion popup shows
        company-begin-commands '(self-insert-command)) ; start autocompletion only after typing
  (eval-after-load 'company
    '(add-to-list 'company-backends '(company-files
                                      company-capf)))
  :bind (("M-t"   . company-complete)
         ("C-c f" . company-files)
         ("C-c a" . company-dabbrev)
         ("C-c d" . company-ispell)
         :map company-active-map
              ("C-n"    . company-select-next)
              ("C-p"    . company-select-previous)
              ([return] . company-complete-selection)
              ("C-w"    . backward-kill-word)
              ("C-c"    . company-abort)
              ("C-c"    . company-search-abort))
  :diminish (company-mode . "ς")
  :config
  ;; (global-company-mode)
  (add-hook 'after-init-hook 'global-company-mode)
  ;; C++ header completion
  (use-package company-c-headers
    :ensure t
    :bind (("C-c c" . company-c-headers))
    :config
    (add-to-list 'company-backends 'company-c-headers))
  ;; Python auto completion
  (use-package company-jedi
    :ensure t
    :bind (("C-c j" . company-jedi))
    :config
    (add-to-list 'company-backends 'company-jedi))
  ;; Tern for JS
  (use-package company-tern
    :ensure t
    :bind (("C-c t" . company-tern))
    :init
    (setq company-tern-property-marker "")
    (setq company-tern-meta-as-single-line t)
    :config
    (add-to-list 'company-backends 'company-tern))
  ;; HTML completion
  (use-package company-web
    :ensure t
    :bind (("C-c w" . company-web-html))
    :config
    (add-to-list 'company-backends 'company-web-html))
  ;; LaTeX autocompletion
  (use-package company-auctex
    :ensure t
    :bind (("C-c l" . company-auctex))
    :config
    (add-to-list 'company-backends 'company-auctex)))

(provide 'init-company)
