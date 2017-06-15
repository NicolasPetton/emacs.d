;;; org-sip-protocol.el --- Ekiga SIP protocol in orgmode  -*- lexical-binding: t; -*-

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

(defcustom org-sip-domain "sip3.ovh.fr"
  "SIP domain.")

(defcustom org-sip-executable "linphone"
  "SIP domain.")

(defun org-sip-protocol-open (uri)
  "Call URI."
  (start-process "sip call" "*SIP-call*" org-sip-executable "-c" (format "sip:%s@%s" uri org-sip-domain)))

;; Install the link type
(org-add-link-type "sip" 'org-sip-protocol-open)

(provide 'org-sip-protocol)
;;; org-sip-protocol.el ends here
