;;; org-debbugs-protocol.el --- Debbugs link protocol in orgmode  -*- lexical-binding: t; -*-

;; Copyright (C) 2016  Nicolas Petton

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
;; along with this program.  If not, see <http://www.gnu.org/licenses/>.

;;; Commentary:

;;

;;; Code:

(require 'org)

(defun org-debbugs-protocol-open (issue)
  "Follow a DEBBUGS link specified by ISSUE."
  (debbugs-gnu-bugs (string-to-number issue)))

;; Install the link type
(org-add-link-type "debbugs" 'org-debbugs-protocol-open)

(provide 'org-debbugs-protocol)
;;; org-debbugs-protocol.el ends here
