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
   name tiebreakers subleagues)
  (:export-accessors))

(defjsonclass subleague ()
  ((id :json-key "_id")
   divisions name))



(defplugs "https://blaseball.com"
    ("allDivisions" (:list division))
    ("division?id={id}" division)

    ("allTeams" (:list team))
    ("team?id={id}" team)

    ("players?ids={ids}" (:list player))

    ("league?id={id}" (:list league))
    ("subleague?id={id}" (:list subleague))

    ("globalEvents" (:list event)))
