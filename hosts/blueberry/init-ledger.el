(require 'ledger-mode)
(require 'company)
(require 'map)

(add-hook 'ledger-mode-hook #'company-mode)

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

(define-key ledger-mode-map (kbd "C-c M-i") #'nico-ledger-convert-transaction)

(provide 'init-ledger)
