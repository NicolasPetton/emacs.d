;;; init.el --- init-file for blueberry           -*- lexical-binding: t -*-

;; (use-package epa
;;   :config
;;   (progn
;;     (setq epa-pinentry-mode 'loopback)))

(use-package khardel
  :bind (:map message-mode-map
              ("C-c TAB" . khardel-insert-email)))

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

;; (use-package init-exwm
;;   :demand t)

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
          (add-hook 'ledger-mode-hook #'company-mode)))

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
