# Features

## Classes
* Druid:
  - Level 2: Wild Shape dismissal costs a bonus action
  - Level 2: Wild Shape Giant Badger changes to attacks and movements
  - Level 2 (Circle of the Land): Replaces Dire Wolf with Wolf for Circle of the Land Druids
  - Level 2 (Circle of the Moon): Changed stats of Dire Wolf to match Monster's Manual stats
  - Level 2 (Circle of the Moon): Polar Bear is replaced with Brown Bear, visual and stat wise
* Ranger:
  - Level 1: Hunter's Mark counts as a separate damage entry and can critically strike
  - Level 3 (Hunter): Colossus Slayer correctly deals bonus damage on offhand attacks
* Rogue:
  - Level 1: Sneak Attack is a toggable passive which works on any weapon attack you hit in the turn (including offhand attacks), still obeying to the Sneak Attack rules
  - Level 2: Cunning Action gives Hide as a bonus action (in addition to Dash and Disengage)
  - Level 3 (Thief): Fast Hands no longer provides an extra Bonus Action - instead, it gives Help and Distract as possible Cunning Actions (bonus action)
  - Level 3 (Thief): Second-Story Work now replaces Jump for a Dexterity-based version
* Wizard:
  - Level 1 (Abjuration School): Arcane Ward subsequent abjuration casts after the first of the day provides the correct `2*Spell Level THP`

## Actions
* Hide is an action (from bonus action)
* Shove is an action (from bonus action). It's a spell container with the option to push (fixed 1.5 m) or knock prone
* Introduces Distract and Dodge as actions to player characters
* Removes Bonus Action Cost from Jump, but can only be used once per turn
* Help stabilises the target (Medicine `DC 10`), and the stabilised character is healed once out of combat

## Spells
* Chromatic Orb deals `3d8` for all damage types, without surface creation
* False Life provides `1d4+4 THP` instead of `7 THP` (plus `5` per spell slot above first) and ends with a Short Rest
* Goodberry provides 10 berries, each healing `1 HP`
* Hex and Hunter's Mark reapplication period end with a Short Rest
* Produce Flame is a spell container, with instant attacking as an option (QoL and fixes for Wisdom scaling)
* Searing Smite is a Shout/Concentration spell that requires concentration to both the initial hit application and the damage per turn effect

## Hit Dice
* Short Rest puts the characters in a standby mode and provides them with 2 new spells
  - Regain Hit Points: spend 1 Hit Die to recover its value plus the character's Constitution Modifier
  - End Short Rest: Ends the Short Rest standby mode
* Long Rest recharges half the character's level worth of Hit Dice (rounded up)

## Global changes
* Removes weapon abilities (like Cleave, Smash and Pin Down)
* Removes the disadvantage on Strength and Dexterity Saving Throws when Prone, and adds the Disadvantage to Ranged Attack Rolls
* Nerfs Fire dipped and Poison coating damage to 1 static damage (from `1d4`)
* Removes surface creation on most benefitial potions (like healing and resistance potions) - you can't heal people by throwing potions at their feet!
* Adds Heavy Armor to various locations and traders

## Two-Weapon Fighting
* Removes the automatic offhand bonus attack option when Dual Wielding (This removes Dual Wielding AoO as well)
* The Offhand Attack is only available after attacking with the main hand weapon while Dual Wielding (or when outside of Combat)
