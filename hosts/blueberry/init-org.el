(require 'org)
(require 'org-element)
(require 'org-pomodoro)
(require 'org-contacts)
(require 'org-jira-protocol)
(require 'org-gogs-protocol)
(require 'org-sip-protocol)
(require 'org-debbugs-protocol)
(require 'org-bullets)
(require 'ob-js)
(require 'ox-md)
(require 'avy)
(require 'ivy)
(require 'org-gnome)
(require 's)

;; (global-org-gnome-minor-mode 1)
;; (add-hook 'org-mode-hook #'org-indent-mode)

;; preserve the indentation inside of source blocks
(setq org-src-preserve-indentation t)

;; Allow's electric-pair-mode to surround things with = and ~ in org-mode
(modify-syntax-entry ?~ "(~" org-mode-syntax-table)
(modify-syntax-entry ?= "(=" org-mode-syntax-table)

(add-to-list 'auto-mode-alist '("\\.org$" . org-mode))

(define-key global-map "\C-cl" #'org-store-link)
(define-key global-map "\C-ca" #'org-agenda)
(define-key global-map "\C-cb" #'org-iswitchb)
(define-key global-map "\C-cc" #'org-capture)
(define-key global-map "\C-cp" #'org-pomodoro)
(define-key org-mode-map (kbd "C-c C-j") #'avy-goto-word-1)
(define-key org-mode-map (kbd "C-c M-m") #'org-contacts-view-send-email)
(define-key org-agenda-mode-map (kbd "C-c C-j") #'avy-goto-word-1)
(define-key org-mode-map (kbd "M-i") #'nico-org-imenu)

(defun nico-org-imenu (&optional arg)
  "Like `counsel-imenu'.
With a prefix argument ARG, narrow the
buffer to the matched subtree."
  (interactive "P")
  (counsel-imenu)
  (when arg
    (org-narrow-to-subtree)))

(org-babel-do-load-languages
 'org-babel-load-languages
 '((ditaa . t)
   (js . t)
   (emacs-lisp . t)))

;; Fontify org-mode code blocks
(setq org-src-fontify-natively t)

(defvar nico/org-agenda-file "~/org/agenda.org")
(setq org-default-notes-file "~/org/inbox.org")

(setq org-agenda-files `(,org-default-notes-file
                         ,nico/org-agenda-file
                         "~/org/gtd.org"
                         "~/org/tickler.org"))

(setq org-refile-targets `(("~/org/gtd.org" :maxlevel . 3)
                           ("~/org/someday.org" :level . 1)
                           (,nico/org-agenda-file :level . 1)
                           ("~/org/tickler.org" :maxlevel . 2)
                           ("~/org/inbox.org" :maxlevel . 1)))

(defun nico/find-notes-file ()
  (interactive)
  (find-file org-default-notes-file))

;; Export TODO items in iCal too
(setq org-icalendar-include-todo t)

;; org-capture
(setq org-capture-templates '())
(add-to-list 'org-capture-templates
	     '("t" "Todo [inbox]" entry (file+headline org-default-notes-file "Tasks")
	       "* TODO %i%?"))
(add-to-list 'org-capture-templates
	     '("l" "Todo (with link) [inbox]" entry (file+headline org-default-notes-file "Tasks")
	       "* TODO %a"))
(add-to-list 'org-capture-templates
             '("p" "Appointment" entry (file+headline nico/org-agenda-file "Appointment")
	       "* APPT %i%? \n %^T"))
(add-to-list 'org-capture-templates
	     '("T" "Tickler" entry (file+headline "~/org/tickler.org" "Tickler")
               "* %i%? \n %^t"))
(add-to-list 'org-capture-templates
             '("c" "Contacts" entry (file "~/org/contacts.org")
               "* %(org-contacts-template-name)
:PROPERTIES:
:EMAIL: %(org-contacts-template-email)
:END:"))

(defvar french-holiday
  '((holiday-fixed 1 1 "Jour de l'an")
    (holiday-fixed 5 1 "Fête du travail")
    (holiday-fixed 5 8 "Victoire 45")
    (holiday-fixed 7 14 "Fête nationale")
    (holiday-fixed 8 15 "Assomption")
    (holiday-fixed 11 1 "Toussaint")
    (holiday-fixed 11 11 "Armistice 18")
    (holiday-fixed 12 25 "Noël")
    (holiday-easter-etc 1 "Lundi de Pâques")
    (holiday-easter-etc 39 "Ascension")
    (holiday-easter-etc 50 "Lundi de Pentecôte")))

(setq calendar-date-style 'european
      calendar-holidays french-holiday
      calendar-mark-holidays-flag t)

(defun nico/org-archive-done-tasks ()
  "Archive all DONE entries"
  (interactive)
  (org-map-entries
   (lambda ()
     (org-archive-subtree)
     (setq org-map-continue-from (outline-previous-heading)))
   "/DONE" 'file))

;; Custom agenda function, see customized 'org-agenda-custom-commands.
;; Open the agenda in org-agenda-log-mode, with the archive file, and
;; for the previous week. To work well, 'org-log-done should be set to
;; 't, to ensure that everything is in the agenda.
(defun nico/org-agenda-log (arg)
  (org-agenda-archives-mode)
  (org-agenda-list arg)
  (org-agenda-log-mode)
  (org-agenda-earlier 1))

(defun org-agenda-skip-all-siblings-but-first ()
  (let (should-skip-entry)
    (unless (org-current-is-todo)
      (setq should-skip-entry t))
    (save-excursion
      (while (and (not should-skip-entry) (org-goto-sibling t))
        (when (org-current-is-todo)
          (setq should-skip-entry t))))
    (when should-skip-entry
      (or (outline-next-heading)
          (goto-char (point-max))))))

(defun org-current-is-todo ()
  (string= "TODO" (org-get-todo-state)))



(defun org-agenda-format-parent (n)
  ;; (s-truncate n (org-format-outline-path (org-get-outline-path)))
  (save-excursion
    (save-restriction
      (widen)
      (org-up-heading-safe)
      (s-truncate n (org-get-heading t t)))))

(add-hook 'before-save-hook
          #'nico/org-align-all-tags)

(defun nico/org-align-all-tags ()
  (interactive)
  (when (eq major-mode 'org-mode)
    (org-align-all-tags)))

(defun nico/org-update-parent-cookie ()
  (when (eq major-mode 'org-mode)
    (save-excursion
      (ignore-errors
        (org-back-to-heading)
        (org-update-parent-todo-statistics)))))

(defadvice org-kill-line (after fix-cookies activate)
  (nico/org-update-parent-cookie))

(defadvice kill-whole-line (after fix-cookies activate)
  (nico/org-update-parent-cookie))

(defadvice org-archive-subtree (after fix-cookies activate)
  (nico/org-update-parent-cookie))

;; (add-hook 'after-save-hook
;;           #'nico/org-export-buffer)

(defun nico/org-export-buffer ()
  (let* ((file-name (buffer-file-name))
         (file-exists (and file-name
                           (file-exists-p file-name))))
    (when (and file-name (eq major-mode 'org-mode))
      (org-export-to-file 'html (format "%s.html" (file-name-sans-extension file-name))))))

(org-babel-do-load-languages
 'org-babel-load-languages
 '((shell . t)))

(provide 'init-org)
