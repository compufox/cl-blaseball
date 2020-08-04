;;;; cl-blaseball-streaming.asd

(asdf:defsystem #:cl-blaseball-streaming
  :description "blaseball streaming wrapper"
  :author "ava fox"
  :license  "BSD 3-Clause"
  :version "0.0.1"
  :depends-on (:websocket-driver)
  :serial t
  :components ((:file "cl-blaseball-streaming")))
