;;;; cl-blaseball.asd

(asdf:defsystem #:cl-blaseball
  :description "blaseball api wrapper"
  :author "ava fox"
  :license  "BSD 3-Clause"
  :version "0.0.1"
  :depends-on (:plugger)
  :serial t
  :components ((:file "package")
               (:file "cl-blaseball")))
