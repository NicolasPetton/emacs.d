(defun open-url-at-point (&optional arg)
  "Browse the url at point.
Open the url in a www browser or, when called with a prefix
argument, in Emacs."
  (interactive "P")
  (let ((url (browse-url-url-at-point)))
   (if arg
       (browse-url-emacs url)
     (browse-url url))))

(defun youtube-dl-at-point ()
  (interactive)
  (let ((url (browse-url-url-at-point))
	(default-directory (expand-file-name "~/Downloads")))
    (async-shell-command (format "youtube-dl %s" url))))

(provide 'open-url-at-point)

