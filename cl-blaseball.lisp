;;;; cl-blaseball.lisp

(in-package #:cl-blaseball)

(setq plugger:*api-root* "/database/")

(defjsonclass division ()
  ((id :json-key "_id")
   (teams :json-type :list)
   name)
  (:export-accessors))

(defjsonclass team ()
  ((id :json-key "_id")
   (lineup :json-type :list)
   (rotation :json-type :list)
   (bullpen :json-type :list)
   (bench :json-type :list)
   (season-attributes :json-type :list)
   (permanent-attributes :json-type :list)
   full-name location
   main-color nickname secondary-color
   shorthand emoji slogan shame-runs
   total-shames total-shamings season-shames
   season-shamings championships)
  (:export-accessors))

(defjsonclass player ()
  ((id :json-key "_id")
   anticapitalism base-thirst buoyancy chasiness
   coldness continuation divinity ground-friction
   indulgence laserlikeness martyrdom moxie
   musclitude name omniscience overpowerment
   patheticism ruthlessness shakespearianism
   tenaciousness thwackability tragicness
   unthwackability watchfulness pressurization
   total-fingers soul deceased peanut-allergy
   cinnamon fate bat)
  (:export-accessors))

(defjsonclass event ()
  ((id :json-key "_id")
   (v :json-key "__v")
   msg)
  (:export-accessors))

(defjsonclass league ()
  ((id :json-key "_id")
   (tiebreakers :json-type :list)
   (subleagues :json-type :list)
   name)
  (:export-accessors))

(defjsonclass subleague ()
  ((id :json-key "_id")
   divisions name)
  (:export-accessors))

(defjsonclass game ()
  ((id :json-key "_id")
   (phase-state :json-key "phase")
   (bases-occupied :json-type :list)
   (base-runners :json-type :list)
   (outcomes :json-type :list)
   terminology last-update rules statsheet away-pitcher
   away-pitcher-name away-batter away-batter-name
   away-team away-team-name away-team-nickname
   away-team-color away-team-emoji away-odds
   away-strikes away-score away-team-batter-count
   home-pitcher home-pitcher-name home-batter
   home-batter-name home-team home-team-name 
   home-team-nickname home-team-color home-team-emoji
   home-odds home-strikes home-score home-team-batter-count
   season is-postseason day game-complete finalized
   game-start half-inning outs half-inning-score inning
   top-of-inning at-bat-balls at-bat-strikes series-index
   series-length shame weather baserunner-count)
  (:export-accessors))

(defjsonclass decree ()
  ((id :json-key "_id")
   (kind :json-key "type")
   (votes :initform 0)
   title description)
  (:export-accessors))

(defjsonclass blessing ()
  ((id :json-key "_id")
   (kind :json-key "type")
   (votes :initform 0)
   title description value)
  (:export-accessors))

(defjsonclass election ()
  ((decrees :json-type (:list decree))
   (blessings :json-key "bonuses"
	      :json-type (:list blessing))
   decrees-to-pass)
  (:export-accessors))

(defjsonclass playoff ()
  ((id :json-key "_id")
   (v :json-key "__v")
   (rounds :json-type :list)
   name number-of-rounds playoff-day season
   winner tomorrow-round)
  (:export-accessors))

(defjsonclass election-results ()
  ((id :json-key "_id")
   (v :json-key "__v")
   (blessings :json-key "bonusResults"
	      :json-type :list)
   (decrees :json-key "decreeResults"
	    :json-type :list)
   (total-blessing-votes :json-key "totalBonusVotes"
			 :votes 0)
   (total-decree-votes :initform 0)
   (vote-count :initform 0)
   name season)
  (:export-accessors))

(defplugs "https://blaseball.com"
    ("allDivisions" (:list division))
    ("division?id={id}" division)

    ("allTeams" (:list team))
    ("team?id={id}" team)

    ("gameById/{id}" game)

    ("offseasonSetup" election :fn-name get-election)

    ("offseasonRecap?season={season}" election-results
				      :fn-name get-election-results-by-season)

    ("bonusResults?ids={ids}" blessing :fn-name get-blessing-results-by-ids)

    ("decreeResults?ids={ids}" decree)

    ("playoffs?number={number}" playoff)

    ("players?ids={ids}" (:list player))

    ("league?id={id}" (:list league))
    ("subleague?id={id}" (:list subleague))

    ("globalEvents" (:list event)))


(defun calculate-pitcher-rating (player)
  "calculates the star rating PLAYER has as a pitcher"
  (with-slots (shakespearianism unthwackability coldness
	       overpowerment ruthlessness) player
    (let ((base (* (expt shakespearianism .1) (expt unthwackability .5)
		   (expt coldness .025) (expt overpowerment .15)
		   (expt ruthlessness .4))))
      (coerce (/ (round (realpart (/ (* 10 base) 2)) .5)
		 2)
	      'float))))

(defun calculate-batter-rating (player)
  "calculates the star rating PLAYER has as a batter"
  (with-slots (tragicness thwackability moxie divinity
	       musclitude patheticism martyrdom) player
    (let ((base (* (expt (1- tragicness) .01) (expt thwackability .35)
		   (expt moxie .075) (expt divinity .35) (expt musclitude .075)
		   (expt (1- patheticism) .05) (expt martyrdom .02))))
      (coerce (/ (round (realpart (/ (* 10 base) 2)) .5)
		 2)
	      'float))))
  
