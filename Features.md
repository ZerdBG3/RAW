# Features

## Classes
* Sneak Attack (Rogue level 1) is now a toggable passive which works on any weapon attack you hit in the turn (including offhand attacks)
* Cunning Action (Rogue level 2) gives Hide and Disengage (besides Dash) as bonus actions as well
* Colossus Slayer (Ranger level 3) now correctly deals bonus damage on offhand attacks
* Arcane Ward (Wizard level 2 - School of Abjuration) now gives `Int Mod + 2*Wizard Level` Temporary HP on first cast of the day and `2*Spell Level` on subsequent casts

## Actions
* Hide and Shove are actions (from bonus actions)
* Introduced Disengage and Dodge as actions to player characters
* Jump only costs Movement, but can't be used while Threatened, unless the character Disengages first
* Diversify Shove with 2 options (Push and Prone)
* Shove's push range is reduced to 1.5 m (from 4 m)

## Spells
* Hold Person now correctly allows a Saving Throw on Turn End instead of Turn Start
* Hex and Hunter's Query now correctly deals bonus damage on offhand attacks

## Global changes
* Removes weapon abilities (like Cleave, Smash and Pin Down)
* Removes Backstabbing from the game
* Removes the auto-failing Strength and Dexterity Saving Throws when Prone
* Nerfs Fire dipped and Poison coating damage to 1 static damage (from 1d4)
* Removes surface creation on most benefitial potions (like healing and resistance potions) - you can't heal people by throwing potions at their feet!

## Feats
* Fixes the AC bonus from Dual Wielder

## Two-Weapon Fighting
* Removes the automatic offhand bonus attack option when Dual Wielding (This fixes Dual Wielding AoO as well)
* The Offhand Attack is only available after attacking with the main hand weapon while Dual Wielding (or when outside of Combat)
* There's a partial fix to Offhand's attack and damage roll:
  * The attack roll uses the main hand weapon, so the ability is Dexterity for finesse (if higher than Strength) or Strength for the rest
  * The damage roll subtracts the ability modifier to correct vanilla's damage. It subtracts Dexterity if the weapon is finesse (if higher than Strength) and Strength if it's not
  * _If the main hand weapon is magic, the bonus on attack roll will pass to the offhand attack as well_
