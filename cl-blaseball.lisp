;;;; cl-blaseball.lisp

(in-package #:cl-blaseball)

(setq plugger:*api-root* "/database/")

(defjsonclass division ()
  ((id :json-key "_id") name teams)
  (:export-accessors))

(defjsonclass team ()
  ((id :json-key "_id")
   lineup rotation bullpen bench season-attributes
   permanent-attributes full-name location
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
   total-fingers soul deceased)
  (:export-accessors))

(defjsonclass event ()
  ((id :json-key "_id")
   (v :json-key "__v")
   msg)
  (:export-accessors))

(defplugs "https://blaseball.com"
    ("allDivisions" (:list division))
    ("allTeams" (:list team))
    ("players?ids={ids}" (:list player))
    ("globalEvents" (:list event)))
