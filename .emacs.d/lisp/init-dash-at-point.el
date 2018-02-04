(use-package dash-at-point
  :ensure t
  :bind (("C-c I" . dash-at-point))
  :bind* (("M-m SPC i" . dash-at-point-with-docset)
          ("M-m SPC I" . dash-at-point)))

(provide 'init-dash-at-point)
