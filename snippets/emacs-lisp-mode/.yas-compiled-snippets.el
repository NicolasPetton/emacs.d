;;; Compiled snippets and support files for `emacs-lisp-mode'
;;; Snippet definitions:
;;;
(yas-define-snippets 'emacs-lisp-mode
                     '(("yes-or-no-p" "(yes-or-no-p \"PROMPT$0 \")" "yes-or-no-p" nil nil nil "/home/nico/.emacs.d/snippets/emacs-lisp-mode/yes-or-no-p.yasnippet" nil nil)
                       ("yonp" "(yes-or-no-p \"PROMPT$0 \")" "y-or-n-p" nil nil nil "/home/nico/.emacs.d/snippets/emacs-lisp-mode/y-or-n-p.yasnippet" nil nil)
                       ("x-word-or-region" ";; example of a command that works on current word or text selection\n(defun down-case-word-or-region ()\n  \"Lower case the current word or text selection.\"\n(interactive)\n(let (pos1 pos2 meat)\n  (if (and transient-mark-mode mark-active)\n      (setq pos1 (region-beginning)\n            pos2 (region-end))\n    (setq pos1 (car (bounds-of-thing-at-point 'symbol))\n          pos2 (cdr (bounds-of-thing-at-point 'symbol))))\n\n  ; now, pos1 and pos2 are the starting and ending positions\n  ; of the current word, or current text selection if exists\n\n  ;; put your code here.\n  $0\n  ;; Some example of things you might want to do\n  (downcase-region pos1 pos2) ; example of a func that takes region as args\n  (setq meat (buffer-substring-no-properties pos1 pos2)) ; grab the text.\n  (delete-region pos1 pos2) ; get rid of it\n  (insert \"newText\") ; insert your new text\n\n  )\n)" "Command that works on region or word" nil nil nil "/home/nico/.emacs.d/snippets/emacs-lisp-mode/x-word-or-region.yasnippet" nil nil)
                       ("x-traverse_dir" ";; apply a function to all files in a dir\n(require 'find-lisp)\n(mapc 'my-process-file (find-lisp-find-files \"~/myweb/\" \"\\\\.html$\"))" "traversing a directory" nil nil nil "/home/nico/.emacs.d/snippets/emacs-lisp-mode/x-traverse_dir.yasnippet" nil nil)
                       ("x-grabthing" "(setq $0 (thing-at-point 'symbol))" "grab word under cursor" nil nil nil "/home/nico/.emacs.d/snippets/emacs-lisp-mode/x-grabthing.yasnippet" nil nil)
                       ("x-grabstring" "(setq $0 (buffer-substring-no-properties myStartPos myEndPos))" "grab buffer substring" nil nil nil "/home/nico/.emacs.d/snippets/emacs-lisp-mode/x-grabstring.yasnippet" nil nil)
                       ("x-find-replace" "(defun replace-html-chars-region (start end)\n  \"Replace “<” to “&lt;” and other chars in HTML.\nThis works on the current region.\"\n  (interactive \"r\")\n  (save-restriction\n    (narrow-to-region start end)\n    (goto-char (point-min))\n    (while (search-forward \"&\" nil t) (replace-match \"&amp;\" nil t))\n    (goto-char (point-min))\n    (while (search-forward \"<\" nil t) (replace-match \"&lt;\" nil t))\n    (goto-char (point-min))\n    (while (search-forward \">\" nil t) (replace-match \"&gt;\" nil t))\n    )\n  )" "find and replace on region" nil nil nil "/home/nico/.emacs.d/snippets/emacs-lisp-mode/x-find-replace.yasnippet" nil nil)
                       ("x-file" "(defun read-lines (filePath)\n  \"Return a list of lines in FILEPATH.\"\n  (with-temp-buffer\n    (insert-file-contents filePath)\n    (split-string\n     (buffer-string) \"\\n\" t)) )\n\n;; process all lines\n(mapc\n (lambda (aLine)\n   (message aLine) ; do your stuff here\n   )\n (read-lines \"inputFilePath\")\n)" "read lines of a file" nil nil nil "/home/nico/.emacs.d/snippets/emacs-lisp-mode/x-file.read-lines.yasnippet" nil nil)
                       ("x-file" "(defun doThisFile (fpath)\n  \"Process the file at path FPATH ...\"\n  (let ()\n    ;; create temp buffer without undo record or font lock. (more efficient)\n    ;; first space in temp buff name is necessary\n    (set-buffer (get-buffer-create \" myTemp\"))\n    (insert-file-contents fpath nil nil nil t)\n\n    ;; process it ...\n    ;; (goto-char 0) ; move to begining of file's content (in case it was open)\n    ;; ... do something here\n    ;; (write-file fpath) ;; write back to the file\n\n    (kill-buffer \" myTemp\")))" "a function that process a file" nil nil nil "/home/nico/.emacs.d/snippets/emacs-lisp-mode/x-file.process.yasnippet" nil nil)
                       ("x-dired" ";; idiom for processing a list of files in dired's marked files\n\n;; suppose myProcessFile is your function that takes a file path\n;; and do some processing on the file\n\n(defun dired-myProcessFile ()\n  \"apply myProcessFile function to marked files in dired.\"\n  (interactive)\n  (require 'dired)\n  (mapc 'myProcessFile (dired-get-marked-files))\n)\n\n;; to use it, type M-x dired-myProcessFile" "process marked files in dired" nil nil nil "/home/nico/.emacs.d/snippets/emacs-lisp-mode/x-dired.process_marked.yasnippet" nil nil)
                       ("wcb" "(with-current-buffer $0 )" "with-current-buffer" nil nil nil "/home/nico/.emacs.d/snippets/emacs-lisp-mode/with-current-buffer.yasnippet" nil nil)
                       ("wg" "(widget-get $0 )" "widget-get" nil nil nil "/home/nico/.emacs.d/snippets/emacs-lisp-mode/widget-get.yasnippet" nil nil)
                       ("while" "(while $0)" "while" nil nil nil "/home/nico/.emacs.d/snippets/emacs-lisp-mode/while.yasnippet" nil nil)
                       ("when" "(when $0)" "when" nil nil nil "/home/nico/.emacs.d/snippets/emacs-lisp-mode/when.yasnippet" nil nil)
                       ("v" "(vector $0)" "vector" nil nil nil "/home/nico/.emacs.d/snippets/emacs-lisp-mode/vector.yasnippet" nil nil)
                       ("unless" "(unless $0)" "unless" nil nil nil "/home/nico/.emacs.d/snippets/emacs-lisp-mode/unless.yasnippet" nil nil)
                       ("tap" "(thing-at-point '$0) ; symbol, list, sexp, defun, filename, url, email, word, sentence, whitespace, line, page ..." "thing-at-point" nil nil nil "/home/nico/.emacs.d/snippets/emacs-lisp-mode/thing-at-point.yasnippet" nil nil)
                       ("substring" "(substring STRING$0 FROM &optional TO)" "substring" nil nil nil "/home/nico/.emacs.d/snippets/emacs-lisp-mode/substring.yasnippet" nil nil)
                       ("stringp" "(stringp $0)" "stringp" nil nil nil "/home/nico/.emacs.d/snippets/emacs-lisp-mode/stringp.yasnippet" nil nil)
                       ("string=" "(string= $0 )" "string=" nil nil nil "/home/nico/.emacs.d/snippets/emacs-lisp-mode/string=.yasnippet" nil nil)
                       ("string" "(string $0 )" "string" nil nil nil "/home/nico/.emacs.d/snippets/emacs-lisp-mode/string.yasnippet" nil nil)
                       ("stn" "(string-to-number \"$0\")" "string-to-number" nil nil nil "/home/nico/.emacs.d/snippets/emacs-lisp-mode/string-to-number.yasnippet" nil nil)
                       ("sm" "(string-match \"REGEXP$0\" \"STRING\" &optional START)" "string-match" nil nil nil "/home/nico/.emacs.d/snippets/emacs-lisp-mode/string-match.yasnippet" nil nil)
                       ("ss" "(split-string $0 &optional SEPARATORS OMIT-NULLS)" "split-string" nil nil nil "/home/nico/.emacs.d/snippets/emacs-lisp-mode/split-string.yasnippet" nil nil)
                       ("scf" "(skip-chars-forward \"$0\" &optional LIM)" "skip-chars-forward" nil nil nil "/home/nico/.emacs.d/snippets/emacs-lisp-mode/skip-chars-forward.yasnippet" nil nil)
                       ("scb" "(skip-chars-backward \"$0\" &optional LIM)" "skip-chars-backward" nil nil nil "/home/nico/.emacs.d/snippets/emacs-lisp-mode/skip-chars-backward.yasnippet" nil nil)
                       ("s" "(setq $0 )" "setq" nil nil nil "/home/nico/.emacs.d/snippets/emacs-lisp-mode/setq.yasnippet" nil nil)
                       ("set" "(set $0 )" "set" nil nil nil "/home/nico/.emacs.d/snippets/emacs-lisp-mode/set.yasnippet" nil nil)
                       ("sm" "(set-mark $0)" "set-mark" nil nil nil "/home/nico/.emacs.d/snippets/emacs-lisp-mode/set-mark.yasnippet" nil nil)
                       ("sfm" "(set-file-modes $0 MODE)" "set-file-modes" nil nil nil "/home/nico/.emacs.d/snippets/emacs-lisp-mode/set-file-modes.yasnippet" nil nil)
                       ("sb" "(set-buffer $0 )" "set-buffer" nil nil nil "/home/nico/.emacs.d/snippets/emacs-lisp-mode/set-buffer.yasnippet" nil nil)
                       ("sf" "(search-forward \"$0\" &optional BOUND NOERROR COUNT)" "search-forward" nil nil nil "/home/nico/.emacs.d/snippets/emacs-lisp-mode/search-forward.yasnippet" nil nil)
                       ("sfr" "(search-forward-regexp \"$0\" &optional BOUND NOERROR COUNT)" "search-forward-regexp" nil nil nil "/home/nico/.emacs.d/snippets/emacs-lisp-mode/search-forward-regexp.yasnippet" nil nil)
                       ("sb" "(search-backward \"$0\" &optional BOUND NOERROR COUNT)" "search-backward" nil nil nil "/home/nico/.emacs.d/snippets/emacs-lisp-mode/search-backward.yasnippet" nil nil)
                       ("sbr" "(search-backward-regexp \"$0\" &optional BOUND NOERROR COUNT)" "search-backward-regexp" nil nil nil "/home/nico/.emacs.d/snippets/emacs-lisp-mode/search-backward-regexp.yasnippet" nil nil)
                       ("se" "(save-excursion $0)" "save-excursion" nil nil nil "/home/nico/.emacs.d/snippets/emacs-lisp-mode/save-excursion.yasnippet" nil nil)
                       ("sb" "(save-buffer $0)" "save-buffer" nil nil nil "/home/nico/.emacs.d/snippets/emacs-lisp-mode/save-buffer.yasnippet" nil nil)
                       ("require" "(require $0 )" "require" nil nil nil "/home/nico/.emacs.d/snippets/emacs-lisp-mode/require.yasnippet" nil nil)
                       ("rr" "(replace-regexp REGEXP$0 TO-STRING &optional DELIMITED START END)" "replace-regexp" nil nil nil "/home/nico/.emacs.d/snippets/emacs-lisp-mode/replace-regexp.yasnippet" nil nil)
                       ("rris" "(replace-regexp-in-string REGEXP$0 REP STRING &optional FIXEDCASE LITERAL SUBEXP START)" "replace-regexp-in-string" nil nil nil "/home/nico/.emacs.d/snippets/emacs-lisp-mode/replace-regexp-in-string.yasnippet" nil nil)
                       ("repeat" "(repeat $0 )" "repeat" nil nil nil "/home/nico/.emacs.d/snippets/emacs-lisp-mode/repeat.yasnippet" nil nil)
                       ("rf" "(rename-file FILE$0 NEWNAME &optional OK-IF-ALREADY-EXISTS)" "rename-file" nil nil nil "/home/nico/.emacs.d/snippets/emacs-lisp-mode/rename-file.yasnippet" nil nil)
                       ("re" "(region-end)" "region-end" nil nil nil "/home/nico/.emacs.d/snippets/emacs-lisp-mode/region-end.yasnippet" nil nil)
                       ("rb" "(region-beginning)" "region-beginning" nil nil nil "/home/nico/.emacs.d/snippets/emacs-lisp-mode/region-beginning.yasnippet" nil nil)
                       ("rap" "(region-active-p)" "region-active-p" nil nil nil "/home/nico/.emacs.d/snippets/emacs-lisp-mode/region-active-p.yasnippet" nil nil)
                       ("rsf" "(re-search-forward REGEXP$0 &optional BOUND NOERROR COUNT)" "re-search-forward" nil nil nil "/home/nico/.emacs.d/snippets/emacs-lisp-mode/re-search-forward.yasnippet" nil nil)
                       ("rsb" "(re-search-backward REGEXP$0 &optional BOUND NOERROR COUNT)" "re-search-backward" nil nil nil "/home/nico/.emacs.d/snippets/emacs-lisp-mode/re-search-backward.yasnippet" nil nil)
                       ("put" "(put $0 PROPNAME VALUE)" "put" nil nil nil "/home/nico/.emacs.d/snippets/emacs-lisp-mode/put.yasnippet" nil nil)
                       ("push" "(push $0 )" "push" nil nil nil "/home/nico/.emacs.d/snippets/emacs-lisp-mode/push.yasnippet" nil nil)
                       ("provide" "(provide $0 )" "provide" nil nil nil "/home/nico/.emacs.d/snippets/emacs-lisp-mode/provide.yasnippet" nil nil)
                       ("progn" "(progn $0)" "progn" nil nil nil "/home/nico/.emacs.d/snippets/emacs-lisp-mode/progn.yasnippet" nil nil)
                       ("print" "(print $0)" "print" nil nil nil "/home/nico/.emacs.d/snippets/emacs-lisp-mode/print.yasnippet" nil nil)
                       ("princ" "(princ $0)" "princ" nil nil nil "/home/nico/.emacs.d/snippets/emacs-lisp-mode/princ.yasnippet" nil nil)
                       ("p" "(point)" "point" nil nil nil "/home/nico/.emacs.d/snippets/emacs-lisp-mode/point.yasnippet" nil nil)
                       ("pm" "(point-min)" "point-min" nil nil nil "/home/nico/.emacs.d/snippets/emacs-lisp-mode/point-min.yasnippet" nil nil)
                       ("point-max" "(point-max)" "point-max" nil nil nil "/home/nico/.emacs.d/snippets/emacs-lisp-mode/point-max.yasnippet" nil nil)
                       ("o" "(or $0 )" "or" nil nil nil "/home/nico/.emacs.d/snippets/emacs-lisp-mode/or.yasnippet" nil nil)
                       ("nts" "(number-to-string $0)" "number-to-string" nil nil nil "/home/nico/.emacs.d/snippets/emacs-lisp-mode/number-to-string.yasnippet" nil nil)
                       ("null" "(null $0)" "null" nil nil nil "/home/nico/.emacs.d/snippets/emacs-lisp-mode/null.yasnippet" nil nil)
                       ("nth" "(nth N$0 LIST)" "nth" nil nil nil "/home/nico/.emacs.d/snippets/emacs-lisp-mode/nth.yasnippet" nil nil)
                       ("n" "(not $0 )" "not" nil nil nil "/home/nico/.emacs.d/snippets/emacs-lisp-mode/not.yasnippet" nil nil)
                       ("m" "(message \"FORMATSTRING$0\" &optional ARGS)" "message" nil nil nil "/home/nico/.emacs.d/snippets/emacs-lisp-mode/message.yasnippet" nil nil)
                       ("memq" "(memq ELT$0 LIST)" "memq" nil nil nil "/home/nico/.emacs.d/snippets/emacs-lisp-mode/memq.yasnippet" nil nil)
                       ("ms" "(match-string $0 )" "match-string" nil nil nil "/home/nico/.emacs.d/snippets/emacs-lisp-mode/match-string.yasnippet" nil nil)
                       ("me" "(match-end N$0)" "match-end" nil nil nil "/home/nico/.emacs.d/snippets/emacs-lisp-mode/match-end.yasnippet" nil nil)
                       ("mb" "(match-beginning N$0)" "match-beginning" nil nil nil "/home/nico/.emacs.d/snippets/emacs-lisp-mode/match-beginning.yasnippet" nil nil)
                       ("mapcar" "(mapcar $0 )" "mapcar" nil nil nil "/home/nico/.emacs.d/snippets/emacs-lisp-mode/mapcar.yasnippet" nil nil)
                       ("mapc" "(mapc '$0 SEQUENCE)" "mapc" nil nil nil "/home/nico/.emacs.d/snippets/emacs-lisp-mode/mapc.yasnippet" nil nil)
                       ("mlv" "(make-local-variable $0)" "make-local-variable" nil nil nil "/home/nico/.emacs.d/snippets/emacs-lisp-mode/make-local-variable.yasnippet" nil nil)
                       ("md" "(make-directory $0 &optional PARENTS)" "make-directory" nil nil nil "/home/nico/.emacs.d/snippets/emacs-lisp-mode/make-directory.yasnippet" nil nil)
                       ("la" "(looking-at $0)" "looking-at" nil nil nil "/home/nico/.emacs.d/snippets/emacs-lisp-mode/looking-at.yasnippet" nil nil)
                       ("list" "(list $0)" "list" nil nil nil "/home/nico/.emacs.d/snippets/emacs-lisp-mode/list.yasnippet" nil nil)
                       ("lep" "(line-end-position)" "line-end-position" nil nil nil "/home/nico/.emacs.d/snippets/emacs-lisp-mode/line-end-position.yasnippet" nil nil)
                       ("lbp" "(line-beginning-position)" "line-beginning-position" nil nil nil "/home/nico/.emacs.d/snippets/emacs-lisp-mode/line-beginning-position.yasnippet" nil nil)
                       ("let" "(let (($1 $2))\n $0\n)" "let" nil nil nil "/home/nico/.emacs.d/snippets/emacs-lisp-mode/let.yasnippet" nil nil)
                       ("length" "(length $0)" "length" nil nil nil "/home/nico/.emacs.d/snippets/emacs-lisp-mode/length.yasnippet" nil nil)
                       ("lambda" "(lambda ($1) $0)" "lambda" nil nil nil "/home/nico/.emacs.d/snippets/emacs-lisp-mode/lambda.yasnippet" nil nil)
                       ("kb" "(kill-buffer $0)" "kill-buffer" nil nil nil "/home/nico/.emacs.d/snippets/emacs-lisp-mode/kill-buffer.yasnippet" nil nil)
                       ("kbd" "(kbd \"$0\")" "kbd" nil nil nil "/home/nico/.emacs.d/snippets/emacs-lisp-mode/kbd.yasnippet" nil nil)
                       ("interactive" "(interactive)" "interactive" nil nil nil "/home/nico/.emacs.d/snippets/emacs-lisp-mode/interactive.yasnippet" nil nil)
                       ("i" "(insert $0)" "insert" nil nil nil "/home/nico/.emacs.d/snippets/emacs-lisp-mode/insert.yasnippet" nil nil)
                       ("ifc" "(insert-file-contents $0 &optional VISIT BEG END REPLACE)" "insert-file-contents" nil nil nil "/home/nico/.emacs.d/snippets/emacs-lisp-mode/insert-file-contents.yasnippet" nil nil)
                       ("if" "(if $0)" "if" nil nil nil "/home/nico/.emacs.d/snippets/emacs-lisp-mode/if.yasnippet" nil nil)
                       ("gc" "(goto-char $0)" "goto-char" nil nil nil "/home/nico/.emacs.d/snippets/emacs-lisp-mode/goto-char.yasnippet" nil nil)
                       ("gsk" "(global-set-key (kbd \"C-$0\") 'COMMAND)" "global-set-key" nil nil nil "/home/nico/.emacs.d/snippets/emacs-lisp-mode/global-set-key.yasnippet" nil nil)
                       ("get" "(get SYMBOL$0 PROPNAME)" "get" nil nil nil "/home/nico/.emacs.d/snippets/emacs-lisp-mode/get.yasnippet" nil nil)
                       ("function" "(function $0 )" "function" nil nil nil "/home/nico/.emacs.d/snippets/emacs-lisp-mode/function.yasnippet" nil nil)
                       ("funcall" "(funcall $0)" "funcall" nil nil nil "/home/nico/.emacs.d/snippets/emacs-lisp-mode/funcall.yasnippet" nil nil)
                       ("fl" "(forward-line $0 )" "forward-line" nil nil nil "/home/nico/.emacs.d/snippets/emacs-lisp-mode/forward-line.yasnippet" nil nil)
                       ("fc" "(forward-char $0)" "forward-char" nil nil nil "/home/nico/.emacs.d/snippets/emacs-lisp-mode/forward-char.yasnippet" nil nil)
                       ("format" "(format \"$0\" &optional OBJECTS)" "format" nil nil nil "/home/nico/.emacs.d/snippets/emacs-lisp-mode/format.yasnippet" nil nil)
                       ("ff" "(find-file $0 )" "find-file" nil nil nil "/home/nico/.emacs.d/snippets/emacs-lisp-mode/find-file.yasnippet" nil nil)
                       ("frn" "(file-relative-name $0 )" "file-relative-name" nil nil nil "/home/nico/.emacs.d/snippets/emacs-lisp-mode/file-relative-name.yasnippet" nil nil)
                       ("fnse" "(file-name-sans-extension $0)" "file-name-sans-extension" nil nil nil "/home/nico/.emacs.d/snippets/emacs-lisp-mode/file-name-sans-extension.yasnippet" nil nil)
                       ("fnn" "(file-name-nondirectory $0 )" "file-name-nondirectory" nil nil nil "/home/nico/.emacs.d/snippets/emacs-lisp-mode/file-name-nondirectory.yasnippet" nil nil)
                       ("fne" "(file-name-extension $0 &optional PERIOD)" "file-name-extension" nil nil nil "/home/nico/.emacs.d/snippets/emacs-lisp-mode/file-name-extension.yasnippet" nil nil)
                       ("fnd" "(file-name-directory $0)" "file-name-directory" nil nil nil "/home/nico/.emacs.d/snippets/emacs-lisp-mode/file-name-directory.yasnippet" nil nil)
                       ("fboundp" "(fboundp '$0 )" "fboundp" nil nil nil "/home/nico/.emacs.d/snippets/emacs-lisp-mode/fboundp.yasnippet" nil nil)
                       ("format" "(format \"$0\" &optional OBJECTS)" "format" nil nil nil "/home/nico/.emacs.d/snippets/emacs-lisp-mode/f.yasnippet" nil nil)
                       ("efn" "(expand-file-name $0 )" "expand-file-name" nil nil nil "/home/nico/.emacs.d/snippets/emacs-lisp-mode/expand-file-name.yasnippet" nil nil)
                       ("error" "(error \"$0\" &optional ARGS)" "error" nil nil nil "/home/nico/.emacs.d/snippets/emacs-lisp-mode/error.yasnippet" nil nil)
                       ("equal" "(equal $0)" "equal" nil nil nil "/home/nico/.emacs.d/snippets/emacs-lisp-mode/equal.yasnippet" nil nil)
                       ("eq" "(eq $0)" "eq" nil nil nil "/home/nico/.emacs.d/snippets/emacs-lisp-mode/eq.yasnippet" nil nil)
                       ("eol" "(end-of-line)" "end-of-line" nil nil nil "/home/nico/.emacs.d/snippets/emacs-lisp-mode/end-of-line.yasnippet" nil nil)
                       ("dolist" "(dolist $0 )" "dolist" nil nil nil "/home/nico/.emacs.d/snippets/emacs-lisp-mode/dolist.yasnippet" nil nil)
                       ("df" "(directory-files $0 &optional FULL MATCH NOSORT)" "directory-files" nil nil nil "/home/nico/.emacs.d/snippets/emacs-lisp-mode/directory-files.yasnippet" nil nil)
                       ("dr" "(delete-region $0 )" "delete-region" nil nil nil "/home/nico/.emacs.d/snippets/emacs-lisp-mode/delete-region.yasnippet" nil nil)
                       ("df" "(delete-file $0)" "delete-file" nil nil nil "/home/nico/.emacs.d/snippets/emacs-lisp-mode/delete-file.yasnippet" nil nil)
                       ("dd" "(delete-directory $0 &optional RECURSIVE)" "delete-directory" nil nil nil "/home/nico/.emacs.d/snippets/emacs-lisp-mode/delete-directory.yasnippet" nil nil)
                       ("dc" "(delete-char $0)" "delete-char" nil nil nil "/home/nico/.emacs.d/snippets/emacs-lisp-mode/delete-char.yasnippet" nil nil)
                       ("defvar" "(defvar $1 $2 \"$3\")" "defvar" nil nil nil "/home/nico/.emacs.d/snippets/emacs-lisp-mode/defvar.yasnippet" nil nil)
                       ("defun" "(defun ${1:fun} (${2:args})\n  $0)\n" "defun" nil nil nil "/home/nico/.emacs.d/snippets/emacs-lisp-mode/defun.yasnippet" nil nil)
                       ("defsubst" "(defsubst $0 )" "defsubst" nil nil nil "/home/nico/.emacs.d/snippets/emacs-lisp-mode/defsubst.yasnippet" nil nil)
                       ("dk" "(define-key $1 (kbd \"$2\") '$0)" "define-key" nil nil nil "/home/nico/.emacs.d/snippets/emacs-lisp-mode/define-key.yasnippet" nil nil)
                       ("defcustom" "(defcustom $1 \n  $2 \n  \"$3\")" "defcustom" nil nil nil "/home/nico/.emacs.d/snippets/emacs-lisp-mode/defcustom.yasnippet" nil nil)
                       ("defalias" "(defalias 'SYMBOL$0 'DEFINITION &optional DOCSTRING)" "defalias" nil nil nil "/home/nico/.emacs.d/snippets/emacs-lisp-mode/defalias.yasnippet" nil nil)
                       ("ca" "(custom-autoload$0 SYMBOL LOAD &optional NOSET)" "custom-autoload" nil nil nil "/home/nico/.emacs.d/snippets/emacs-lisp-mode/custom-autoload.yasnippet" nil nil)
                       ("cb" "(current-buffer)" "current-buffer" nil nil nil "/home/nico/.emacs.d/snippets/emacs-lisp-mode/current-buffer.yasnippet" nil nil)
                       ("cf" "(copy-file FILE$0 NEWNAME &optional OK-IF-ALREADY-EXISTS KEEP-TIME PRESERVE-UID-GID)" "copy-file" nil nil nil "/home/nico/.emacs.d/snippets/emacs-lisp-mode/copy-file.yasnippet" nil nil)
                       ("cd" "(copy-directory $0 NEWNAME &optional KEEP-TIME PARENTS)" "copy-directory" nil nil nil "/home/nico/.emacs.d/snippets/emacs-lisp-mode/copy-directory.yasnippet" nil nil)
                       ("consp" "(consp $0 )" "consp" nil nil nil "/home/nico/.emacs.d/snippets/emacs-lisp-mode/consp.yasnippet" nil nil)
                       ("cons" "(cons $0)" "cons" nil nil nil "/home/nico/.emacs.d/snippets/emacs-lisp-mode/cons.yasnippet" nil nil)
                       ("cc" "(condition-case $0 )" "condition-case" nil nil nil "/home/nico/.emacs.d/snippets/emacs-lisp-mode/condition-case.yasnippet" nil nil)
                       ("cond" "(cond\n(CONDITION$0 BODY)\n(CONDITION BODY)\n)" "cond" nil nil nil "/home/nico/.emacs.d/snippets/emacs-lisp-mode/cond.yasnippet" nil nil)
                       ("concat" "(concat $0)" "concat" nil nil nil "/home/nico/.emacs.d/snippets/emacs-lisp-mode/concat.yasnippet" nil nil)
                       ("cdr" "(cdr $0)" "cdr" nil nil nil "/home/nico/.emacs.d/snippets/emacs-lisp-mode/cdr.yasnippet" nil nil)
                       ("car" "(car $0)" "car" nil nil nil "/home/nico/.emacs.d/snippets/emacs-lisp-mode/car.yasnippet" nil nil)
                       ("bs" "(buffer-substring START$0 END)" "buffer-substring" nil nil nil "/home/nico/.emacs.d/snippets/emacs-lisp-mode/buffer-substring.yasnippet" nil nil)
                       ("bsnp" "(buffer-substring-no-properties START$0 END)" "buffer-substring-no-properties" nil nil nil "/home/nico/.emacs.d/snippets/emacs-lisp-mode/buffer-substring-no-properties.yasnippet" nil nil)
                       ("bmp" "(buffer-modified-p $0)" "buffer-modified-p" nil nil nil "/home/nico/.emacs.d/snippets/emacs-lisp-mode/buffer-modified-p.yasnippet" nil nil)
                       ("bfn" "(buffer-file-name)" "buffer-file-name" nil nil nil "/home/nico/.emacs.d/snippets/emacs-lisp-mode/buffer-file-name.yasnippet" nil nil)
                       ("botap" "(bounds-of-thing-at-point '$0) ; symbol, list, sexp, defun, filename, url, email, word, sentence, whitespace, line, page ..." "bounds-of-thing-at-point" nil nil nil "/home/nico/.emacs.d/snippets/emacs-lisp-mode/bounds-of-thing-at-point.yasnippet" nil nil)
                       ("bol" "(beginning-of-line)" "beginning-of-line" nil nil nil "/home/nico/.emacs.d/snippets/emacs-lisp-mode/beginning-of-line.yasnippet" nil nil)
                       ("bc" "(backward-char $0)" "backward-char" nil nil nil "/home/nico/.emacs.d/snippets/emacs-lisp-mode/backward-char.yasnippet" nil nil)
                       ("autoload" "(autoload 'FUNCNAME$0 \"FILENAME\" &optional \"DOCSTRING\" INTERACTIVE TYPE)" "autoload" nil nil nil "/home/nico/.emacs.d/snippets/emacs-lisp-mode/autoload.yasnippet" nil nil)
                       ("assq" "(assq KEY$0 LIST)" "assq" nil nil nil "/home/nico/.emacs.d/snippets/emacs-lisp-mode/assq.yasnippet" nil nil)
                       ("aset" "(aset ARRAY$0 IDX NEWELT)" "aset" nil nil nil "/home/nico/.emacs.d/snippets/emacs-lisp-mode/aset.yasnippet" nil nil)
                       ("aref" "(aref ARRAY$0 INDEX)" "aref" nil nil nil "/home/nico/.emacs.d/snippets/emacs-lisp-mode/aref.yasnippet" nil nil)
                       ("apply" "(apply $0 )" "apply" nil nil nil "/home/nico/.emacs.d/snippets/emacs-lisp-mode/apply.yasnippet" nil nil)
                       ("append" "(append $0 )" "append" nil nil nil "/home/nico/.emacs.d/snippets/emacs-lisp-mode/append.yasnippet" nil nil)
                       ("a" "(and $0)" "and" nil nil nil "/home/nico/.emacs.d/snippets/emacs-lisp-mode/and.yasnippet" nil nil)
                       ("ah" "(add-hook $1 '$0)" "add-hook" nil nil nil "/home/nico/.emacs.d/snippets/emacs-lisp-mode/add-hook.yasnippet" nil nil)))


;;; Do not edit! File generated at Wed Oct  5 10:54:16 2016
