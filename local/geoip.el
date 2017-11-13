;;; geoip.el --- Locate IP addresses by querying ipinfo.io  -*- lexical-binding: t; -*-

;; Copyright (C) 2017  Nicolas Petton

;; Author: Nicolas Petton <nicolas@petton.fr>
;; Keywords: tools

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

(require 'json)

(defun geoip (ip)
  "Lookup the location of IP."
  (interactive "sIp address: ")
  (let ((contents (shell-command-to-string (format "curl -s %s/%s" "ipinfo.io" ip))))
    (switch-to-buffer (get-buffer-create "*geoip*"))
    (erase-buffer)
    (json-mode)
    (insert contents)
    (json-pretty-print-buffer)))

(provide 'geoip)
;;; geoip.el ends here
