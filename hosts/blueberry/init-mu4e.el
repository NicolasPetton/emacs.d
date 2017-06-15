(require 'mu4e)
(require 'alert)
(require 'smtpmail)
(require 'org-mu4e)
(require 'gnus-dired)

(define-key global-map (kbd "M-N") 'mu4e)

(setq mu4e-attachment-dir "~/Download")

;; don't keep message buffers around
(setq message-kill-buffer-on-exit t)

;; attempt to show images when viewing messages
(setq mu4e-view-show-images t
      mu4e-view-image-max-width 800)

;; use imagemagick, if available
(when (fboundp 'imagemagick-register-types)
  (imagemagick-register-types))

(setq mu4e-sent-messages-behavior 'sent)

(setq mu4e-msg2pdf "/usr/bin/msg2pdf"
      mu4e-get-mail-command "offlineimap"
      mu4e-html2text-command "w3m -T text/html"
      mu4e-update-interval 600)

(defun nico/notify-new-email ()
  (alert
   "You have unread emails"
   :title "New mail!"
   :icon "/usr/share/icons/gnome/32x32/status/mail-unread.png"))

(add-hook 'mu4e-index-updated-hook #'nico/notify-new-email)

(setq message-send-mail-function 'smtpmail-send-it
      user-full-name "Nicolas Petton"
      mu4e-compose-signature "Nicolas Petton
http://nicolas-petton.fr"
      mu4e-compose-signature-auto-include t
      starttls-use-gnutls t)

(defvar nico/mu4e-account-alist
  '(("nicolas@petton.fr"
     (user-mail-address "nicolas@petton.fr")
     (smtpmail-starttls-credentials '(("mail.messagingengine.com" 465 nil nil)))
     (smtpmail-auth-credentials
      '(("smtp.gmail.com" 587 "mail.messagingengine.com" nil)))
     (smtpmail-default-smtp-server "mail.messagingengine.com")
     (smtpmail-smtp-server "mail.messagingengine.com")
     (smtpmail-smtp-service 587))
    ;; ("FTGP"
    ;;  (user-mail-address "nicolas.petton@foretagsplatsen.se")
    ;;  (smtpmail-starttls-credentials '(("smtp.gmail.com" 587 nil nil)))
    ;;  (smtpmail-auth-credentials
    ;;   '(("smtp.gmail.com" 587 "nicolas.petton@foretagsplatsen.se" nil)))
    ;;  (smtpmail-default-smtp-server "smtp.gmail.com")
    ;;  (smtpmail-smtp-server "smtp.gmail.com")
    ;;  (smtpmail-smtp-service 587))
    ))

(defun nico/mu4e-set-account ()
  "Set the account for composing a message.
   Try to match the current maildir or ask for the account name"
  (interactive)
  (let* ((account
	  (nico/select-mail-account)))
    (nico/setup-mail-account account)))

(defun nico/select-mail-account ()
  (interactive)
  (completing-read (format "Compose with account: (%s) "
			   (mapconcat #'(lambda (var) (car var)) nico/mu4e-account-alist "/"))
		   (mapcar #'(lambda (var) (car var)) nico/mu4e-account-alist)
		   nil t nil nil (caar nico/mu4e-account-alist)))

(defun nico/setup-mail-account (account)
  (let ((account-vars (cdr (assoc account nico/mu4e-account-alist))))
    (mapc #'(lambda (var)
	      (set (car var) (cadr var)))
	  account-vars)))

(nico/setup-mail-account "nicolas@petton.fr")

(add-hook 'mu4e-compose-pre-hook #'nico/mu4e-set-account)
(add-hook 'mu4e-compose-mode-hook #'mml-secure-message-sign)

(add-to-list 'mu4e-view-actions
   '("View in browser" . mu4e-action-view-in-browser) t)

;; Attach files with dired
;; make the `gnus-dired-mail-buffers' function also work on
;; message-mode derived modes, such as mu4e-compose-mode
(defun gnus-dired-mail-buffers ()
  "Return a list of active message buffers."
  (let (buffers)
    (save-current-buffer
      (dolist (buffer (buffer-list t))
     	(set-buffer buffer)
     	(when (and (derived-mode-p 'message-mode)
		   (null message-sent-message-via))
     	  (push (buffer-name buffer) buffers))))
    (nreverse buffers)))

(setq gnus-dired-mail-mode 'mu4e-user-agent)
(add-hook 'dired-mode-hook 'turn-on-gnus-dired-mode)

;; epa

(add-hook 'mu4e-view-mode-hook #'epa-mail-mode)
(add-hook 'mu4e-compose-mode-hook #'epa-mail-mode)

;; Display embedded diffs nicely

(defun mu2diff ()
  (interactive)
  (let ((buf "*Diff message view*")
        (message-contents (buffer-string)))
    (switch-to-buffer buf)
    (read-only-mode 0)
    (erase-buffer)
    (insert message-contents)
    (goto-char (point-min))
    (mu2diff--skip-message-headers)
    (read-only-mode 1)
    (diff-mode)))

(defun mu2diff--skip-message-headers ()
  (let ((message-header-regex "^[\\\s+\\\t+]+\\|^[A-Za-z0-9-]+:\\\s"))
   (save-excursion
     (goto-char (point-min))
     (while (looking-at message-header-regex)
       (forward-line))
     (delete-region (point-min) (point)))))

(define-key mu4e-view-mode-map (kbd "C-c d") #'mu2diff)

(provide 'init-mu4e)
