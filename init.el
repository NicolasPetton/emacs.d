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
  (setq use-package-verbose t)
  (setq use-package-always-defer t)
  (setq use-package-enable-imenu-support t))

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

(use-package bash-completion
  :demand t
  :config (progn
            (bash-completion-setup)))

(use-package epkg
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

(use-package ace-window
  :bind ("C-c w" . ace-window)
  :demand t)

(use-package anzu
  :diminish anzu-mode
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
  :bind ("C-c C-j" . avy-goto-char-2)
  :config
  (progn
     ;; Home row
    (setq avy-keys '(?a ?r ?s ?t ?d ?h ?n ?e ?i ?o))
    (setq avy-style 'at-full)
    (setq avy-all-windows t)))

(use-package beginend
  :demand t
  :diminish beginend-global-mode
  :config
  (beginend-global-mode))

(use-package browse-url
  :config
  (setq browse-url-generic-program (executable-find "nightly")))

(use-package buffer-move
  :bind (("<s-up>" . buf-move-up)
         ("<s-down>" . buf-move-down)
         ("<s-left>" . buf-move-left)
         ("<s-right>" . buf-move-right)))

(use-package buffer-watcher
  :demand t)

(use-package clojure-mode
  :mode "\\.clj\\'")

(use-package cider
  :after clojure-mode
  :init (progn
          (defun setup-clojure-buffer ()
            (eldoc-mode)
            (clj-refactor-mode 1)
            (paredit-mode 1)
            (setq indent-tabs-mode nil))

          (add-hook 'clojure-mode-hook #'setup-clojure-buffer)
          (add-hook 'cider-mode-hook #'cider-turn-on-eldoc-mode))
  :config (progn
            (setq cider-repl-use-clojure-font-lock t
                  cider-repl-use-pretty-printing t
                  cider-repl-wrap-history t
                  cider-repl-history-size 3000)))

(use-package clj-refactor
  :after clojure-mode
  :config (cljr-add-keybindings-with-prefix "C-c C-r"))

(use-package company
  :diminish ""
  :init (progn
          (add-hook 'prog-mode-hook 'company-mode))
  :config (progn
            (setq company-idle-delay 0.5)
            (setq company-tooltip-limit 10)
            (setq company-minimum-prefix-length 2)
            (setq company-tooltip-flip-when-above t)))

(use-package company-dabbrev
  :config (progn
            (setq company-dabbrev-ignore-case t)
            (setq company-dabbrev-downcase nil)))

(use-package compile
  :hook (compilation-filter . my/colorize-compilation-buffer)
  :config
  (progn
    ;; http://stackoverflow.com/questions/13397737
    (defun my/colorize-compilation-buffer ()
      (require 'ansi-color)
      (let ((inhibit-read-only t))
        (ansi-color-apply-on-region compilation-filter-start (point))))))

(use-package counsel
  :demand t
  :bind (("M-x" . counsel-M-x)
         ("C-x C-f" . counsel-find-file)
         ("M-i" . counsel-imenu)
         ("M-y" . counsel-yank-pop))
  :init (progn
          (setq counsel-linux-app-format-function
                #'counsel-linux-app-format-function-name-only)))

(use-package dabbrev
  :bind (("S-SPC" . dabbrev-expand)))

(use-package dash
  :config (dash-enable-font-lock))

(use-package diff-hl
  :config (progn
            (global-diff-hl-mode)
            (add-hook 'magit-post-refresh-hook 'diff-hl-magit-post-refresh t)))

(use-package diminish
  :demand t
  :init (progn
            (diminish 'auto-revert-mode)
            (diminish 'outline-minor-mode)
            (eval-after-load 'amd-mode
              '(diminish 'amd-mode))
            (eval-after-load 'js2-refactor
              '(diminish 'js2-refactor-mode))
            (eval-after-load 'tern
              '(diminish 'tern-mode))
            (eval-after-load 'eslintd-fix
              '(diminish 'eslintd-fix-mode))
            (eval-after-load 'widgetjs
              '(diminish 'widgetjs-mode))
            (eval-after-load 'indium
              '(diminish 'indium-interaction-mode))))

(use-package dired
  :bind (:map dired-mode-map
              ("M-s" . find-name-dired)
              ("C-k" . dired-kill-subdir))
  :init (progn
          (add-hook 'dired-mode-hook #'dired-hide-details-mode))
  :config (progn
            (setq dired-listing-switches "-alh")
            (setq dired-dwim-target t)
            (put 'dired-find-alternate-file 'disabled nil)))

(use-package dired-du
  :after dired)

(use-package dired-x
  :demand t
  :after dired
  :init (progn
          (add-hook 'dired-mode-hook #'dired-omit-mode))
  :config (progn
            (setq dired-omit-files "^\\...+$")))

(use-package drag-stuff
  :demand t
  :diminish drag-stuff-mode
  :config (progn
            (drag-stuff-global-mode t)
            (drag-stuff-define-keys)
            (add-to-list 'drag-stuff-except-modes 'org-mode)
            (add-to-list 'drag-stuff-except-modes 'rebase-mode)
            (add-to-list 'drag-stuff-except-modes 'emacs-lisp-mode)))

(use-package duplicate-thing
  :bind ("M-D" . duplicate-thing))

(use-package ediff
  :config (progn
            ;; window positioning & frame setup
            (setq ediff-window-setup-function 'ediff-setup-windows-plain
                  ediff-split-window-function 'split-window-horizontally)))

(use-package editorconfig
  :demand t
  :diminish editorconfig-mode
  :init (editorconfig-mode 1))

(use-package elbank)

(use-package eldoc
  :diminish ""
  :config (global-eldoc-mode))

(use-package elec-pair
  :demand t
  :config (electric-pair-mode t))

(use-package electric
  :demand t
  :config (electric-indent-mode t))

(use-package erc
  :init (progn
          (setq erc-nick "NicolasPetton"
                erc-autojoin-channels-alist '(("freenode.net" . ("#emacs"))))))

(use-package eshell
  :config (progn
            (eval-after-load 'esh-opt
              '(progn
                 (require 'em-prompt)
                 (require 'em-term)
                 (require 'em-cmpl)
                 (setenv "PAGER" "cat")
                 (setenv "SUDO_ASKPASS" (executable-find "pass-root-password.sh"))
                 (add-hook 'eshell-mode-hook
                           #'company-mode)

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
                              '("tar" "\\(\\.tar|\\.tgz\\|\\.tar\\.gz\\)\\'"))))))

(use-package pcomplete
  :config (progn
            (defvar pcomplete-man-user-commands
              (split-string
               (shell-command-to-string
                "apropos -s 1 .|while read -r a b; do echo \" $a\";done;"))
              "p-completion candidates for `man' command")

            (defun pcomplete/man ()
              "Completion rules for the `man' command."
              (pcomplete-here pcomplete-man-user-commands))))

(use-package pcmpl-git
  :after pcomplete)

(use-package exec-path-from-shell
  :demand t
  :init (exec-path-from-shell-initialize))

(use-package expand-region
  :bind (("C-=" . er/expand-region)))

(use-package flycheck
  :diminish flycheck-mode
  :commands (flycheck-mode)
  :init (add-hook 'prog-mode-hook #'flycheck-mode))

(use-package flyspell
  :diminish flyspell-mode
  :bind (:map flyspell-mode-map
              ("C-;" . nil))
  :init (progn
          (add-hook 'prog-mode-hook #'flyspell-prog-mode)
          (dolist (mode-hook '(text-mode-hook org-mode-hook LaTeX-mode-hook))
            (add-hook mode-hook #'flyspell-mode))))

(use-package geiser
  :demand t)

(use-package gnus-dired
  :bind (:map gnus-dired-mode-map
              ("C-x C-a" . gnus-dired-attach))
  :config (add-hook 'dired-mode-hook #'turn-on-gnus-dired-mode))

(use-package help
  :config (temp-buffer-resize-mode))

 (use-package helpful
  :bind (("C-h ." . helpful-at-point)
         ("C-h k" . helpful-key)
         ("C-h v" . helpful-variable)
         ("C-h f" . helpful-callable)))

(use-package ibuffer
  :bind (("C-x C-b" . ibuffer)))

;; Fix dead characters
(use-package iso-transl
  :demand t)

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
  :demand t
  :bind (("C-c r" . ivy-resume))
  :config (progn
            (ivy-mode 1)
            (setq ivy-use-virtual-buffers t)
            (setq ivy-count-format "(%d/%d) ")))

(progn ;    `isearch'
  (setq isearch-allow-scroll t))

(use-package js2-mode
  :mode "\\.js\\'"
  :config (progn
            (define-key js2-mode-map (kbd "C-c C-o") nil))
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
        (insert node-contents)))))
(use-package emacs-js
  :diminish (js2-refactor-mode js2-minor-mode js-lint-mode tern-mode)
  :commands (setup-js-buffer)
  :init
  (progn
    (add-hook 'js-mode-hook #'setup-js-buffer)))

(use-package klassified
  :diminish klassified-interaction-js-mode
  :init (add-hook 'js2-mode-hook #'klassified-interaction-js-mode))

(use-package ftgp
  :demand t)

(use-package less-css-mode)

(use-package lisp-mode
  :config
  (add-hook 'emacs-lisp-mode-hook 'outline-minor-mode)
  (defun indent-spaces-mode ()
    (setq indent-tabs-mode nil))
  (add-hook 'lisp-interaction-mode-hook #'indent-spaces-mode))

(use-package magit
  :bind (("C-x g"   . magit-status)
         ("C-x M-g" . magit-dispatch-popup)
         :map magit-mode-map
         ("C" . magit-commit-add-log))
  :config (progn
           (magit-add-section-hook 'magit-status-sections-hook
                                   'magit-insert-modules
                                   'magit-insert-unpulled-from-upstream)
           (setq magit-branch-prefer-remote-upstream '("master"))
           (setq magit-branch-adjust-remote-upstream-alist '(("origin/master" "master")))
           (setq magit-branch-arguments nil)))

(use-package man
  :config (setq Man-width 80))

(use-package multiple-cursors
  :bind (("M-RET" . mc/edit-lines)
         ("C-<" . mc/mark-previous-like-this)
         ("C->" . mc/mark-next-like-this)
         ("C-M-<" . mc/unmark-next-like-this)
         ("C-M->" . mc/unmark-previous-like-this)
         ("C-c C-<" . mc/mark-all-like-this)))

(use-package no-littering
  :demand t
  :config (progn
            (require 'recentf)
            (add-to-list 'recentf-exclude no-littering-var-directory)
            (add-to-list 'recentf-exclude no-littering-etc-directory)
            (setq delete-old-versions t
                  kept-new-versions 6
                  kept-old-versions 2
                  version-control t)
            (setq backup-directory-alist
                  `((".*" . ,(no-littering-expand-var-file-name "backup/"))))
            (setq auto-save-file-name-transforms
                  `((".*" ,(no-littering-expand-var-file-name "auto-save/") t)))
            (setq create-lockfiles nil)))

(use-package omnisharp
  :after csharp-mode
  :bind (:map omnisharp-mode-map
              ("C-c r" . omnisharp-run-code-action-refactoring)
              ("M-." . omnisharp-go-to-definition)
              ;; ("M-." . omnisharp-find-implementations)
              ("M-?" . omnisharp-find-usages))
  :hook ((omnisharp-mode . configure-omnisharp)
         (csharp-mode . omnisharp-mode))
  :config
  (progn
    (defun configure-omnisharp ()
      (add-to-list 'company-backends #'company-omnisharp)
      (local-set-key (kbd "C-c C-c") #'recompile))))

(use-package open-url-at-point
  :bind ("C-c C-o" . open-url-at-point))

(use-package org)

(use-package paredit
  :demand t
  :diminish ""
  :bind (:map paredit-mode-map
              ("M-s" . nil))
  :config
  (add-hook 'emacs-lisp-mode-hook #'paredit-mode)
  (add-hook 'eval-expression-minibuffer-setup-hook #'enable-paredit-mode))

(use-package paren
  :demand t
  :config (show-paren-mode))

(use-package pass
  :mode ("org/reference/password-store/" . pass-view-mode)
  :bind ("C-x p" . pass)
  :config (progn
            (add-to-list 'auto-mode-alist '("\\<password-store\\>/.*\\.gpg\\'" . pass-view-mode))))

(use-package pdf-tools
  :demand t
  :config (progn
            (pdf-tools-install)))

(use-package projectile
  :demand t
  :diminish ""
  :config (progn
            (projectile-mode)
            (require 'counsel-projectile)
            (counsel-projectile-mode)
            (define-key projectile-mode-map
              [remap projectile-ag]
              #'counsel-projectile-rg)

            (projectile-register-project-type
             'monitor
             '("gulpfile.js")
             :compile "cd ~/work/ftgp/monitor/monitor/Monitor.Web.Ui/Client && gulp lint"
             :test "cd ~/work/ftgp/monitor/monitor/Monitor.Web.Ui/Client && gulp karma"
             :test-suffix "-tests")))

(use-package prog-mode
  :config (global-prettify-symbols-mode)
  (defun indicate-buffer-boundaries-left ()
    (setq indicate-buffer-boundaries 'left))
  (add-hook 'prog-mode-hook #'indicate-buffer-boundaries-left))

(use-package rainbow-mode
  :init
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

(use-package shell-switcher
  :bind (("C-'" . shell-switcher-switch-buffer)
         ("C-M-'" . shell-switcher-new-shell)))

(use-package simple
  :config (column-number-mode))

(use-package slime
  :config
  (setq inferior-lisp-program "/usr/bin/sbcl")
  (slime-setup))

(use-package subword
  :diminish subword-mode
  :init (global-subword-mode))

(use-package swiper
  :bind (("C-s" . swiper)))

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
  :config (progn
            (add-to-list 'tramp-default-proxies-alist '(nil "\\`root\\'" "/ssh:%h:"))
            (add-to-list 'tramp-default-proxies-alist '("localhost" nil nil))
            (add-to-list 'tramp-default-proxies-alist
                         (list (regexp-quote (system-name)) nil nil))))

(use-package transmission
  :config (progn
            (defun transmission-add-magnet (url)
              "Like `transmission-add', but with no file completion."
              (interactive "sMagnet url: ")
              (transmission-add url))))

(use-package uniquify
  :config
  (setq uniquify-buffer-name-style 'forward))

(use-package web-mode
  :init
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

(use-package winner
  :bind (("C-|".  winner-undo)
         ("C-;" . other-window)))

(use-package workflow
  :commands (work-clock-out
             work-back-from-lunch
             work-coffee
             work-start
             work-stop
             work-lunch
             work-clock-in
             work-send-weekly-email))

(use-package ws-butler
  :diminish ""
  :init
  (add-hook 'prog-mode-hook #'ws-butler-mode))

(use-package yasnippet
  :diminish yas-minor-mode
  :demand t
  :init (progn
          (yas-global-mode)))

(use-package zerodark-theme
  :demand t
  :config
  (progn
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
      (setq frame-title-format '(buffer-file-name "%f" ("%b"))))))

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
         (host-dir (concat "~/.emacs.d/hosts/" host))
         (host-file (expand-file-name "init.el" host-dir)))
    (when (file-exists-p host-dir)
      (let ((default-directory host-dir))
        (add-to-list 'load-path host-dir)
        (normal-top-level-add-subdirs-to-load-path)))
    (when (file-exists-p host-file)
      (load host-file))))

(progn ;   private modules
  (let ((private-dir "~/.priv/elisp"))
    (when (file-exists-p private-dir)
      (add-to-list 'load-path private-dir)
      (require 'private-modules nil t))))

;; display line numbers in buffers visiting a file
;; (dolist (mode-hook '(prog-mode-hook text-mode-hook))
;;   (add-hook mode-hook (lambda ()
;;                         (when buffer-file-name
;;                           (setq display-line-numbers t)))))

(defun goto-line-with-line-numbers ()
  (interactive)
  (let ((display-line-numbers t))
    (call-interactively #'goto-line)))

(global-set-key [remap goto-line] #'goto-line-with-line-numbers)

;; Local Variables:
;; indent-tabs-mode: nil
;; eval: (flycheck-mode -1)
;; no-byte-compile: t
;; End:
;;; init.el ends here
