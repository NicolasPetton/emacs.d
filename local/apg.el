;;; apg.el --- Insert random passwords with apg      -*- lexical-binding: t; -*-

;; Copyright (C) 2017  Nicolas Petton

;; Author: Nicolas Petton(defun apg () <nico@strawberry>
;; Keywords: convenience

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

;; 

;;; Code:

(defun apg ()
  "Insert a random password at point. Requires apg in the $PATH"
  (interactive)
  (let ((password))
    (save-excursion
      (let ((buffer "*passwords*"))
        (shell-command "apg -m 15" buffer)
        (switch-to-buffer buffer)
        (beginning-of-line)
        (let ((beg (point))
              (end (progn (end-of-line) (point))))
          (setq password (buffer-substring beg end)))
        (kill-buffer buffer)))
    (insert password)))

(provide 'apg)
;;; apg.el ends here



