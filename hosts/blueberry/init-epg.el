(require 'epg)
(require 'magit)

(setq epg-gpg-program "gpg2")
(setq magit-commit-arguments (quote ("--gpg-sign=233587A47C207910")))

(provide 'init-epg)
