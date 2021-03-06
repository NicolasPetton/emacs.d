(require 'notmuch)
(require 'seq)
(require 'org-notmuch)
(require 'fetch-email)
(require 'yasnippet)
(require 'debbugs)

;; use notmuch for sending emails
(global-set-key (kbd "C-x m") #'notmuch-mua-new-mail)

;; don't keep message buffers around
(setq message-kill-buffer-on-exit t)

;; Attach files from dired
(add-hook 'dired-mode-hook 'turn-on-gnus-dired-mode)

;; use imagemagick, if available
(when (fboundp 'imagemagick-register-types)
  (imagemagick-register-types))

(defvar nico-pgp-sign-excluded-emails '("monitor\.issues@gmail\.com"))

;; Sign messages by default
(add-hook 'message-setup-hook #'nico-maybe-sign-email)

(defun nico-maybe-sign-email ()
  "Sign the current buffer's email unless the message is sent to
  one of `nico-pgp-sign-excluded-emails'."
  (let ((email (message-fetch-field "to")))
    (unless (and email
                 (seq-some (lambda (regex)
                               (string-match regex email))
                             nico-pgp-sign-excluded-emails))
      (mml-secure-message-sign))))

;; Encrypt messages if there is a pubkey for all recipients

(defun my/can-encrypt-message-p ()
  "Return non-nil if current message can be encrypted.
I.e., the keyring has a public key for each recipient."
  (let ((from (cadr (mail-extract-address-components (message-fetch-field "From"))))
	(recipients (seq-map #'cadr
                             (seq-mapcat (lambda (header)
                                           (let ((header-value (message-fetch-field header)))
                                             (and
                                              header-value
                                              (mail-extract-address-components header-value t))))
                                         '("To" "CC" "BCC"))))
        (context (epg-make-context epa-protocol)))
    (and (not (my/has-no-encrypt-header))
         (string= from "nicolas@petton.fr")
	 (seq-every-p (lambda (recipient)
			(not (seq-empty-p (epg-list-keys context recipient))))
                      recipients))))

(defun my/has-no-encrypt-header ()
  "Return non-nil if the buffer contains a no-encrypt header."
  (save-excursion
    (goto-char (point-min))
    (search-forward "no-encrypt" nil t)))

(defun my/add-encryption-mark-if-possible ()
  "Add MML tag to encrypt message when there is a key for each recipient."
  (when (my/can-encrypt-message-p)
    (mml-secure-message-sign-encrypt)))

(add-hook 'message-send-hook #'my/add-encryption-mark-if-possible)


(add-hook 'message-setup-hook #'yas-minor-mode-on)

(define-key global-map (kbd "M-N") #'notmuch)

(add-to-list 'fetch-email-post-command-hook #'nico-notmuch-update)

(define-key notmuch-hello-mode-map (kbd "C-c C-c") #'fetch-email)
(define-key notmuch-hello-mode-map "g" #'notmuch-refresh-this-buffer)

(define-key notmuch-search-mode-map "g" #'notmuch-refresh-this-buffer)
(define-key notmuch-search-mode-map "d" #'nico-notmuch-search-tag-read)
(define-key notmuch-search-mode-map "D" #'nico-notmuch-search-tag-all-read)
(define-key notmuch-search-mode-map "u" #'nico-notmuch-search-tag-unread)

(define-key notmuch-show-mode-map "d" #'nico-notmuch-show-tag-read)
(define-key notmuch-show-mode-map "D" #'nico-notmuch-show-tag-all-read)
(define-key notmuch-show-mode-map "u" #'nico-notmuch-show-tag-unread)


(defun nico-notmuch-update (&rest args)
  (interactive)
  (notmuch-poll-and-refresh-this-buffer))

(defun nico-notmuch-address-selection-function (prompt collection initial-input)
  "Call (`completing-read'
      PROMPT COLLECTION nil nil INITIAL-INPUT 'notmuch-address-history)"
  (ido-completing-read
   prompt (cons initial-input collection) nil nil initial-input 'notmuch-address-history))

(defun nico-notmuch-search-tag (tags)
  (notmuch-search-tag tags)
  (forward-line 1))

(defun nico-notmuch-search-tag-read ()
  (interactive)
  (nico-notmuch-search-tag '("-unread")))

(defun nico-notmuch-search-tag-all-read ()
  (interactive)
  (if (y-or-n-p "Mark all threads as read? ")
      (progn
	(notmuch-search-tag-all '("-unread")))))

(defun nico-notmuch-search-tag-unread ()
  (interactive)
  (nico-notmuch-search-tag '("+unread")))

(defun nico-notmuch-show-tag-read ()
  (interactive)
  (notmuch-show-tag '("-unread")))

(defun nico-notmuch-show-tag-all-read ()
  (interactive)
  (if (y-or-n-p "Mark all threads as read? ")
      (progn
	(notmuch-show-tag-all '("-unread")))))

(defun nico-notmuch-show-tag-unread ()
  (interactive)
  (notmuch-show-tag '("+unread")))

(setq message-send-mail-function #'message-send-mail-with-sendmail
      sendmail-program "msmtpq"
      user-full-name "Nicolas Petton"
      starttls-use-gnutls t)

(defvar nico-notmuch-account-alist
  '(("nicolas@petton.fr"
     (user-mail-address "nicolas@petton.fr")
     (message-signature nil))
    ("Nicolas.Petton@wolterskluwer.com"
     (user-mail-address "Nicolas.Petton@wolterskluwer.com")
     (message-signature "Nicolas Petton
CTO
Företagsplatsen – a part of Wolters Kluwer Group
www.foretagslpatsen.se"))
    ("nicolas@foretagsplatsen.se"
     (user-mail-address "nicolas@foretagsplatsen.se")
     (message-signature "Nicolas Petton
CTO
Företagsplatsen – a part of Wolters Kluwer Group
www.foretagslpatsen.se"))
    ("president@lacantine-brest.net"
     (user-mail-address "president@lacantine-brest.net")
     (message-signature "Nicolas Petton
Président
La Cantine brestoise
09 72 58 83 13
president@lacantine-brest.net
AnDaolVras"))
    ("nico@emacs.world"
     (user-mail-address "nico@emacs.world")
     (message-signature nil))))

(setq notmuch-fcc-dirs '(("nicolas@petton.fr" . "petton/Sent -unread")
			 ("nicolas@foretagsplatsen.se" . "foretagsplatsen/Sent -unread")
			 ("Nicolas.Petton@wolterskluwer.com" . "wolterskluwer/Sent -unread")))

(defun nico-setup-mail-account (account)
  (let ((account-vars (cdr (assoc account nico-notmuch-account-alist))))
    (mapc (lambda (var)
	      (set (car var) (cadr var)))
	  account-vars)))

(defun nico-select-mail-account ()
  (completing-read (format "Compose with account: (%s) "
                           (mapconcat (lambda (var) (car var)) nico-notmuch-account-alist "/"))
                   (mapcar (lambda (var) (car var)) nico-notmuch-account-alist)
                   nil t nil nil (caar nico-notmuch-account-alist)))

(add-hook 'message-setup-hook #'nico-set-email-account-and-setup-message)

(defun nico-set-email-account ()
  "Set the account for composing a message."
  (interactive)
  (let* ((account
          (nico-select-mail-account)))
    (nico-setup-mail-account account)))

(defun nico-set-email-account-and-setup-message ()
  (nico-set-email-account)
  (message-insert-signature)
  (setq message-signature nil)
  (message-goto-from)
  (message-beginning-of-line)
  (delete-region (point) (point-at-eol))
  (insert (format "%s <%s>" user-full-name user-mail-address)))

(nico-setup-mail-account "nicolas@petton.fr")

;; opening attachments within emacs & xwidgets
(define-key notmuch-show-part-map "e" #'nico-notmuch-view-part-in-emacs)
(define-key notmuch-show-part-map "w" #'nico-notmuch-view-part-in-webkit)
(define-key notmuch-show-part-map "p" #'nico-notmuch-apply-git-patch)
(define-key notmuch-show-part-map "a" #'nico-notmuch-git-am-patch)
(define-key notmuch-show-part-map "d" #'nico-notmuch-show-ics-to-org-part)

(defun nico-mm-ics-to-org-part (handle &optional prompt)
  "Add message part HANDLE to org."
  (ignore prompt)
  (mm-with-unibyte-buffer
    (mm-insert-part handle)
    (mm-add-meta-html-tag handle)
    (require 'org-caldav)
    (let ((org-caldav-inbox "~/org/shared.org"))
      (org-caldav-import-ics-buffer-to-org))))

(defun nico-notmuch-show-ics-to-org-part ()
  "Save the .ics MIME part containing point to an org file."
  (interactive)
  (notmuch-show-apply-to-current-part-handle #'nico-mm-ics-to-org-part))

(defun nico-notmuch-view-part-in-emacs ()
  "View the MIME part containing point from within Emacs."
  (interactive)
  (notmuch-show-apply-to-current-part-handle #'nico-view-part-in-emacs))

(defun nico-notmuch-view-part-in-webkit ()
  "View the MIME part containing point from within an xwidget webkit buffer."
  (interactive)
  (notmuch-show-apply-to-current-part-handle #'nico-view-part-in-webkit))

(defun nico-notmuch-apply-git-patch ()
  "Apply the MIME part at point as a git patch using `git patch'."
  (interactive)
  (notmuch-show-apply-to-current-part-handle #'nico-notmuch-apply-git-patch-part))

(defun nico-notmuch-git-am-patch ()
  "Apply the MIME part at point as a git patch using `git am'."
  (interactive)
  (notmuch-show-apply-to-current-part-handle #'nico-notmuch-git-am-part))

(defun nico-view-part-in-emacs (handle)
  (interactive)
  (let* ((dir (make-temp-dir))
         (filename (or (mail-content-type-get
                       (mm-handle-disposition handle) 'filename)
                      (mail-content-type-get
                       (mm-handle-type handle) 'name)
                      "<file>"))
        (contents (mm-get-part handle))
        (file (expand-file-name filename dir))
        (buf (find-file-noselect file)))
    (with-current-buffer buf
      (insert contents)
      (save-buffer))
    (kill-buffer buf)
    (pop-to-buffer (find-file-noselect file))))

(defun nico-view-part-in-webkit (handle)
  (interactive)
  (let* ((dir (make-temp-dir))
         (filename (or (mail-content-type-get
                        (mm-handle-disposition handle) 'filename)
                       (mail-content-type-get
                        (mm-handle-type handle) 'name)
                       "<file>"))
         (contents (mm-get-part handle))
         (file (expand-file-name filename dir))
         (encoding 'raw-text)
         (buf (find-file-noselect file)))
    (with-current-buffer buf
      (insert contents)
      (set-buffer-file-coding-system encoding)
      (save-buffer))
    (kill-buffer buf)
    (xwidget-webkit-browse-url (format "file://%s" file))))

(defun nico-notmuch-apply-git-patch-part (handle)
  (let ((dir (read-directory-name "Git directory: ")))
    (mm-pipe-part handle (format "cd %s; git apply" (expand-file-name dir)))))

(defun nico-notmuch-git-am-part (handle)
  (let ((dir (read-directory-name "Git directory: ")))
    (mm-pipe-part handle (format "cd %s; git am" (expand-file-name dir)))))

(defun make-temp-dir ()
  (let* ((dirname (make-temp-name temporary-file-directory))
         (absolute-name (expand-file-name dirname temporary-file-directory)))
    (make-directory absolute-name)
    absolute-name))

;; Function to return first name of email recipient
;; Used by yasnippet
;; Based closely on
;; http://blog.binchen.org/posts/how-to-use-yasnippets-to-produce-email-templates-in-emacs.html
(defun nico-yas-get-first-name-from-to-field ()
  (let ((rlt "NAME") str rlt2)
    (save-excursion
      (goto-char (point-min))
      ;; first line in email could be some hidden line containing NO to field
      (setq str (buffer-substring-no-properties (point-min) (point-max))))
    ;; take name from TO field
    (when (string-match "^To: \"?\\([^ ,]+\\)" str)
      (setq rlt (match-string 1 str)))
    ;;get name in FROM field if available
    (when (string-match "^\\([^ ,\n]+\\).+writes:$" str)
      (progn (setq rlt2 (match-string 1 str))
             ;;prefer name in FROM field if TO field has "@"
             (when (string-match "@" rlt)
               (setq rlt rlt2))
             ))
    (message "rlt=%s" rlt)
    rlt))

;; (advice-add 'debbugs-gnu-select-report :override #'debbugs-notmuch-select-report)

(defun debbugs-notmuch-select-report (&rest _)
  (let* ((status (debbugs-gnu-current-status))
	 (id (cdr (assq 'id status)))
	 (merged (cdr (assq 'mergedwith status))))
    (setq merged (if (listp merged) merged (list merged)))
    (unless id
      (user-error "No bug report on the current line"))
    (let ((address (format "%s@debbugs.gnu.org" id))
          (merged-addresses (string-join (mapcar (lambda (id)
                                                   (format "%s@debbugs.gnu.org" id))
                                                 merged)
                                         " ")))
      (notmuch-search (format "%s %s" address merged-addresses)))))

;; Insert a stoic quote in the hello buffer
(defun my-stoic-quote (&rest _)
  "Insert a random quote from quotes.org."
  (let ((inhibit-read-only t)
	(quotes (with-current-buffer (find-file-noselect "~/org/quotes.org")
		  (split-string (buffer-string) "\n" t))))
    (newline)
    (save-excursion
      (goto-char (point-min))
      (insert (seq-random-elt quotes))
      (put-text-property (point-min) (point) 'face 'bold)
      (newline 3)
      (forward-char -3)
      (fill-paragraph))))

(add-hook 'notmuch-hello-mode-hook #'my-stoic-quote)
(add-hook 'notmuch-hello-refresh-hook #'my-stoic-quote)



(provide 'init-notmuch)
;;; init-notmuch ends here
