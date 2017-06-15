(require 'reftex)
;; (require 'auctex-evince-sync)

(add-hook 'LaTeX-mode-hook 'tex-pdf-mode)

(eval-after-load "LaTeX"
  '(progn

     ;; synctex
     (TeX-source-correlate-mode)

     (add-to-list 'TeX-expand-list
		  '("%q" skim-make-url))))

(defun skim-make-url () (concat
			 (TeX-current-line)
			 " "
			 (expand-file-name (funcall file (TeX-output-extension) t)
					   (file-name-directory (TeX-master-file)))
			 " "
			 (buffer-file-name)))

(setq TeX-view-program-list
      '(("evince" "evince %o")))

(setq TeX-view-program-selection '((output-pdf "evince")))

(provide 'init-latex)
