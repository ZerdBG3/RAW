# Features

## Classes
* Barbarian:
  - Level 1: Fixes Rage so it only deals damage on actual hits, from Strength-based melee weapons
  - Level 2: Reckless Attack is a toggleable passive which provides advantage only on Strength-based melee weapons attacks (and if no other attack without the passive was made previously on the same turn). The advantage can be used on all attacks on the same turn, and it can't proc on AoO
  - Level 3 (Path of the Berserker): Removed Throw as a bonus action
  - Level 3 (Path of the Totem Warrior): Removed all custom spells added by each Spirit Animal
* Druid:
  - Level 2: Wild Shape dismissal costs a bonus action
  - Level 2: Wild Shape Giant Badger changes to attacks and movements
  - Level 2 (Circle of the Land): Replaces Dire Wolf with Wolf for Circle of the Land Druids
  - Level 2 (Circle of the Land): Natural Recovery is only usable during a Short Rest
  - Level 2 (Circle of the Moon): Changed stats of Dire Wolf to match Monster's Manual stats
  - Level 2 (Circle of the Moon): Polar Bear is replaced with Brown Bear, visual and stat wise
* Ranger:
  - Level 1: Hunter's Mark counts as a separate damage entry and can critically strike
  - Level 3 (Hunter): Colossus Slayer correctly deals bonus damage on offhand attacks
* Rogue:
  - Level 1: Sneak Attack is a toggleable passive which works on any weapon attack you hit in the turn (including offhand attacks), still obeying to the Sneak Attack rules
  - Level 2: Cunning Action gives Hide as a bonus action (in addition to Dash and Disengage)
  - Level 3 (Thief): Fast Hands no longer provides an extra Bonus Action - instead, it gives Help, Distract and Throw (no damage) as possible Cunning Actions (bonus action)
  - Level 3 (Thief): Second-Story Work now replaces Jump for a Dexterity-based version
* Wizard:
  - Level 1 (Abjuration School): Arcane Ward subsequent abjuration casts after the first of the day provides the correct `2*Spell Level THP`
  - Level 1: Arcane Recovery is only usable during a Short Rest

## Actions
* Hide is an action (from bonus action)
* Shove is an action (from bonus action). It's a spell container with the option to push (fixed 1.5 m) or knock prone
* Introduces Distract and Dodge as actions to player characters
* Removes Bonus Action Cost from Jump, but can only be used once per turn
* Help stabilises the target (Medicine `DC 10`), and the stabilised character is healed once out of combat
* Throw and Improvised Weapon can no longer be used on enemies that are alive, and can't throw equipped items either. Throwing a weapon from inventory counts as an improvised weapon (`1d4 bludgeoning` damage)
* Thrown Weapons now provide specific spells that correctly calculate Range, Attack Roll, and Damage Roll, while also allowing for Two-Weapon Fighting and correctly applying Sneak Attack

## Feats
* Shield Master: Gives Shove (both options) as a bonus action after attacking on your turn

## Spells
* Chromatic Orb deals `3d8` for all damage types, without surface creation
* Entangle applies the Restrained condition upon casting (and gives a temporary spell for removal attempts). The vine surfaces are only considered difficult terrain and no longer entangle characters walking on it
* False Life provides `1d4+4 THP` instead of `7 THP` (plus `5` per spell slot above first)
* Goodberry provides 10 berries, each healing `1 HP`
* Produce Flame is a spell container, with instant attacking as an option (QoL and fixes for Wisdom scaling)
* Searing Smite is a Shout/Concentration spell that requires concentration to both the initial hit application and the damage per turn effect
* Spells and effects that should have a duration of 10 minutes or 1 hour but were lasting until a Long Rest had their durations adjusted and end with a Short Rest. Spells that last 8 hours or more still last until a Long Rest
  <details>
    <summary>List of Spells with durations changed</summary>
    <p>

      - 10 minutes (100 turns)
        - Darkness
        - Expeditious Retreat
        - Flame Blade
        - Protection from Evil and Good
        - Shield of Faith
        - Silence

      - 1 Hour (600 turns)
        - Armor of Agathys
        - Barkskin
        - Enhance Ability
        - Fog Cloud
        - False Life
        - Invisibility
        - Longstrider
        - Pass without Trace
        - Protection from Poison

      - Infinite, but still ends with Short Rest
        - Disguise Self
        - Hex
        - Hunter's Mark

    </p>
  </details>

* Removes surface interaction for spells that are not AoE. They can still interact with surfaces, but must target the ground directly, instead of interacting when targeting a character on top of the surface
  <details>
    <summary>List of Spells with surface interaction changed</summary>
    <p>

      - Firebolt
      - Produce Flame
      - Ray of Frost
      - Scorching Ray
      - Shocking Grasp

    </p>
  </details>

## Short Rests & Hit Dice
* Short Rest puts the characters in a standby mode and provides them with 2 new spells
  - Regain Hit Points: spend 1 Hit Die to recover its value plus the character's Constitution Modifier
  - End Short Rest: Ends the Short Rest standby mode
* Some abilities are only available while short resting:
  - Wizard's Arcane Recovery
  - Druid's Natural Recovery (Circle of the Land)
* Short Rest is considered an hour long downtime period, thus ending effects that last up to 1 hour
* Long Rest recharges half the character's level worth of Hit Dice (rounded up)

## Global changes
* Removes weapon abilities (like Cleave, Smash and Pin Down)
* Removes the disadvantage on Strength and Dexterity Saving Throws when Prone, and adds the Disadvantage to Ranged Attack Rolls
* Nerfs Fire dipped (also Torch) and Poison coating damage to 1 static damage (from `1d4`)
* Removes surface creation on most benefitial potions (like healing and resistance potions) - you can't heal people by throwing potions at their feet!
* Adds Heavy Armor to various locations and traders

## Two-Weapon Fighting
* Removes the automatic offhand bonus attack option when Dual Wielding (This removes Dual Wielding AoO as well)
* The Offhand Attack is only available after attacking with the main hand weapon while Dual Wielding (or when outside of Combat)
