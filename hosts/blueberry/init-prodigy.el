(require 'prodigy)

(prodigy-define-service
  :name "nicolas-petton.fr"
  :cwd "/home/nico/Public/nicolas-petton.fr"
  :command "python"
  :args '("-m" "SimpleHTTPServer" "6002")
  :port 6002
  :tags '(personal))

(prodigy-define-service
  :name "aurelia.saout.fr"
  :cwd "/home/nico/work/aurelia.saout.fr"
  :command "jekyll"
  :args '("serve" "--watch" "-P" "4002")
  :port 4002
  :tags '(personal))

(prodigy-define-service
  :name "public/"
  :cwd "/home/nico/Public/"
  :command "python"
  :args '("-m" "SimpleHTTPServer" "4003")
  :port 4003
  :tags '(personal))

(prodigy-define-service
  :name "Amber documentation"
  :cwd "/home/nico/work/smalltalk/amber-documentation/"
  :command "jekyll"
  :args '("serve" "--watch" "-P" "4001")
  :port 4001
  :tags '(personal))


(provide 'init-prodigy)
