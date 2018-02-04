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

(provide 'init-tex-site)
