(defun tunnel (port host)
  (interactive "sPort: \nsHost: ")
  (let ((buffer "SSH Tunnel"))
    (async-shell-command
     (concat "ssh -C -N -D " port " " host)
     buffer)
    (with-current-buffer buffer
      (insert (concat "Starting tunnel on " host " port " port)))))

(provide 'tunnel)
