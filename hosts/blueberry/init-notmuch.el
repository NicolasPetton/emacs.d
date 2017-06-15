(add-to-list 'load-path (expand-file-name "lib/notmuch/emacs" user-emacs-directory))

(require 'notmuch)
(require 'seq)
(require 'org-notmuch)
(require 'fetch-email)
(require 'alert)
(require 'yasnippet)

;; For existing org links, load mu4e anyway

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
(add-hook 'message-setup-hook #'yas-minor-mode-on)

(defun nico-maybe-sign-email ()
  "Sign the current buffer's email unless the message is sent to
  one of `nico-pgp-sign-excluded-emails'."
  (let ((email (message-fetch-field "to")))
    (unless (and email
                 (seq-some (lambda (regex)
                               (string-match regex email))
                             nico-pgp-sign-excluded-emails))
      (mml-secure-sign-pgpmime))))

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
     (user-mail-address "nicolas@petton.fr"))
    ("nicolas@foretagsplatsen.se"
     (user-mail-address "nicolas@foretagsplatsen.se"))))

(defun nico-setup-mail-account (account)
  (let ((account-vars (cdr (assoc account nico-notmuch-account-alist))))
    (mapc #'(lambda (var)
	      (set (car var) (cadr var)))
	  account-vars)))

(defun nico-select-mail-account ()
  (completing-read (format "Compose with account: (%s) "
                           (mapconcat #'(lambda (var) (car var)) nico-notmuch-account-alist "/"))
                   (mapcar #'(lambda (var) (car var)) nico-notmuch-account-alist)
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
  (message-goto-from)
  (message-beginning-of-line)
  (delete-region (point) (point-at-eol))
  (insert (format "%s <%s>" user-full-name user-mail-address)))

(nico-setup-mail-account "nicolas@petton.fr")

(setq smtpmail-debug-info t)

;; notifications
(defvar nico-notmuch-refresh-count 0)

(defun nico-notmuch-refresh-status-message ()
  (let* ((new-count
          (string-to-number
           (car (process-lines notmuch-command "count"))))
         (diff-count (- new-count nico-notmuch-refresh-count)))
    (if (and (not (zerop nico-notmuch-refresh-count))
             (> diff-count 0))
        (alert (format "You have %s messages."
                       (notmuch-hello-nice-number diff-count))
               :title "New messages"
               :icon "/usr/share/icons/gnome/32x32/status/mail-unread.png"))
    (setq nico-notmuch-refresh-count new-count)))

;; (add-hook 'notmuch-hello-refresh-hook #'nico-notmuch-refresh-status-message)

;; opening attachments within emacs & xwidgets
(define-key notmuch-show-part-map "e" #'nico-notmuch-view-part-in-emacs)
(define-key notmuch-show-part-map "w" #'nico-notmuch-view-part-in-webkit)
(define-key notmuch-show-part-map "p" #'nico-notmuch-apply-git-patch)
(define-key notmuch-show-part-map "a" #'nico-notmuch-git-am-patch)

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

(provide 'init-notmuch)
;;; init-notmuch ends here
