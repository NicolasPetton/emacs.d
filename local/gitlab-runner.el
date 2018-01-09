;;; gitlab-runner.el --- Convenience command to start gitlab-runner  -*- lexical-binding: t; -*-

;; Copyright (C) 2018  Nicolas Petton

;; Author: Nicolas Petton <nicolas@petton.fr>
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
;; along with this program.  If not, see <https://www.gnu.org/licenses/>.

;;; Commentary:

;;

;;; Code:

;;;###autoload
(defun gitlab-runner-run ()
  "Start the `gitlab-runner' process."
  (interactive)
  (let ((command "gitlab-runner run")
        (compilation-buffer-name-function
         (lambda (&rest _)
           (generate-new-buffer-name "*gitlab-runner*"))))
    (compilation-start command)))

(provide 'gitlab-runner)
;;; gitlab-runner.el ends here
