(require 'exwm)
(require 'exwm-systemtray)
(require 'exwm-config)

(require 'seq)
(require 'counsel)
(require 'buffer-move)

(exwm-systemtray-enable)
(desktop-environment-mode)

;; Set the initial number of workspaces.
(setq exwm-workspace-number 2)
(setq exwm-workspace-show-all-buffers t)
(setq exwm-layout-show-all-buffers t)

;; Watch smartcard to lock/unlock the screen
(defun watch-smartcard-removed ()
  (make-process :name "smartcard-removed-watcher"
		:buffer "*smartcard watcher*"
		:filter #'smartcard-lockscreen
		:command (list shell-file-name
			       shell-command-switch
			       "journalctl --follow | grep \"Stopped target Smart Card\"")))

(defun watch-smartcard ()
  (make-process :name "smartcard-watcher"
		:buffer "*smartcard removed watcher*"
		:filter #'smartcard-unlock-gpg-key
		:command (list shell-file-name
			       shell-command-switch
			       "journalctl --follow | grep \"Reached target Smart Card\"")))

(defun smartcard-lockscreen (process output)
  "Filter function for PROCESS.
Append OUTPUT to the PROCESS buffer, and lock the screen when there is output."
  ;; Append output to the process buffer
  (with-current-buffer (process-buffer process)
    (goto-char (point-max))
    (insert output))
  (ignore-errors
    (lockscreen)))

(defun smartcard-unlock-gpg-key (process output)
  (with-current-buffer (process-buffer process)
    (goto-char (point-max))
    (insert output))
  (ignore-errors
    (unlock-gpg-key)))

(add-hook 'exwm-init-hook #'watch-smartcard)
(add-hook 'exwm-init-hook #'watch-smartcard-removed)

;; All buffers created in EXWM mode are named "*EXWM*". You may want to change
;; it in `exwm-update-class-hook' and `exwm-update-title-hook', which are run
;; when a new window class name or title is available. Here's some advice on
;; this subject:
;; + Always use `exwm-workspace-rename-buffer` to avoid naming conflict.
;; + Only renaming buffer in one hook and avoid it in the other. There's no
;;   guarantee on the order in which they are run.
;; + For applications with multiple windows (e.g. GIMP), the class names of all
;;   windows are probably the same. Using window titles for them makes more
;;   sense.
;; + Some application change its title frequently (e.g. browser, terminal).
;;   Its class name may be more suitable for such case.
;; In the following example, we use class names for all windows expect for
;; Java applications and GIMP.
(add-hook 'exwm-update-class-hook
          (lambda ()
            (unless (or (string-prefix-p "sun-awt-X11-" exwm-instance-name)
                        (string= "gimp" exwm-instance-name))
              (exwm-workspace-rename-buffer exwm-class-name))))
(add-hook 'exwm-update-title-hook
          (lambda ()
            (when (or (not exwm-instance-name)
                      (string-prefix-p "sun-awt-X11-" exwm-instance-name)
                      (string= "gimp" exwm-instance-name))
              (exwm-workspace-rename-buffer exwm-title))))

;; `exwm-input-set-key' allows you to set a global key binding (available in
;; any case). Following are a few examples.
;; + We always need a way to go back to line-mode from char-mode
(exwm-input-set-key (kbd "s-r") #'exwm-reset)
;; + Bind a key to switch workspace interactively
(exwm-input-set-key (kbd "s-w") #'exwm-workspace-switch)
;; + Bind "s-0" to "s-9" to switch to the corresponding workspace.
(dotimes (i 10)
  (exwm-input-set-key (kbd (format "s-%d" i))
                      `(lambda ()
                         (interactive)
                         (exwm-workspace-switch-create ,i))))
;; + Application launcher ('M-&' also works if the output buffer does not
;;   bother you). Note that there is no need for processes to be created by
;;   Emacs.
(exwm-input-set-key (kbd "s-&")
                    (lambda (command)
                      (interactive (list (read-shell-command "$ ")))
                      (start-process-shell-command command nil command)))

;; The following example demonstrates how to set a key binding only available
;; in line mode. It's simply done by first push the prefix key to
;; `exwm-input-prefix-keys' and then add the key sequence to `exwm-mode-map'.
;; The example shorten 'C-c q' to 'C-q'.
(push ?\C-q exwm-input-prefix-keys)
(define-key exwm-mode-map [?\C-q] #'exwm-input-send-next-key)
(push ?\C-' exwm-input-prefix-keys)

;; The following example demonstrates how to use simulation keys to mimic the
;; behavior of Emacs. The argument to `exwm-input-set-simulation-keys' is a
;; list of cons cells (SRC . DEST), where SRC is the key sequence you press and
;; DEST is what EXWM actually sends to application. Note that SRC must be a key
;; sequence (of type vector or string), while DEST can also be a single key.
(exwm-input-set-simulation-keys
 `(
    ;; movement
    ([?\C-b] . left)
    ([?\M-b] . C-left)
    ([?\C-f] . right)
    ([?\M-f] . C-right)
    ([?\C-p] . up)
    ([?\C-n] . down)
    ([?\C-a] . home)
    ([?\C-e] . end)
    ([?\M-v] . prior)
    ([?\C-v] . next)
    ([?\C-d] . delete)
    ([?\C-k] . (S-end ?\C-x))
    ([?\M-<] . C-home)
    ([?\M->] . C-end)
    ;; cut/paste, selection
    ([?\C-w] . ?\C-x)
    ([?\M-w] . ?\C-c)
    ([?\C-y] . ?\C-v)
    ([?\C-x ?h] . ?\C-a)
    ([?\M-d] . (C-S-right ?\C-x))
    ([M-backspace] . (C-S-left ?\C-x))
    ;; search
    ([?\C-s] . ?\C-f)
    ;; escape
    ([?\C-g] . escape)))

;; You can hide the mode-line of floating X windows by uncommenting the
;; following lines
;(add-hook 'exwm-floating-setup-hook #'exwm-layout-hide-mode-line)
;(add-hook 'exwm-floating-exit-hook #'exwm-layout-show-mode-line)

;; You can hide the minibuffer and echo area when they're not used, by
;; uncommenting the following line
;(setq exwm-workspace-minibuffer-position 'bottom)

;; Do not forget to enable EXWM. It will start by itself when things are ready.
;; (exwm-enable)

(add-hook 'exwm-init-hook #'display-battery-mode)
(add-hook 'exwm-init-hook #'display-time-mode)

(add-hook 'exwm-init-hook #'gpastel-start-listening)
(exwm-input-set-key (kbd "M-y") #'my/exwm-counsel-yank-pop)

(defun my/exwm-counsel-yank-pop ()
     "Same as `counsel-yank-pop' and paste into exwm buffer."
     (interactive)
     (let ((inhibit-read-only t)
           ;; Make sure we send selected yank-pop candidate to
           ;; clipboard:
           (yank-pop-change-selection t))
       (call-interactively #'counsel-yank-pop))
     (when (derived-mode-p 'exwm-mode)
       ;; https://github.com/ch11ng/exwm/issues/413#issuecomment-386858496
       (exwm-input--set-focus (exwm--buffer->id (window-buffer (selected-window))))
       (exwm-input--fake-key ?\C-v)))

(defun lockscreen ()
  (interactive)
  (shell-command-to-string "lockscreen"))

(defun unlock-gpg-key ()
  (let ((dummy-file "~/.gnupg/dummy.gpg")
	(tmp-file (make-temp-file "dummy")))
    (when (file-exists-p dummy-file)
      (epa-decrypt-file dummy-file tmp-file))))

(require 'exwm-randr)
(setq exwm-randr-workspace-output-plist '(0 "eDP-1" 1 "DP-2"))
(add-hook 'exwm-randr-screen-change-hook
          (lambda ()
            (start-process-shell-command
             "xrandr" nil "xrandr --output DP-2 --right-of eDP-1 --auto")))
(exwm-randr-enable)

(defun list-all-windows ()
  (seq-mapcat (lambda (frame)
		(window-list frame))
	      (frame-list)))

(defun nico-switch-to-window (bufname)
  (interactive (list (completing-read "Select window: "
                                      (seq-map #'buffer-name
                                               (seq-map #'window-buffer
                                                        (list-all-windows)))
                                      t)))
  (when-let ((window (seq-find (lambda (window)
                                 (string= (buffer-name (window-buffer window))
                                          bufname))
                               (list-all-windows))))
    (select-window window)))

(exwm-input-set-key (kbd "C-x w") #'nico-switch-to-window)
;; Unplug the smartcard instead
;; (exwm-input-set-key (kbd "s-l") #'lockscreen)

(exwm-input-set-key (kbd "<s-up>") #'buf-move-up)
(exwm-input-set-key (kbd "<s-down>") #'buf-move-down)
(exwm-input-set-key (kbd "<s-left>") #'buf-move-left)
(exwm-input-set-key (kbd "<s-right>") #'buf-move-right)
(exwm-input-set-key (kbd "s-!") #'counsel-linux-app)
(exwm-input-set-key (kbd "C-'") #'shell-switcher-switch-buffer)
(exwm-input-set-key (kbd "C-;") #'other-window)
(exwm-input-set-key (kbd "s-;") #'other-frame)

(exwm-input-set-key (kbd "C-|") #'winner-undo)

(exwm-input-set-key (kbd "M-N") #'notmuch)

(provide 'init-exwm)
