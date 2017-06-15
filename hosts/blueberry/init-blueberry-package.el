(let ((packages-to-load '(notmuch alert org-gnome)))
  (dolist (package packages-to-load)
    (when (not (package-installed-p package))
      (package-install package))))

(provide 'init-blueberry-package)
