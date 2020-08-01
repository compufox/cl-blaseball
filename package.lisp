;;;; package.lisp

(defpackage #:cl-blaseball
  (:use #:cl)
  (:nicknames :blaseball)
  (:import-from :plugger
		:defjsonclass
                :defplugs)
  (:export :get-players-by-ids
	   :get-all-divisions
	   :get-all-teams
	   :get-global-events))
  
