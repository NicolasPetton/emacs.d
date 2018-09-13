;;; init.el --- init-file for blueberry           -*- lexical-binding: t -*-

;; (use-package epa
;;   :config
;;   (progn
;;     (setq epa-pinentry-mode 'loopback)))

(use-package vdirel
  :after message
  :bind (:map message-mode-map
              ("C-c TAB" . vdirel-helm-select-email))
  :init (progn
          (setq vdirel-repository "~/org/contacts/contacts")))

(use-package epg
  :demand t
  :config
  (progn
    (setq epg-gpg-program "gpg2")
    (eval-after-load 'magit
      '(setq magit-commit-arguments '("--gpg-sign=233587A47C207910")))
    ;; Use gpg as ssh agent (for this to work in shells, also set the ENV var in
    ;; $HOME/.profile or similar.
    (setenv "SSH_AUTH_SOCK"
        (string-trim
         (shell-command-to-string "gpgconf --list-dirs agent-ssh-socket")))
    ;; Use pinentry-emacs
    ;; (pinentry-start)
    ))

(use-package init-org
  :demand t)

(use-package init-org-publish
  :demand t)

(use-package init-notmuch
  :demand t)

(use-package init-exwm
  :demand t)

(use-package flycheck-ledger
  :demand t
  :after (flycheck ledger-mode)
  :init (progn
          (add-hook 'ledger-mode-hook #'flycheck-mode)
          (setq flycheck-ledger-zero-accounts '("Assets:Budget:Available"
                                                "Assets:Budget:Unbudgeted"
                                                "Assets:Expenses:InternalTransfer"))))

(use-package ledger
  :init (progn
          (add-hook 'ledger-mode-hook #'company-mode)

          (defvar boobank-ledger-accounts nil
            "Alist of Boobank-account-id -> Ledger account used when importing from Boobank.")
          (defvar boobank-ledger-file nil
            "Path to the ledger file.")
          (defvar boobank-ledger-import-since "2018-05-30")

          (defun boobank-ledger-import ()
            "Import transactions from boobank in Ledger format using \"ledger-autosync\"."
            (interactive)
            (let ((fid "10"))
              (switch-to-buffer (get-buffer-create "*ledger sync*"))
              (erase-buffer)
              (ledger-mode)
              (dolist (acc boobank-ledger-accounts)
                (goto-char (point-max))
                (message "Fetching transactions for account %s" (car acc))
                (shell-command (format "boobank -f ofx history %s %s > /tmp/%s"
                                       (car acc)
                                       boobank-ledger-import-since
                                       (car acc)))
                (with-current-buffer (find-file-noselect (format "/tmp/%s" (car acc)))
                  (save-match-data
                    (while (re-search-forward "[^[:ascii:]]" nil t)
                      (replace-match ""))
                    (save-buffer)
                    (kill-buffer)))
              (message "Converting transactions for account %s" (car acc))
              (shell-command (format "ledger-autosync --assertions -l %s /tmp/%s -a %s --fid %s"
                                     boobank-ledger-file
                                     (car acc)
                                     (cdr acc)
                                     fid)
                             t))))))

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
    :tags '(personal)))

(when (window-system)
  (set-face-attribute 'default nil :height 110 :family "Fira Mono"))

;; Local Variables:
;; indent-tabs-mode: nil
;; End:
;;; init.el ends here
