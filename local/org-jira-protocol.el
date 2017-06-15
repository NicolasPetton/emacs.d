;;; org-jira-protocol.el --- JIRA link protocol in orgmode  -*- lexical-binding: t; -*-

;; Copyright (C) 2016  Nicolas Petton

;; Author: Nicolas Petton <nicolas@petton.fr>
;; Keywords: convenience
;; Version: 1.0

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

(defcustom org-jira-protocol-base-url "https://foretagsplatsen.atlassian.net"
  "Base url for JIRA links."
  :group 'org-jira-protocol
  :type 'string)

(defun org-jira-protocol-open (issue)
  "Follow a JIRA link specified by ISSUE."
  (browse-url (format "%s/browse/%s" org-jira-protocol-base-url issue)))


;; Install the link type
(org-add-link-type "jira" 'org-jira-protocol-open)

(provide 'org-jira-protocol)
;;; org-jira-protocol.el ends here
