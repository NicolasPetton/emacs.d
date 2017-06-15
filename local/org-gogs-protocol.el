;;; org-gogs-protocol.el --- Gogs link protocol in orgmode  -*- lexical-binding: t; -*-

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

(defcustom org-gogs-protocol-base-url "https://example.net/gogs"
  "Base url for Gogs links."
  :group 'org-gogs-protocol
  :type 'string)

(defun org-gogs-protocol-open (link)
  "Follow a GOGS link specified by LINK."
  (browse-url (format "%s/%s" org-gogs-protocol-base-url link)))


;; Install the link type
(org-add-link-type "gogs" 'org-gogs-protocol-open)

(provide 'org-gogs-protocol)
;;; org-gogs-protocol.el ends here
