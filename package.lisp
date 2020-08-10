;;;; package.lisp

(defpackage #:cl-blaseball
  (:use #:cl)
  (:nicknames :blaseball)
  (:import-from :plugger
		:defjsonclass
                :defplugs)
  (:export ;;functions
           :get-players-by-ids

	   :get-league-by-id
	   :get-subleague-by-id

	   :get-game-by-id

	   :get-all-divisions
	   :get-division-by-id 

	   :get-all-teams
	   :get-team-by-id

	   :get-election
	   :get-election-results-by-season

	   :get-blessing-results-by-id
	   :get-decree-results-by-id

	   :get-playoffs-by-number

	   :get-global-events

	   ;; work on the data we've gotten
	   :calculate-batter-rating
	   :calculate-pitcher-rating

	   ;; classes
	   :division :team :player :event
	   :league :subleague :game 
	   :decree :blessing :election
	   :playoff :election-results))
  
