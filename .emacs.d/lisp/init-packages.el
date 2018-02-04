;; dired config
(use-package dired
  :bind (:map dired-mode-map
              ("C-c C-e" . wdired-change-to-wdired-mode))
  :init
  (setq dired-dwim-target t
        dired-recursive-copies 'top
        dired-recursive-deletes 'top
        dired-listing-switches "-alh")
  :config
  (add-hook 'dired-mode-hook 'dired-hide-details-mode))

;; diminish
(use-package diminish
  :ensure t
  :demand t
  :diminish (visual-line-mode . "ω")
  :diminish hs-minor-mode
  :diminish abbrev-mode
  :diminish auto-fill-function
  :diminish subword-mode)

;; spell checking
(use-package flyspell
  :diminish (flyspell-mode . "φ")
  :bind* (("M-m ] s" . flyspell-goto-next-error)))

(use-package async
  :ensure t
  :commands (async-start))

(use-package cl-lib
  :ensure t)

(use-package dash
  :ensure t)

(use-package s
  :ensure t)

(use-package restart-emacs
  :ensure t
  :bind* (("C-x M-c" . restart-emacs)))

(use-package which-key
  :ensure t
  :defer t
  :diminish which-key-mode
  :init
  (setq which-key-sort-order 'which-key-key-order-alpha)
  :bind* (("M-m ?" . which-key-show-top-level))
  :config
  (which-key-mode)
  (which-key-add-key-based-replacements
   "M-m ?" "top level bindings"))

(use-package discover-my-major
  :ensure t
  :bind (("C-h C-m" . discover-my-major)
         ("C-h M-m" . discover-my-mode)))

(use-package flx-ido
  :ensure t
  :defer t)

(use-package smex
  :ensure t
  :config
  (smex-initialize))

(use-package beacon
  :ensure t
  :demand t
  :diminish beacon-mode
  :bind* (("M-m g z" . beacon-blink))
  :config
  (beacon-mode 1))

(use-package undo-tree
  :ensure t
  :diminish undo-tree-mode
  :bind* (("M-m u" . undo-tree-undo)
          ("M-m r" . undo-tree-redo)
          ("M-m U" . undo-tree-visualize))
  :config
  (global-undo-tree-mode 1))

(use-package goto-chg
  :ensure t
  :bind* (("M-m g ;" . goto-last-change)
          ("M-m g ," . goto-last-change-reverse)))

(use-package avy
  :ensure t
  :init
  (setq avy-keys-alist
        `((avy-goto-char-timer . (?j ?k ?l ?f ?s ?d ?e ?r ?u ?i))
          (avy-goto-line . (?j ?k ?l ?f ?s ?d ?e ?r ?u ?i))))
  (setq avy-style 'pre)
  :bind* (("M-m f" . avy-goto-char-timer)
          ("M-m F" . avy-goto-line)))

(use-package highlight-symbol
  :ensure t
  :bind (("M-n" . highlight-symbol-next)
         ("M-p" . highlight-symbol-prev))
  :config
  (highlight-symbol-nav-mode))

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

(use-package ztree
  :ensure t
  :bind* (("M-m g v" . ztree-dir)
          ("M-m g V" . ztree-diff))
  :init
  (setq ztree-dir-move-focus t))

(use-package neotree
  :ensure t
  :bind* (("M-m SPC n". neotree-toggle))
  :init
  (setq neo-smart-open t))

(use-package ggtags
  :ensure t
  :diminish ggtags-mode
  :bind* (("M-m T"   . ggtags-find-tag-regexp)
          ("M-m g t" . ggtags-create-tags)
          ("M-m g T" . ggtags-update-tags))
  :init
  (setq-local imenu-create-index-function #'ggtags-build-imenu-index)
  :config
  (add-hook 'prog-mode-hook 'ggtags-mode))

(use-package dumb-jump
  :ensure t
  :bind (("C-c S" . dumb-jump-go))
  :config
  (dumb-jump-mode))

(use-package dash-at-point
  :ensure t
  :bind (("C-c I" . dash-at-point))
  :bind* (("M-m SPC i" . dash-at-point-with-docset)
          ("M-m SPC I" . dash-at-point)))

(use-package fill-column-indicator
  :ensure t
  :commands (fci-mode)
  :init
  (setq fci-rule-width 5
        fci-rule-column 79))

(use-package region-state
  :ensure t
  :config
  (region-state-mode))

(use-package color-theme-sanityinc-tomorrow
  :ensure t
  :config
  (progn
    (load-theme 'sanityinc-tomorrow-night t)))

(use-package spaceline
  :ensure t
  :demand t
  :init
  (setq powerline-default-separator 'arrow-fade)
  :config
  (require 'spaceline-config)
  (spaceline-spacemacs-theme)
  (spaceline-helm-mode))

(use-package fancy-battery
  :ensure t
  :init
  (setq fancy-battery-show-percentage t)
  :config
  (fancy-battery-mode))

(use-package origami
  :ensure t
  :commands (origami-toggle-node)
  :config
  (global-origami-mode)
  (global-set-key (kbd "C-c C-f") 'origami-toggle-node))

(use-package markdown-mode
  :ensure t
  :mode ("\\.markdown\\'" "\\.mkd\\'" "\\.md\\'")
  :config
  (use-package pandoc-mode
    :ensure t
    :mode ("\\.markdown\\'" "\\.mkd\\'" "\\.md\\'")))

(use-package tex-site
  :ensure auctex
  :ensure auctex-latexmk
  :ensure latex-preview-pane
  :diminish reftex-mode
  :mode (("\\.tex\\'" . LaTeX-mode)
         ("\\.xtx\\'" . LaTeX-mode))
  :init
  (setq reftex-default-bibliography '("~/Dropbox/references/references.bib"))
  (setq TeX-auto-save t)
  (setq TeX-parse-self t)
  (setq-default TeX-master nil)
  (add-hook 'LaTeX-mode-hook 'visual-line-mode)
  (add-hook 'LaTeX-mode-hook 'flyspell-mode)
  (add-hook 'LaTeX-mode-hook 'LaTeX-math-mode)
  (add-hook 'LaTeX-mode-hook 'turn-on-reftex)
  (setq reftex-plug-into-AUCTeX t)
  (setq TeX-PDF-mode t)
  :config
  ;; Use Skim as viewer, enable source <-> PDF sync
  ;; make latexmk available via C-c C-c
  ;; Note: SyncTeX is setup via ~/.latexmkrc (see below)
  (add-hook 'LaTeX-mode-hook (lambda ()
                               (push
                                '("latexmk" "latexmk -xelatex -pdf %s" TeX-run-TeX nil t
                                  :help "Run latexmk on file")
                                TeX-command-list)))
  (add-hook 'TeX-mode-hook '(lambda () (setq TeX-command-default "latexmk")))

  ;; use Skim as default pdf viewer
  ;; Skim's displayline is used for forward search (from .tex to .pdf)
  ;; option -b highlights the current line; option -g opens Skim in the background
  (setq TeX-view-program-selection '((output-pdf "PDF Viewer")))
  (setq TeX-view-program-list
        '(("PDF Viewer" "/Applications/Skim.app/Contents/SharedSupport/displayline -b -g %n %o %b"))))

(defun sk/diminish-reftex ()
  (interactive)
  (diminish 'reftex-mode ""))
(add-hook 'auctex-mode-hook 'sk/diminish-reftex)
(add-hook 'latex-mode-hook 'sk/diminish-reftex)
(add-hook 'reftex-mode-hook 'sk/diminish-reftex)

(use-package writegood-mode
  :ensure t
  :diminish writegood-mode
  :config
  (progn
    (add-hook 'text-mode-hook 'writegood-mode)))

(use-package magit
  :ensure t
  :bind* (("M-m SPC e" . magit-status)
          ("M-m g b"   . magit-blame)))

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

(use-package git-timemachine
  :ensure t
  :commands (git-timemachine-toggle
             git-timemachine-switch-branch)
  :bind* (("M-m g l" . git-timemachine-toggle)
          ("M-m g L" . git-timemachine-switch-branch)))

(use-package yagist
  :ensure t
  :commands (yagist-region-or-buffer
             yagist-region-or-buffer-private)
  :bind* (("M-m g p" . yagist-region-or-buffer)
          ("M-m g P" . yagist-region-or-buffer-private))
  :init
  (setq yagist-encrypt-risky-config t))

(use-package editorconfig
  :ensure t
  :demand t
  :config
  (editorconfig-mode 1))

(use-package yaml-mode
  :ensure t
  :mode "\\.yml$")

(use-package emacs-lisp-mode
  :mode ("\\.el$" . emacs-lisp-mode)
  :bind (:map emacs-lisp-mode-map
              ("C-c I" . describe-function)
              ("C-c S" . find-function-at-point)))

(use-package auto-compile
  :ensure t)

(use-package rtags
  :ensure t
  :defer 2
  :bind (:map c++-mode-map
              ("C-c I" . rtags-print-symbol-info)
              ("C-c S" . rtags-find-symbol-at-point))
  :init
  (setq rtags-autostart-diagnostics t)
  (setq rtags-completions-enabled t))

(use-package cmake-ide
  :ensure t
  :defer 2
  :config
  (cmake-ide-setup))

(use-package pyenv-mode
  :ensure t
  :commands (pyenv-mode
             pyenv-mode-set
             pyenv-mode-unset))

(use-package web-mode
  :ensure t
  :mode ("\\.html$" . web-mode))

(use-package js2-mode
  :ensure t
  :mode ("\\.js$" . js2-mode)
  :init
  (setq js2-strict-inconsistent-return-warning nil))

(use-package scss-mode
  :ensure t
  :mode "\\.scss$")

(use-package json-mode
  :ensure t
  :mode "\\.json$")

(use-package nginx-mode
  :ensure t
  :commands (nginx-mode))

(use-package emmet-mode
  :ensure t
  :diminish (emmet-mode . "ε")
  :bind* (("C-)" . emmet-next-edit-point)
          ("C-(" . emmet-prev-edit-point))
  :commands (emmet-mode
             emmet-next-edit-point
             emmet-prev-edit-point))

(use-package autopair
  :ensure t
  :config
  (autopair-global-mode t))

(use-package lua-mode
  :ensure t)

(use-package rust-mode
  :ensure t)

(use-package php-mode
  :ensure t)

(use-package typescript-mode
  :ensure t)

(use-package rjsx-mode
  :ensure t
  :config
  (add-to-list 'auto-mode-alist '("components\\/.*\\.js\\'" . rjsx-mode)))

(use-package git-gutter
  :ensure t
  :config
  (global-git-gutter-mode +1))

(provide 'init-packages)
