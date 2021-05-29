# Features

## Classes
* Druid:
  - Level 2: Wild Shape dismissal costs a bonus action
  - Level 2: Wild Shape Giant Badger changes to attacks and movements
  - Level 2 (Circle of the Moon): Polar Bear is replaced with Brown Bear, visual and stat wise
* Ranger:
  - Level 3 (Hunter): Colossus Slayer correctly deals bonus damage on offhand attacks
* Rogue:
  - Level 1: Sneak Attack is a toggable passive which works on any weapon attack you hit in the turn (including offhand attacks), still obeying to the Sneak Attack rules
  - Level 2: Cunning Action gives Hide and Disengage (besides Dash) as bonus actions as well
  - Level 3 (Thief): Fast Hands no longer provides an extra Bonus Action - instead, receives Help as a Bonus Action
  - Level 3 (Thief): Second-Story Work now replaces Jump for a Dexterity-based version
* Wizard:
  - Level 1 (Abjuration School): Arcane Ward subsequent abjuration casts after the first of the day provides the correct `2*Spell Level THP`

## Actions
* Hide and Shove are actions (from bonus actions)
* Introduces Disengage, Dodge and Shove (to Prone) as actions to player characters (single spell container)
* Jump only costs Movement, but can't be used while Threatened (Flanked), unless the character Disengages first. Can only be used one per turn.
* Shove's push range is reduced to `1.5 m` (from `4 m`)
* Help stabilizes the target (Medicine `DC 10`), and the stabilized character is healed once out of combat

## Spells
* False Life provides `1d4+4 THP` instead of `7 THP` (plus `5` per spell slot above first) and ends with a Short Rest
* Goodberry provides 10 berries, each healing `1 HP` (and providing `Satiated`, if using DnDon't Starve)
* Hold Person correctly allows a Saving Throw on `Turn End` instead of `Turn Start`
* Hex and Hunter's Mark correctly deals bonus damage on offhand attacks and end with a Short Rest
* Produce Flame is a spell container, with instant attacking as an option (QoL and fixes for Wisdom scaling)
* Searing Smite is a Shout/Concentration spell that requires concentration to both the initial hit application and the damage per turn effect

## Hit Dice
* Short Rest puts the characters in a standby mode and provides them with 2 new spells
  - Regain Hit Points: spend 1 Hit Die to recover its value plus the character's Constitution Modifier
  - End Short Rest: Ends the Short Rest standby mode
* Long Rest recharges half the character's level worth of Hit Dice (rounded up)

## Global changes
* Removes weapon abilities (like Cleave, Smash and Pin Down)
* Removes Backstabbing from the game
* Removes the auto-failing Strength and Dexterity Saving Throws when Prone
* Nerfs Fire dipped and Poison coating damage to 1 static damage (from `1d4`)
* Removes surface creation on most benefitial potions (like healing and resistance potions) - you can't heal people by throwing potions at their feet!
* Adds Heavy Armor to various locations and traders

## Feats
* Fixes the AC bonus from Dual Wielder

## Two-Weapon Fighting
* Removes the automatic offhand bonus attack option when Dual Wielding (This removes Dual Wielding AoO as well)
* The Offhand Attack is only available after attacking with the main hand weapon while Dual Wielding (or when outside of Combat)
* Vanilla offhand attacks don't add your ability modifier to the attack roll, so I've implemented a partial fix:
  - The attack roll uses the main hand weapon, assuming most of the times, both weapons will have similar properties (finesse being the most important)
  - The downside is that if the main hand weapon is magic, the bonus on attack roll will pass to the offhand attack as well
