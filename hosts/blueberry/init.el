;;; init.el --- init-file for blueberry           -*- lexical-binding: t -*-

(use-package epg
  :demand t
  :config
  (setq epg-gpg-program "gpg2")
  (eval-after-load 'magit
    '(setq magit-commit-arguments '("--gpg-sign=233587A47C207910"))))

(use-package init-org
  :demand t)

(use-package init-org-publish
  :demand t)

(use-package init-notmuch
  :demand t)

(use-package ledger
  :init
  (defvar nico-ledger-imports nil)

  (defun nico-ledger-autosync ()
    (interactive)
    (switch-to-buffer (get-buffer-create "*ledger sync*"))
    (erase-buffer)
    (ledger-mode)
    (shell-command "ledger-autosync -l ~/org/reference/ledger/ledger.dat ~/Downloads/\\ telechargement.ofx -a Assets:Checking:CE --fid 10" (current-buffer)))

  (defun nico-ledger-convert-transaction ()
    (interactive)
    (save-excursion
      (back-to-indentation)
      (let* ((match (map-some (lambda (k v)
				(when (search-forward k (line-end-position) t)
				  k))
			      nico-ledger-imports))
	     (replacement (if match
			      (map-elt nico-ledger-imports match)
			    (read-string "Import as: " "Expenses:Misc"))))
	(search-forward "Expenses:Misc")
	(delete-backward-char 13)
	(insert replacement)
	(ledger-post-align-xact (point)))
      (goto-char (point-min))
      (while (re-search-forward "\\bEUR\\b" nil t)
	(replace-match "€" nil t)))
    (ledger-navigate-next-xact-or-directive))

  (defun nico-ledger-convert-all-transactions ()
    (interactive)
    (while (not (eobp))
      (nico-ledger-convert-transaction)))

  :bind ((:map ledger-mode-map
	       ("C-c M-i" . nico-ledger-convert-transaction)))
  :config
  (add-hook 'ledger-mode-hook #'company-mode))

(use-package prodigy
  :config
  (prodigy-define-service
    :name "nicolas-petton.fr"
    :cwd "/home/nico/Public/nicolas-petton.fr"
    :command "python"
    :args '("-m" "SimpleHTTPServer" "6002")
    :port 6002
    :tags '(personal))

  (prodigy-define-service
    :name "aurelia.saout.fr"
    :cwd "/home/nico/work/aurelia.saout.fr"
    :command "jekyll"
    :args '("serve" "--watch" "-P" "4002")
    :port 4002
    :tags '(personal))

  (prodigy-define-service
    :name "ftgp.se"
    :cwd "/home/nico/work/ftgp/website/public"
    :command "python"
    :args '("-m" "SimpleHTTPServer" "4005")
    :port 4005
    :tags '(personal))

  (prodigy-define-service
    :name "public/"
    :cwd "/home/nico/Public/"
    :command "python"
    :args '("-m" "SimpleHTTPServer" "4003")
    :port 4003
    :tags '(personal))

  (prodigy-define-service
    :name "Amber documentation"
    :cwd "/home/nico/work/smalltalk/amber-documentation/"
    :command "jekyll"
    :args '("serve" "--watch" "-P" "4001")
    :port 4001
    :tags '(personal)))

(when (window-system)
  (set-face-attribute 'default nil :height 110 :family "Fira Mono"))

;; Local Variables:
;; indent-tabs-mode: nil
;; End:
;;; init.el ends here
