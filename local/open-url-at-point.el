(defun open-url-at-point (&optional arg)
  "Browse the url at point.
Open the url in a www browser or, when called with a prefix
argument, in Emacs."
  (interactive "P")
  (let ((url (browse-url-url-at-point)))
   (if arg
       (browse-url-emacs url)
     (browse-url url))))

(provide 'open-url-at-point)

