;;; js2-unused.el --- Find unused definitions in JS2 buffers  -*- lexical-binding: t; -*-

;; Copyright (C) 2017  Nicolas Petton

;; Author: Nicolas Petton <nicolas@petton.fr>
;; Keywords: javascript, tools

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

(require 'seq)
(require 'xref-js2)
(require 'subr-x)

(defvar js2-unused-definitions nil)

(defun js2-unused-functions ()
  (interactive)
  (js2-mode-wait-for-parse
   (lambda ()
     (js2-unused--find-definitions)
     (let ((unused (seq-filter (lambda (name)
                                 (null (xref-js2--find-references
                                        (js2-unused--local-name name))))
                               js2-unused-definitions)))
       (apply #'message (if unused
                            `("Unused functions in %s: %s "
                              ,(file-name-nondirectory buffer-file-name)
                              ,(mapconcat #'identity unused " "))
                          '("No unused function found")))))))

(defun js2-unused--find-definitions ()
  (setq js2-unused-definitions nil)
  (js2-visit-ast js2-mode-ast
                 #'js2-unused-visitor))

(defun js2-unused-visitor (node end-p)
  (unless end-p
    (cond
     ((and (js2-assign-node-p node)
           (js2-function-node-p (js2-assign-node-right node)))
      (push (js2-node-string (js2-assign-node-left node)) js2-unused-definitions))
     ((js2-function-node-p node)
      (if-let ((name (js2-function-name node)))
          (push name js2-unused-definitions))))
    t))

(defun js2-unused--local-name (name)
  (save-match-data
    (if (string-match "\\.\\([^.]+\\)$" name)
        (match-string 1 name)
      name)))

(provide 'js2-unused)
;;; js2-unused.el ends here
