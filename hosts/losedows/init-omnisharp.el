(require 'omnisharp)
(require 'company)

(eval-after-load 'company
  '(add-to-list 'company-backends 'company-omnisharp))

(add-hook 'csharp-mode-hook #'omnisharp-mode)

(provide 'init-omnisharp)
