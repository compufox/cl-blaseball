# cl-blaseball
### _ava fox_

lisp api for the great game of blaseball

## Install

```shell
$ git clone https://github.com/compufox/plugger ~/common-lisp/plugger
$ git clone https://github.com/compufox/cl-blaseball ~/common-lisp/cl-blaseball
```

## Functions

`(get-all-divisions)`

returns a list of division objects

---

`(get-all-teams)`

returns a list of all team objects

---

`(get-players-by-ids id)`

returns a list of players based off of ID

ID is a singular player id, or a string of comma
separated player ids

---

`(get-global-events)`

returns a list of events (ticker messages)

---

`(get-league-by-id id)`

returns a list of league objects associated with ID

---

`(get-subleague-by-id id)`

returns a list of subleagues associated with ID

---

## Classes

`event`

### Slots

`id`: string

`v`: integer

`msg`: string

---

`player`

### Slots

`id`: string

`anticapitalism`: float - unknown

`base-thirst`: float - unknown

`buoyancy`: float - unknown

`chasiness`: float - unknown

`coldness`: float - unknown

`continuation`: float - unknown

`divinity`: float - unknown

`ground-friction`: float - unknown

`indulgence`: float - unknown

`laserlikeness`: float - unknown

`martyrdom`: float - unknown

`moxie`: float - unknown

`musclitude`: float - unknown

`name`: string - the player's name

`omniscience`: float - unknown

`overpowerment`: float - unknown

`patheticism`: float - unknown

`ruthlessness`: float - unknown

`shakespearianism`: float - unknown

`tenaciousness`: float - unknown

`thwackability`: float - unknown

`tragicness`: float - unknown

`unthwackability`: float - unknown

`watchfulness`: float - unknown

`pressurization`: float - unknown

`total-fingers`: integer - the amount of fingers the player has

`soul`: float - unknown

`deceased`: boolean - whether the player is dead or not

---

`team`

### Slots 

`id`: string

`lineup`: list of strings - IDs of players on the team's fielded roster

`rotation`: list of strings - IDs of players starting pitchers

`bullpen`: list of strings - IDs of players in the team's bullpen

`bench`: list of strings - IDs of players on the team but not in the game

`season-attributes`: list of strings - unknown

`permanent-attributes`: list of strings - unknown

`full-name`: string - full name (location + nickname) of the team

`location`: string - team's hometown

`main-color`: string - background color of the team's icon

`nickname`: string - team's unique noun descriptor

`secondary-color`: string - foreground color of the team's icon

`shorthand`: string - scorecard abbreviation for the team

`emoji`: string - hex value of the team's emoji

`slogan`: string - team's slogan

`shame-runs`: integer - the number of runs the team has given up while shamed

`total-shames`: integer - total amount of times the team has been shamed

`total-shamings`: integer - total amount of times the team has shamed another team

`season-shames`: integer - number of times the team has been shamed this season

`season-shamings`: integer - number of times the team has shamed another team this season

`championships`: integer - number of championships won

---

`division`

### Slots

`id`: string

`name`: string - name of division

`teams`: list of strings - IDs of all teams in division

---

`league`

### Slots


`id`: string

`name`: string - name of the league

`subleagues`: list of strings - IDs of the subleague that belong to the league

`tiebreakers`: string - unknown

---

`subleague`

### Slots

`id`: string

`name`: string - subleague name

`divisions`: list of strings - divisions the subleague belongs to

---

## Thanks

[The Unofficial API Spec](https://github.com/Corvimae/blaseball-api-spec)

The Commissioner (who is doing a great job)

Society for Internet Blaseball Research

👟 The Charleston Shoe Thieves 👟

## License

BSD 3-Clause

