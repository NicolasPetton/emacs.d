;;; Compiled snippets and support files for `org-mode'
;;; Snippet definitions:
;;;
(yas-define-snippets 'org-mode
		     '(("p" "** $1\n:PROPERTIES:\n:ORDERED:  t\n:END:\n\n- Why? \n\n- Outcome: \n\n*** TODO $0" "project" nil nil nil "/home/nico/.emacs.d/etc/yasnippet/snippets/org-mode/project.yasnippet" nil nil)
		       ("med" "* <`(format-time-string \"%Y-%m-%d %a\")`>\n** What did I do wrong?\n$1\n** What did I do right?\n\n** What duty’s left undone?" "meditation" nil nil nil "/home/nico/.emacs.d/etc/yasnippet/snippets/org-mode/meditation.yasnippet" nil nil)
		       ("html" "#+BEGIN_HTML\n$1\n#+END_HTML" "html block" nil nil nil "/home/nico/.emacs.d/etc/yasnippet/snippets/org-mode/html.yasnippet" nil nil)))


;;; Do not edit! File generated at Mon Jan  7 17:38:42 2019
