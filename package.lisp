;;;; package.lisp

(defpackage #:cl-blaseball
  (:use #:cl)
  (:nicknames :blaseball)
  (:import-from :plugger
		:defjsonclass
                :defplugs)
  (:export :get-players-by-ids

	   :get-league-by-id
	   :get-subleague-by-id

	   :get-all-divisions
	   :get-division-by-id 

	   :get-all-teams
	   :get-team-by-id

	   :get-global-events))
  
