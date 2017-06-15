;;; init.el --- user-init-file                    -*- lexical-binding: t -*-
;;; Early birds
(progn ;     startup
  (defvar before-user-init-time (current-time)
    "Value of `current-time' when Emacs begins loading `user-init-file'.")
  (message "Loading Emacs...done (%.3fs)"
           (float-time (time-subtract before-user-init-time
                                      before-init-time)))
  (setq user-init-file (or load-file-name buffer-file-name))
  (setq user-emacs-directory (file-name-directory user-init-file))
  (message "Loading %s..." user-init-file)
  (setq package-enable-at-startup nil)
  (setq inhibit-startup-buffer-menu t)
  (setq inhibit-startup-screen t)
  (setq inhibit-startup-echo-area-message "locutus")
  (setq initial-buffer-choice t)
  (setq initial-scratch-message "")
  (setq load-prefer-newer t)
  (defalias 'yes-or-no-p 'y-or-n-p)
  (scroll-bar-mode 0)
  (tool-bar-mode 0)
  (menu-bar-mode 0)
  (delete-selection-mode 1)
  (column-number-mode 1))

(progn ;    `borg'
  (add-to-list 'load-path (expand-file-name "lib/borg" user-emacs-directory))
  (require  'borg)
  (borg-initialize))

(progn ;    `use-package'
  (require  'use-package)
  (setq use-package-verbose t))

(use-package auto-compile
  :demand t
  :config
  (auto-compile-on-load-mode)
  (auto-compile-on-save-mode)
  (setq auto-compile-display-buffer               nil)
  (setq auto-compile-mode-line-counter            t)
  (setq auto-compile-source-recreate-deletes-dest t)
  (setq auto-compile-toggle-deletes-nonlib-dest   t)
  (setq auto-compile-update-autoloads             t)
  (add-hook 'auto-compile-inhibit-compile-hook
            'auto-compile-inhibit-compile-detached-git-head))

(use-package epkg
  :defer t
  :init (setq epkg-repository
              (expand-file-name "var/epkgs/" user-emacs-directory)))

(use-package custom
  :config
  (setq custom-file (expand-file-name "custom.el" user-emacs-directory))
  (when (file-exists-p custom-file)
    (load custom-file)))

(use-package server
  :config (or (server-running-p) (server-mode)))

(progn ;     startup
  (message "Loading early birds...done (%.3fs)"
           (float-time (time-subtract (current-time)
                                      before-user-init-time))))

;;; Long tail

(use-package abbrev
  :diminish ""
  :config
  (setq save-abbrevs 'silently)
  (setq-default abbrev-mode t))

(use-package anzu
  :config (global-anzu-mode)
  :bind (([remap query-replace] . anzu-query-replace)
         ([remap query-replace-regexp] . anzu-query-replace-regexp)
         :map isearch-mode-map
         ([remap isearch-query-replace] . anzu-isearch-query-replace)
         ([remap isearch-query-replace-regexp] . anzu-isearch-query-replace-regexp)))

(use-package apg)

(use-package auth-password-store
  :config (auth-pass-enable))

(use-package autorevert
  :config
  (global-auto-revert-mode 1)

  ;; auto-update dired buffers
  (setq global-auto-revert-non-file-buffers t
        auto-revert-verbose nil))

(use-package avy
  :bind ("C-c C-j" . avy-goto-word-1))

(use-package beginend
  :config
  (beginend-global-mode)
  (diminish 'beginend-global-mode))

(use-package browse-url
  :config
  (setq browse-url-generic-program (executable-find "firefox")))

(use-package buffer-watcher)

(use-package clojure-mode
  :mode "\\.clj\\'"
  :config
  (use-package cider
  :config
  (defun setup-clojure-buffer ()
    (eldoc-mode)
    (clj-refactor-mode 1)
    (paredit-mode 1)
    (setq indent-tabs-mode nil))

  (add-hook 'clojure-mode-hook #'setup-clojure-buffer)
  (add-hook 'cider-mode-hook #'cider-turn-on-eldoc-mode)

  (setq cider-repl-use-clojure-font-lock t
        cider-repl-use-pretty-printing t
        cider-repl-wrap-history t
        cider-repl-history-size 3000))

(use-package clj-refactor
  :config
  (cljr-add-keybindings-with-prefix "C-c C-r")))

(use-package company
  :diminish ""
  :config
  (add-hook 'prog-mode-hook 'company-mode)
  (setq company-idle-delay 0.5)
  (setq company-tooltip-limit 10)
  (setq company-minimum-prefix-length 2)
  (setq company-tooltip-flip-when-above t))

(use-package company-dabbrev
  :config
  (setq company-dabbrev-ignore-case t)
  (setq company-dabbrev-downcase nil))

(use-package counsel
  :config (global-set-key (kbd "M-x") #'counsel-M-x)
  (global-set-key (kbd "C-x C-f") #'counsel-find-file)
  (global-set-key (kbd "M-i") #'counsel-imenu)
  (global-set-key (kbd "M-y") #'counsel-yank-pop))

(use-package counsel-projectile
  :config (counsel-projectile-on))

(use-package dabbrev
  :bind (("S-SPC" . dabbrev-expand)))

(use-package dash
  :config (dash-enable-font-lock))

(use-package diff-hl
  :config
  (setq diff-hl-draw-borders nil)
  (global-diff-hl-mode)
  (add-hook 'magit-post-refresh-hook 'diff-hl-magit-post-refresh t))

(use-package diminish
  :config
  (diminish 'auto-revert-mode)
  (diminish 'outline-minor-mode))

(use-package dired
  :defer t
  :bind (:map dired-mode-map
              ("M-s" . find-name-dired)
              ("C-k" . dired-kill-subdir))
  :config
  (add-hook 'dired-mode-hook #'dired-hide-details-mode)
  (setq dired-listing-switches "-alh")
  (setq dired-dwim-target t)
  (put 'dired-find-alternate-file 'disabled nil))

(use-package dired-x
  :config
  (add-hook 'dired-mode-hook #'dired-omit-mode)
  (setq dired-omit-files "^\\...+$"))

(use-package drag-stuff
  :config
  (drag-stuff-global-mode t)
  (drag-stuff-define-keys)
  (add-to-list 'drag-stuff-except-modes 'org-mode)
  (add-to-list 'drag-stuff-except-modes 'rebase-mode)
  (add-to-list 'drag-stuff-except-modes 'emacs-lisp-mode))

(use-package duplicate-thing
  :bind ("M-D" . duplicate-thing))

(use-package ediff
  :config
  ;; window positioning & frame setup
  (setq ediff-window-setup-function 'ediff-setup-windows-plain
        ediff-split-window-function 'split-window-horizontally))

(use-package eldoc
  :config (global-eldoc-mode))

(use-package elec-pair
  :config
  (electric-pair-mode t))

(use-package electric
  :config (electric-indent-mode t))

(use-package erc
  :config
  (setq erc-email-userid "NicolasPetton"
        erc-autojoin-channels-alist '(("freenode.net" . ("#emacs")))))

(use-package eshell
  :config
  (use-package shell-switcher
    :config
    (setq shell-switcher-mode t))
  
  (setq eshell-banner-message (concat " Welcome to Eshell, "
                                      user-login-name
                                      "!\n       _\n     _|_|_\n     (o o)\n ooO--(_)--Ooo-\n\n Oh, Nice hat.\n\n"))
  (eval-after-load 'esh-opt
    '(progn
       (require 'em-prompt)
       (require 'em-term)
       (require 'em-cmpl)
       (setenv "PAGER" "cat")
       (add-hook 'eshell-mode-hook ;; for some reason this needs to be a hook
                 (lambda ()
                   (company-mode)
                   (define-key eshell-mode-map "\C-a" #'eshell-bol)
                   (define-key eshell-mode-map (kbd "M-r") #'nico-eshell-hist-input)))

       (add-to-list 'eshell-visual-commands "ssh")
       (add-to-list 'eshell-visual-commands "htop")
       (add-to-list 'eshell-visual-commands "top")
       (add-to-list 'eshell-visual-commands "tail")
       (add-to-list 'eshell-visual-commands "vim")
       (add-to-list 'eshell-visual-commands "bower")
       (add-to-list 'eshell-visual-commands "npm")

       (add-to-list 'eshell-command-completions-alist
                    '("gunzip" "gz\\'"))
       (add-to-list 'eshell-command-completions-alist
                    '("tar" "\\(\\.tar|\\.tgz\\|\\.tar\\.gz\\)\\'"))))

  (when (not (functionp 'eshell/rgrep))
    (defun eshell/rgrep (&rest args)
      "Use Emacs grep facility instead of calling external grep."
      (eshell-grep "rgrep" args t))))

(use-package exec-path-from-shell
  :config (exec-path-from-shell-initialize))

(use-package expand-region
  :bind (("C-=" . er/expand-region)))

(use-package files
  :config
  (setq delete-old-versions t
        kept-new-versions 6
        kept-old-versions 2
        version-control t
        nico/backup-directory "~/.tmp")
  (setq backup-directory-alist
        `((".*" . ,nico/backup-directory)))
  (setq auto-save-file-name-transforms
        `((".*" ,nico/backup-directory t)))
  (setq create-lockfiles nil))

(use-package flycheck
  :config (add-hook 'prog-mode-hook #'flycheck-mode))

(use-package flyspell
  :bind (:map flyspell-mode-map
              ("C-;" . nil))
  :config
  (add-hook 'prog-mode-hook #'flyspell-prog-mode)
  (dolist (mode-hook '(text-mode-hook LaTeX-mode-hook))
    (add-hook mode-hook #'flyspell-mode)))

(use-package gnus-dired
  :bind (:map gnus-dired-mode-map
              ("C-x C-a" . gnus-dired-attach))
  :config (add-hook 'dired-mode-hook #'turn-on-gnus-dired-mode))

(use-package help
  :defer t
  :config (temp-buffer-resize-mode))

(use-package ibuffer
  :bind (("C-x C-b" . ibuffer)))

(use-package ispell
  :config
  (defun ispell-word-then-abbrev (p)
    "Call `ispell-word', then create an abbrev for it.
With prefix P, create local abbrev. Otherwise it will
be global."
    (interactive "P")
    (let (bef aft)
      (save-excursion
        (while (progn
                 (backward-word)
                 (and (setq bef (thing-at-point 'word))
                      (not (ispell-word nil 'quiet)))))
        (setq aft (thing-at-point 'word)))
      (when (and aft bef (not (equal aft bef)))
        (setq aft (downcase aft))
        (setq bef (downcase bef))
        (define-abbrev
          (if p local-abbrev-table global-abbrev-table)
          bef aft)
        (write-abbrev-file)
        (message "\"%s\" now expands to \"%s\" %sally"
                 bef aft (if p "loc" "glob")))))
  
  (define-key ctl-x-map "\C-i" #'ispell-word-then-abbrev))

(use-package ivy
  :diminish ""
  :config
  (ivy-mode 1)
  (setq ivy-use-virtual-buffers t))

(progn ;    `isearch'
  (setq isearch-allow-scroll t))

(use-package js2-mode
  :mode "\\.js\\'"
  :config
  (defun js2-show-node-at-point ()
    (interactive)
    (js2-show-node (js2-node-at-point)))

  (defun js2-show-node-parent-at-point ()
    (interactive)
    (js2-show-node (js2-node-parent (js2-node-at-point))))

  (defun js2-show-node (node)
    (let* ((buf (get-buffer-create "*js2-node-at-point*"))
           (node-contents (buffer-substring (js2-node-abs-pos node) (js2-node-abs-end node))))
      (with-current-buffer
          (set-buffer buf)
        (delete-region (point-min) (point-max))
        (insert node-contents))))
  
  (use-package emacs-js)

  (use-package klassified
    :config (add-hook 'js2-mode-hook #'klassified-interaction-js-mode))
  (use-package ftgp))

(use-package less-css-mode)

(use-package lisp-mode
  :config
  (add-hook 'emacs-lisp-mode-hook 'outline-minor-mode)
  (defun indent-spaces-mode ()
    (setq indent-tabs-mode nil))
  (add-hook 'lisp-interaction-mode-hook #'indent-spaces-mode))

(use-package magit
  :defer t
  :bind (("C-x g"   . magit-status)
         ("C-x M-g" . magit-dispatch-popup)
         :map magit-mode-map
         ("C" . magit-commit-add-log))
  :config
  (magit-add-section-hook 'magit-status-sections-hook
                          'magit-insert-modules-unpulled-from-upstream
                          'magit-insert-unpulled-from-upstream)
  (magit-add-section-hook 'magit-status-sections-hook
                          'magit-insert-modules-unpulled-from-pushremote
                          'magit-insert-unpulled-from-upstream)
  (magit-add-section-hook 'magit-status-sections-hook
                          'magit-insert-modules-unpushed-to-upstream
                          'magit-insert-unpulled-from-upstream)
  (magit-add-section-hook 'magit-status-sections-hook
                          'magit-insert-modules-unpushed-to-pushremote
                          'magit-insert-unpulled-from-upstream)
  (magit-add-section-hook 'magit-status-sections-hook
                          'magit-insert-submodules
                          'magit-insert-unpulled-from-upstream)
  (setq magit-default-tracking-name-function #'magit-default-tracking-name-branch-only))

(use-package man
  :defer t
  :config (setq Man-width 80))

(use-package multiple-cursors
  :bind (("M-RET" . mc/edit-lines)
         ("C-<" . mc/mark-previous-like-this)
         ("C->" . mc/mark-next-like-this)
         ("C-M-<" . mc/unmark-next-like-this)
         ("C-M->" . mc/unmark-previous-like-this)
         ("C-c C-<" . mc/mark-all-like-this)))

(use-package org)

(use-package paredit
  :demand t
  :diminish ""
  :bind (:map paredit-mode-map
              ("M-s" . nil))
  :config
  (add-hook 'emacs-lisp-mode-hook #'paredit-mode))

(use-package paren
  :config (show-paren-mode))

(use-package pass
  :mode ("org/reference/password-store/" . pass-view-mode)
  :bind ("C-x p" . pass))

(use-package projectile
  :diminish ""
  :config (projectile-mode))

(use-package prog-mode
  :config (global-prettify-symbols-mode)
  (defun indicate-buffer-boundaries-left ()
    (setq indicate-buffer-boundaries 'left))
  (add-hook 'prog-mode-hook #'indicate-buffer-boundaries-left))

(use-package rainbow-mode
  :config
  (add-hook 'css-mode-hook 'rainbow-mode)
  (add-hook 'less-mode-hook 'rainbow-mode))

(use-package recentf
  :demand t
  :config (add-to-list 'recentf-exclude "^/\\(?:ssh\\|su\\|sudo\\)?:"))

(use-package restclient
  :config
  (use-package company-restclient
    :config
    (add-to-list 'company-backend 'company-restclient)
    (add-hook 'restclient-mode-hook #'company-mode-on)))

(use-package savehist
  :config (savehist-mode))

(use-package saveplace
  :config (save-place-mode))

(use-package simple
  :config (column-number-mode))

(use-package slime
  :config
  (setq inferior-lisp-program "/usr/bin/sbcl")
  (slime-setup))

(use-package sudo-edit)

(use-package tabify
  :config
  (defun tabify-buffer ()
    (interactive)
    (tabify (point-min) (point-max)))

  (defun untabify-buffer ()
    (interactive)
    (untabify (point-min) (point-max))))

(progn ;    `text-mode'
  (add-hook 'text-mode-hook #'indicate-buffer-boundaries-left))

(use-package tramp
  :defer t
  :config
  (add-to-list 'tramp-default-proxies-alist '(nil "\\`root\\'" "/ssh:%h:"))
  (add-to-list 'tramp-default-proxies-alist '("localhost" nil nil))
  (add-to-list 'tramp-default-proxies-alist
               (list (regexp-quote (system-name)) nil nil)))

(use-package tunnel)

(use-package uniquify
  :config
  (setq uniquify-buffer-name-style 'forward))

(use-package web-mode
  :defer t
  :config
  (add-to-list 'auto-mode-alist '("\\.html\\'" . web-mode))
  (add-to-list 'auto-mode-alist '("\\.htm\\'" . web-mode))
  (add-to-list 'auto-mode-alist '("\\.phtml\\'" . web-mode))
  (add-to-list 'auto-mode-alist '("\\.tpl\\.php\\'" . web-mode))
  (add-to-list 'auto-mode-alist '("\\.[agj]sp\\'" . web-mode))
  (add-to-list 'auto-mode-alist '("\\.as[cp]x\\'" . web-mode))
  (add-to-list 'auto-mode-alist '("\\.erb\\'" . web-mode))
  (add-to-list 'auto-mode-alist '("\\.mustache\\'" . web-mode))
  (add-to-list 'auto-mode-alist '("\\.djhtml\\'" . web-mode))

  (setq web-mode-css-indent-offset 2))

(use-package whitespace
  :config
  (setq whitespace-display-mappings
        '(
          (space-mark 32 [183] [46]) ; normal space, ·
          (space-mark 160 [164] [95])
          (space-mark 2208 [2212] [95])
          (space-mark 2336 [2340] [95])
          (space-mark 3616 [3620] [95])
          (space-mark 3872 [3876] [95])
          (newline-mark 10 [182 10]) ; newlne, ¶
          (tab-mark 9 [9655 9] [92 9]) ; tab, ▷
          )))

(use-package window
  :bind ("C-;" . other-window))

(use-package winner
  :bind ("C-|".  winner-undo))

(use-package workflow)

(use-package ws-butler
  :config
  (add-hook 'prog-mode-hook #'ws-butler-mode))

(use-package zerodark-theme
  :config
  
  (defun set-selected-frame-dark ()
    (interactive)
    (let ((frame-name (cdr (assq 'name (frame-parameters (selected-frame))))))
      (call-process-shell-command
       (format
        "xprop -f _GTK_THEME_VARIANT 8u -set _GTK_THEME_VARIANT 'dark' -name '%s'"
        frame-name))))
  
  (when (window-system)
    (load-theme 'zerodark t)
    (zerodark-setup-modeline-format)
    (set-selected-frame-dark)
    (setq frame-title-format '(buffer-file-name "%f" ("%b")))))

(use-package zoom-frm
  :bind (("C-+" . zoom-frm-in)
         ("C--" . zoom-frm-out)))

(progn ;     startup
  (message "Loading %s...done (%.3fs)" user-init-file
           (float-time (time-subtract (current-time)
                                      before-user-init-time)))
  (add-hook 'after-init-hook
            (lambda ()
              (message
               "Loading %s...done (%.3fs) [after-init]" user-init-file
               (float-time (time-subtract (current-time)
                                          before-user-init-time))))
            t))

(progn ;   local packages
  (let ((dir (expand-file-name "local" user-emacs-directory)))
    (when (file-exists-p dir)
      (add-to-list 'load-path dir))))

(progn ;     personalize
  (let ((file (expand-file-name (concat (user-real-login-name) ".el")
                                user-emacs-directory)))
    (when (file-exists-p file)
      (load file))))

(progn ;    host-specific setup
  (let* ((host (substring (shell-command-to-string "hostname") 0 -1))
         (host-dir (concat "~/.emacs.d/hosts/" host)))
    (add-to-list 'load-path host-dir)
    (let ((default-directory host-dir))
      (normal-top-level-add-subdirs-to-load-path))
    (let ((init-host-feature (intern (concat "init-" host))))
      (require init-host-feature nil t))))

(progn ;   private modules
  (let ((private-dir "~/.priv/elisp"))
    (when (file-exists-p private-dir)
      (add-to-list 'load-path private-dir)
      (require 'private-modules nil t))))

;; Local Variables:
;; indent-tabs-mode: nil
;; End:
;;; init.el ends here
