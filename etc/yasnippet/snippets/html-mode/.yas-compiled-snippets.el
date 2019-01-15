;;; Compiled snippets and support files for `html-mode'
;;; Snippet definitions:
;;;
(yas-define-snippets 'html-mode
		     '(("title" "<title>$1</title>" "<title>...</title>" nil nil nil "/home/nico/.emacs.d/etc/yasnippet/snippets/html-mode/title" nil nil)
		       ("textarea" "<textarea name=\"$1\" id=\"$2\" rows=\"$3\" cols=\"$4\" tabindex=\"$5\"></textarea>" "<textarea ...></textarea>" nil nil nil "/home/nico/.emacs.d/etc/yasnippet/snippets/html-mode/textarea" nil nil)
		       ("style" "<style type=\"text/css\" media=\"${1:screen}\">\n  $0\n</style>" "<style type=\"text/css\" media=\"...\">...</style>" nil nil nil "/home/nico/.emacs.d/etc/yasnippet/snippets/html-mode/style" nil nil)
		       ("span" "<span id=\"$1\">$2</span>" "<span id=\"...\">...</span>" nil nil nil "/home/nico/.emacs.d/etc/yasnippet/snippets/html-mode/span.id" nil nil)
		       ("span" "<span class=\"$1\">$2</span>" "<span class=\"...\">...</span>" nil nil nil "/home/nico/.emacs.d/etc/yasnippet/snippets/html-mode/span.class" nil nil)
		       ("span" "<span>$1</span>" "<span>...</span>" nil nil nil "/home/nico/.emacs.d/etc/yasnippet/snippets/html-mode/span" nil nil)
		       ("script" "<script type=\"text/javascript\" src=\"$1\"></script>" "<script type=\"text/javascript\" src=\"...\"></script>" nil nil nil "/home/nico/.emacs.d/etc/yasnippet/snippets/html-mode/script.javascript-src" nil nil)
		       ("script" "<script type=\"text/javascript\">\n  $0\n</script>" "<script type=\"text/javascript\">...</script>" nil nil nil "/home/nico/.emacs.d/etc/yasnippet/snippets/html-mode/script.javascript" nil nil)
		       ("quote" "<blockquote>\n  $1\n</blockquote>" "<blockquote>...</blockquote>" nil nil nil "/home/nico/.emacs.d/etc/yasnippet/snippets/html-mode/quote" nil nil)
		       ("q" "<blockquote>\n$0\n</blockquote>" "<blockquote>...</blockquote>" nil nil nil "/home/nico/.emacs.d/etc/yasnippet/snippets/html-mode/q.yasnippet" nil nil)
		       ("pre" "<pre>\n  $0\n</pre>" "<pre>...</pre>" nil nil nil "/home/nico/.emacs.d/etc/yasnippet/snippets/html-mode/pre" nil nil)
		       ("p" "<p>$1</p>" "<p>...</p>" nil nil nil "/home/nico/.emacs.d/etc/yasnippet/snippets/html-mode/p" nil nil)
		       ("mailto" "<a href=\"mailto:$1@$2\">$0</a>" "<a href=\"mailto:...@...\">...</a>" nil nil nil "/home/nico/.emacs.d/etc/yasnippet/snippets/html-mode/mailto" nil nil)
		       ("link" "<!--[if IE]>\n<link rel=\"${1:stylesheet}\" href=\"${2:url}\" type=\"${3:text/css}\" media=\"${4:screen}\" />\n<![endif]-->" "<!--[if IE]><link stylesheet=\"...\" /><![endif]-->" nil nil nil "/home/nico/.emacs.d/etc/yasnippet/snippets/html-mode/link.stylesheet-ie" nil nil)
		       ("link" "<link rel=\"${1:stylesheet}\" href=\"${2:url}\" type=\"${3:text/css}\" media=\"${4:screen}\" />" "<link stylesheet=\"...\" />" nil nil nil "/home/nico/.emacs.d/etc/yasnippet/snippets/html-mode/link.stylesheet" nil nil)
		       ("input" "<input type=\"$1\" name=\"$2\" value=\"$3\" />" "<input ... />" nil nil nil "/home/nico/.emacs.d/etc/yasnippet/snippets/html-mode/input" nil nil)
		       ("img" "<img src=\"$1\" class=\"$2\" alt=\"$3\" />" "<img src=\"...\" class=\"...\" alt=\"...\" />" nil nil nil "/home/nico/.emacs.d/etc/yasnippet/snippets/html-mode/img" nil nil)
		       ("i" "<i>$0</i>" "<i>...</i>" nil nil nil "/home/nico/.emacs.d/etc/yasnippet/snippets/html-mode/i.yasnippet" nil nil)
		       ("html" "<html xmlns=\"http://www.w3.org/1999/xhtml\" xml:lang=\"${1:en}\" lang=\"${2:en}\">\n  $0\n</html>" "<html xmlns=\"...\">...</html>" nil nil nil "/home/nico/.emacs.d/etc/yasnippet/snippets/html-mode/html.xmlns" nil nil)
		       ("html" "<html>\n  $0\n</html>" "<html>...</html>" nil nil nil "/home/nico/.emacs.d/etc/yasnippet/snippets/html-mode/html" nil nil)
		       ("href" "<a href=\"$1\">$2</a>" "<a href=\"...\">...</a>" nil nil nil "/home/nico/.emacs.d/etc/yasnippet/snippets/html-mode/href" nil nil)
		       ("hr" "<hr />" "<hr />" nil nil nil "/home/nico/.emacs.d/etc/yasnippet/snippets/html-mode/hr" nil nil)
		       ("head" "<head>\n  $0\n</head>" "<head>...</head>" nil nil nil "/home/nico/.emacs.d/etc/yasnippet/snippets/html-mode/head" nil nil)
		       ("form" "<form method=\"$1\" id=\"$2\" action=\"$3\">\n  $0\n</form>" "<form method=\"...\" id=\"...\" action=\"...\"></form>" nil nil nil "/home/nico/.emacs.d/etc/yasnippet/snippets/html-mode/form" nil nil)
		       ("dov" "a mirror up here $3\n\n\n<dov ${1:id=\"${2:some_id and here comes another nested field: ${3:nested_shit}}\"}>\n    $0\n</dov>\n<dov $1>\n    actually some other shit and $3\n</dov>" "<dov...>...</dov>" nil nil nil "/home/nico/.emacs.d/etc/yasnippet/snippets/html-mode/dov" nil nil)
		       ("div" "<div id=\"$1\" class=\"$2\">\n  $0\n</div>" "<div id=\"...\" class=\"...\">...</div>" nil nil nil "/home/nico/.emacs.d/etc/yasnippet/snippets/html-mode/div.id-class" nil nil)
		       ("div" "<div id=\"$1\">\n  $0\n</div>" "<div id=\"...\">...</div>" nil nil nil "/home/nico/.emacs.d/etc/yasnippet/snippets/html-mode/div.id" nil nil)
		       ("div" "<div class=\"$1\">\n  $0\n</div>" "<div class=\"...\">...</div>" nil nil nil "/home/nico/.emacs.d/etc/yasnippet/snippets/html-mode/div.class" nil nil)
		       ("div" "<div${1: id=\"${2:some_id}\"}${3: class=\"${4:some_class}\"}>$0</div>" "<div...>...</div>" nil nil nil "/home/nico/.emacs.d/etc/yasnippet/snippets/html-mode/div" nil nil)
		       ("code" "<code class=\"$1\">\n  $0\n</code>" "<code class=\"...\">...</code>" nil nil nil "/home/nico/.emacs.d/etc/yasnippet/snippets/html-mode/code.class" nil nil)
		       ("code" "<code>\n  $0\n</code>" "<code>...</code>" nil nil nil "/home/nico/.emacs.d/etc/yasnippet/snippets/html-mode/code" nil nil)
		       ("br" "<br />" "<br />" nil nil nil "/home/nico/.emacs.d/etc/yasnippet/snippets/html-mode/br" nil nil)
		       ("body" "<body$1>\n  $0\n</body>" "<body>...</body>" nil nil nil "/home/nico/.emacs.d/etc/yasnippet/snippets/html-mode/body" nil nil)
		       ("b" "<b>$0</b>" "<b>...</b>" nil nil nil "/home/nico/.emacs.d/etc/yasnippet/snippets/html-mode/b.yasnippet" nil nil)))


;;; Snippet definitions:
;;;
(yas-define-snippets 'html-mode
		     '(("h6" "<h6>$1</h6>" "<h6>...</h6>" nil
			("header")
			nil "/home/nico/.emacs.d/etc/yasnippet/snippets/html-mode/header/h6" nil nil)
		       ("h5" "<h5>$1</h5>" "<h5>...</h5>" nil
			("header")
			nil "/home/nico/.emacs.d/etc/yasnippet/snippets/html-mode/header/h5" nil nil)
		       ("h4" "<h4>$1</h4>" "<h4>...</h4>" nil
			("header")
			nil "/home/nico/.emacs.d/etc/yasnippet/snippets/html-mode/header/h4" nil nil)
		       ("h3" "<h3>$1</h3>" "<h3>...</h3>" nil
			("header")
			nil "/home/nico/.emacs.d/etc/yasnippet/snippets/html-mode/header/h3" nil nil)
		       ("h2" "<h2>$1</h2>" "<h2>...</h2>" nil
			("header")
			nil "/home/nico/.emacs.d/etc/yasnippet/snippets/html-mode/header/h2" nil nil)
		       ("h1" "<h1>$1</h1>" "<h1>...</h1>" nil
			("header")
			nil "/home/nico/.emacs.d/etc/yasnippet/snippets/html-mode/header/h1" nil nil)))


;;; Snippet definitions:
;;;
(yas-define-snippets 'html-mode
		     '(("ul" "<ul id=\"$1\">\n  $0\n</ul>" "<ul id=\"...\">...</ul>" nil
			("list")
			nil "/home/nico/.emacs.d/etc/yasnippet/snippets/html-mode/list/ul.id" nil nil)
		       ("ul" "<ul class=\"$1\">\n  $0\n</ul>" "<ul class=\"...\">...</ul>" nil
			("list")
			nil "/home/nico/.emacs.d/etc/yasnippet/snippets/html-mode/list/ul.class" nil nil)
		       ("ul" "<ul>\n  $0\n</ul>" "<ul>...</ul>" nil
			("list")
			nil "/home/nico/.emacs.d/etc/yasnippet/snippets/html-mode/list/ul" nil nil)
		       ("ol" "<ol id=\"$1\">\n  $0\n</ol>" "<ol id=\"...\">...</ol>" nil
			("list")
			nil "/home/nico/.emacs.d/etc/yasnippet/snippets/html-mode/list/ol.id" nil nil)
		       ("ol" "<ol class=\"$1\">\n  $0\n</ol>" "<ol class=\"...\">...</ol>" nil
			("list")
			nil "/home/nico/.emacs.d/etc/yasnippet/snippets/html-mode/list/ol.class" nil nil)
		       ("ol" "<ol>\n  $0\n</ol>" "<ol>...</ol>" nil
			("list")
			nil "/home/nico/.emacs.d/etc/yasnippet/snippets/html-mode/list/ol" nil nil)
		       ("li" "<li class=\"$1\">$2</li>" "<li class=\"...\">...</li>" nil
			("list")
			nil "/home/nico/.emacs.d/etc/yasnippet/snippets/html-mode/list/li.class" nil nil)
		       ("li" "<li>$1</li>" "<li>...</li>" nil
			("list")
			nil "/home/nico/.emacs.d/etc/yasnippet/snippets/html-mode/list/li" nil nil)
		       ("dt" "<dt>$1</dt>" "<dt> ... </dt>" nil
			("list")
			nil "/home/nico/.emacs.d/etc/yasnippet/snippets/html-mode/list/dt" nil nil)
		       ("dl" "<dl id=\"$1\">\n    $0\n</dl>" "<dl> ... </dl>" nil
			("list")
			nil "/home/nico/.emacs.d/etc/yasnippet/snippets/html-mode/list/dl.id" nil nil)
		       ("dl" "<dl>\n    $0\n</dl>" "<dl> ... </dl>" nil
			("list")
			nil "/home/nico/.emacs.d/etc/yasnippet/snippets/html-mode/list/dl" nil nil)
		       ("dd" "<dd>$1</dd>" "<dd> ... </dd>" nil
			("list")
			nil "/home/nico/.emacs.d/etc/yasnippet/snippets/html-mode/list/dd" nil nil)))


;;; Snippet definitions:
;;;
(yas-define-snippets 'html-mode
		     '(("meta" "<meta http-equiv=\"${1:Content-Type}\" content=\"${2:text/html; charset=UTF-8}\" />" "<meta http-equiv=\"...\" content=\"...\" />" nil
			("meta")
			nil "/home/nico/.emacs.d/etc/yasnippet/snippets/html-mode/meta/meta.http-equiv" nil nil)
		       ("meta" "<meta name=\"${1:generator}\" content=\"${2:content}\" />" "<meta name=\"...\" content=\"...\" />" nil
			("meta")
			nil "/home/nico/.emacs.d/etc/yasnippet/snippets/html-mode/meta/meta" nil nil)
		       ("doctype" "<!DOCTYPE html PUBLIC \"-//W3C//DTD XHTML 1.0 Transitional//EN\" \"http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd\">" "DocType XHTML 1.0 Transitional" nil
			("meta")
			nil "/home/nico/.emacs.d/etc/yasnippet/snippets/html-mode/meta/doctype.xhtml1_transitional" nil nil)
		       ("doctype" "<!DOCTYPE html PUBLIC \"-//W3C//DTD XHTML 1.0 Strict//EN\" \"http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd\">" "DocType XHTML 1.0 Strict" nil
			("meta")
			nil "/home/nico/.emacs.d/etc/yasnippet/snippets/html-mode/meta/doctype.xhtml1_strict" nil nil)
		       ("doctype" "<!DOCTYPE html PUBLIC \"-//W3C//DTD XHTML 1.1//EN\" \"http://www.w3.org/TR/xhtml11/DTD/xhtml11.dtd\">" "DocType XHTML 1.1" nil
			("meta")
			nil "/home/nico/.emacs.d/etc/yasnippet/snippets/html-mode/meta/doctype.xhtml1_1" nil nil)
		       ("doctype" "<!DOCTYPE html PUBLIC \"-//W3C//DTD XHTML 1.0 Frameset//EN\" \"http://www.w3.org/TR/xhtml1/DTD/xhtml1-frameset.dtd\">" "DocType XHTML 1.0 frameset" nil
			("meta")
			nil "/home/nico/.emacs.d/etc/yasnippet/snippets/html-mode/meta/doctype.xhml1" nil nil)
		       ("doctype" "<!DOCTYPE HTML PUBLIC \"-//W3C//DTD HTML 4.01//EN\" \"http://www.w3.org/TR/html4/strict.dtd\">" "Doctype HTML 4.01 Strict" nil
			("meta")
			nil "/home/nico/.emacs.d/etc/yasnippet/snippets/html-mode/meta/doctype" nil nil)))


;;; Snippet definitions:
;;;
(yas-define-snippets 'html-mode
		     '(("tr" "<tr>\n  $0\n</tr>" "<tr>...</tr>" nil
			("table")
			nil "/home/nico/.emacs.d/etc/yasnippet/snippets/html-mode/table/tr" nil nil)
		       ("th" "<th$1>$2</th>" "<th>...</th>" nil
			("table")
			nil "/home/nico/.emacs.d/etc/yasnippet/snippets/html-mode/table/th" nil nil)
		       ("td" "<td$1>$2</td>" "<td>...</td>" nil
			("table")
			nil "/home/nico/.emacs.d/etc/yasnippet/snippets/html-mode/table/td" nil nil)
		       ("table" "<table width=\"$1\" cellspacing=\"$2\" cellpadding=\"$3\" border=\"$4\">\n  $0\n</table>" "<table ...>...</table>" nil
			("table")
			nil "/home/nico/.emacs.d/etc/yasnippet/snippets/html-mode/table/table" nil nil)))


;;; Do not edit! File generated at Mon Jan  7 17:38:42 2019
