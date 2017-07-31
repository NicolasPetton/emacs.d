;;; Compiled snippets and support files for `clojure-mode'
;;; Snippet definitions:
;;;
(yas-define-snippets 'clojure-mode
		     '(("use" "(:use [${1:namespace} :only [$0]])" "use" nil nil nil "/home/nico/.emacs.d/etc/yasnippet/snippets/clojure-mode/use.yasnippet" nil nil)
		       ("require" "(:require [${1:namespace} :as [$0]])" "require" nil nil nil "/home/nico/.emacs.d/etc/yasnippet/snippets/clojure-mode/require.yasnippet" nil nil)
		       ("pm" "(${1:name} [${2:this} ${3:args}])" "protocol method" nil nil nil "/home/nico/.emacs.d/etc/yasnippet/snippets/clojure-mode/pm.yasnippet" nil nil)
		       ("ns" "(ns `(clojure-expected-ns)`\n  $0)" "ns" nil nil nil "/home/nico/.emacs.d/etc/yasnippet/snippets/clojure-mode/ns.yasnippet" nil nil)
		       ("method" "(${1:name} [${2:this} ${3:args}]\n  $0)" "method" nil nil nil "/home/nico/.emacs.d/etc/yasnippet/snippets/clojure-mode/method.yasnippet" nil nil)
		       ("letfn" "(letfn [(${1:name) [${2:args}]\n          $0)])" "letfn" nil nil nil "/home/nico/.emacs.d/etc/yasnippet/snippets/clojure-mode/letfn.yasnippet" nil nil)
		       ("let" "(let [$0])" "let" nil nil nil "/home/nico/.emacs.d/etc/yasnippet/snippets/clojure-mode/let.yasnippet" nil nil)
		       ("kwargs" "& {:keys [${1:keys}] :or {${2:defaults}}}" "keyword args" nil nil nil "/home/nico/.emacs.d/etc/yasnippet/snippets/clojure-mode/kwargs.yasnippet" nil nil)
		       ("import" "(:import [${1:package}])" "import" nil nil nil "/home/nico/.emacs.d/etc/yasnippet/snippets/clojure-mode/import.yasnippet" nil nil)
		       ("if" "(if ${1:test-expr}\n  ${2:then-expr}\n  ${3:else-expr})" "if" nil nil nil "/home/nico/.emacs.d/etc/yasnippet/snippets/clojure-mode/if.yasnippet" nil nil)
		       ("fn" "(fn [${1:arg-list}] $0)" "fn" nil nil nil "/home/nico/.emacs.d/etc/yasnippet/snippets/clojure-mode/fn.yasnippet" nil nil)
		       ("deft" "(deftype ${1:Name} [${2:fields}]\n  ${3:Protocol}\n  $0)" "deftype" nil nil nil "/home/nico/.emacs.d/etc/yasnippet/snippets/clojure-mode/deft.yasnippet" nil nil)
		       ("defr" "(defrecord ${1:Name} [${2:fields}]\n  ${3:Protocol}\n  $0)" "defrecord" nil nil nil "/home/nico/.emacs.d/etc/yasnippet/snippets/clojure-mode/defr.yasnippet" nil nil)
		       ("defp" "(defprotocol ${1:Name}\n  $0)" "defprotocol" nil nil nil "/home/nico/.emacs.d/etc/yasnippet/snippets/clojure-mode/defp.yasnippet" nil nil)
		       ("defn" "(defn ${1:name}\n  \"${2:doc-string}\"\n  [${3:arg-list}]\n  $0)" "defn" nil nil nil "/home/nico/.emacs.d/etc/yasnippet/snippets/clojure-mode/defn.yasnippet" nil nil)
		       ("defmm" "(defmulti ${1:name} ${2:dispatch-fn})" "defmulti" nil nil nil "/home/nico/.emacs.d/etc/yasnippet/snippets/clojure-mode/defmm.yasnippet" nil nil)
		       ("defm" "(defmethod ${1:name} ${2:match}\n  [${3:args}]\n  $0)" "defmethod" nil nil nil "/home/nico/.emacs.d/etc/yasnippet/snippets/clojure-mode/defm.yasnippet" nil nil)
		       ("condp" "(condp ${1:pred} ${2:expr}\n  $0)" "condp" nil nil nil "/home/nico/.emacs.d/etc/yasnippet/snippets/clojure-mode/condp.yasnippet" nil nil)
		       ("com" "(comment\n  $0\n  )" "com" nil nil nil "/home/nico/.emacs.d/etc/yasnippet/snippets/clojure-mode/com.yasnippet" nil nil)))


;;; Do not edit! File generated at Fri Jul 28 15:00:24 2017
