;;; fetch-email.el --- Fetching email from Emacs     -*- lexical-binding: t; -*-

;; Copyright (C) 2015  Nicolas Petton

;; Author: Nicolas Petton <nicolas@petton.fr>
;; Keywords: convenience, email, imap

;; This program is free software; you can redistribute it and/or modify
;; it under the terms of the GNU General Public License as published by
;; the Free Software Foundation, either version 3 of the License, or
;; (at your option) any later version.

;; This program is distributed in the hope that it will be useful,
;; but WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
;; GNU General Public License for more details.

;; You should have received a copy of the GNU General Public License
;; along with this program.  If not, see <http://www.gnu.org/licenses/>.

;;; Commentary:

;;; Code:
(require 'comint)

(defgroup fetch-email nil
  "Fetch email from Emacs."
  :group 'fetch-email)

(defcustom fetch-email-buffer-name "*Fetch Email*"
  "Name of the buffer used to fetch email."
  :group 'fetch-email
  :type 'string)

(defcustom fetch-email-command "offlineimap"
  "Command to run to fetch email."
  :group 'fetch-email
  :type 'string)

(defcustom fetch-email-autorefresh nil
  "If non-nil, `fetch-email-command' is rerun automatically."
  :group 'fetch-email
  :type 'boolean)

(defcustom fetch-email-interval 300
  "Interval in seconds between in fetch."
  :group 'fetch-email
  :type 'integer)

(defvar fetch-email-post-command-hook nil
  "Hook run after each run of `fetch-email-command'.")

(defvar fetch-email-timer nil
  "Timer used to repeat fetching email.")

;;;###autoload
(defun fetch-email (&optional arg)
  "Fetch email in the background.
When called with a prefix argument ARG, switch to the command
buffer."
  (interactive "P")
  (let ((buf (get-buffer-create fetch-email-buffer-name)))
    (when arg
      (pop-to-buffer buf))
    (unless (get-buffer-process buf)
      (fetch-email--start buf))))

(defun fetch-email--start (buf)
  "Start the process of fetching email in the background.
The output is displayed in BUF."
  (let ((proc (start-process-shell-command "Fetch email"
                                           buf
                                           fetch-email-command)))
    (with-current-buffer buf
      (erase-buffer))
    (set-process-sentinel proc #'fetch-email--sentinel)))

(defun fetch-email--sentinel (proc state)
  "Monitor PROC state STATE and run hooks."
  (when (eq 'exit
            (process-status proc))
    (run-hook-with-args 'fetch-email-post-command-hook state)
    (fetch-email--repeat-maybe)))

(defun fetch-email--repeat-maybe ()
  "After the process exits, maybe rerun it after a delay."
  (when fetch-email-timer
    (cancel-timer fetch-email-timer))
  (when fetch-email-autorefresh
    (setq fetch-email-timer (run-with-timer fetch-email-interval
                                            nil
                                            #'fetch-email))))

(provide 'fetch-email)
;;; fetch-email.el ends here
