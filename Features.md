# Features

Striked through features were present on the EA version of the mod but still aren't implemented on the Full Release version

## Classes
* **Barbarian:**
  - ~~Level 1: Fixes Rage so it only deals damage on actual hits, from Strength-based melee weapons~~
  - **Level 2: Reckless Attack**
    - **Both the Interrupt and the Spell can only be used on the first attack of the turn**
    - **Interrupt changed to no longer consider the roll before asking, so it can always activate even if the attack will hit without needing advantage. Unfortunately, I wasn't able to hide the attack roll. If you use the interrupt without the "asking" option, it will always trigger.**
    - **Attacking Recklessly allows for all attacks on the same turn to be done with advantage (but not after the turn ends, so no advantage on AoO). The enemies can still gain advantage on attacks aganinst the barbarian until the start of the barbairan's next turn**
  - **Level 3 (Path of the Berserker): Removed Throw as a bonus action**
  - **Level 3 (Path of Wild Magic): Makes all bonus actions granted by the random outcomes castable in the first round for free (next rounds it still requires a bonus action)**
  - ~~Level 3 (Path of the Totem Warrior): Removed all custom spells added by each Spirit Animal~~
* **Druid:**
  - **Level 2: Wild Shape allows for spells that require reactivation to be usable (eg.: Heat Metal, Moonbeam, Call Lightning)** 
  - **Level 2 (Circle of the Land): Natural Recovery is only usable during a Short Rest**
  - ~~Level 2: Wild Shape dismissal costs a bonus action~~
  - ~~Level 2: Wild Shape Giant Badger changes to attacks and movements~~
  - ~~Level 2: Wild Shape ends with a Short Rest~~
  - ~~Level 2 (Circle of the Land): Replaces Dire Wolf with Wolf for Circle of the Land Druids~~
  - ~~Level 2 (Circle of the Moon): Changed stats of Dire Wolf to match Monster's Manual stats~~
  - ~~Level 2 (Circle of the Moon): Polar Bear is replaced with Brown Bear, visual and stat wise~~
* **Cleric:**
  - **Level 1: Replaces Produce Flame Cantrip option with Spare The Dying**
* **Ranger:**
  - **Level 1: Hunter's Mark counts as a separate damage entry and can critically strike**
* **Rogue:**
  - **Level 1: Sneak Attack**
    - **Fixes Sneak Attack Interrupt being possible to apply the damage on AoE effects (such as the explosion of a Fire Arrow). Only the main target will be prompted - the side effect is AoEs that roll for attack rolls on each target, such as a Cleave, will only allow you to deal sneak attack damage to the first one**
    - **Removes check for killing blow on Sneak Attack Interrupt. You'll still be able to see the character died, but you can opt into deal your sneak attack regardless (honor system) or if you're not asking to be prompted by the interrupt, it will consume regardless if the base damage killed the target**
    - **Spells no longer consume the Sneak Attack Charge if it missed (thus allowing for retries on other attacks on the same turn, specially offhand attacks)**
  - **Level 2: Cunning Action transformed into a Spell Container**
  - **Level 3 (Thief): Fast Hands no longer provides an extra Bonus Action - instead, it gives Help, Distract and Throw (no damage) as possible Cunning Actions (bonus action)**
  - **Level 3 (Thief): Second-Story Work now replaces Jump for a Dexterity-based version**
* **Wizard:**
  - **Level 1: Arcane Recovery is only usable during a Short Rest**
  - ~~Level 1 (Abjuration School): Arcane Ward subsequent abjuration casts after the first of the day provides the correct `2*Spell Level THP`~~

## Actions
* **Shove is an action (from bonus action). It's a spell container with the option to push (fixed 1.5 m) or knock prone**
* **Introduces Distract and Dodge as actions to player characters and summons (see Find Familiar)**
* **Removes Bonus Action Cost from Jump and the Movement Cost is the same as the distance travelled**
* **Throw and Improvised Weapon can no longer be used on enemies that are alive, and can't throw equipped items either. Throwing a weapon from inventory counts as an improvised weapon (`1d4 bludgeoning` damage)**
* **Thrown Weapons now provide specific spells that correctly calculate Range, Attack Roll, and Damage Roll, while also allowing for Two-Weapon Fighting (and correctly applying Sneak Attack). The range shown is the long range, but it will show the Disadvantage UI if you're attacking outside the short range**
  - _PS.:This still wasn't done properly for magical weapons that are throwable_
* **Help stabilises the target (Medicine `DC 10`), and the stabilised character is healed once out of combat. If the character is stabilised own their own by succeeding the Death Saving Throws, they will still require a Help Action (and the Medicine Check) or a cast of Spare The Dying to regain 1 HP.**

## Feats
* **Shield Master: Gives Shove (both options) as a bonus action after attacking on your turn**

## Spells
* **Call Lightning creates a storm area, inside which the caster can target a smaller area to deal damage each turn**
* **Find Familiar**
  - **Base summons (not the ones granted by Pact of the Chain) had all their attacks replaced by the Distract Action (kept their attack animations because they're cool, though)**
  - **Removed all separate actions they had, except the Cat's Meow, because it has no combat functionality**
  - **Raven now has the Flyby passive, so it doesn't receive AoOs - Since Owl isn't an option in Vanilla, I decided to make Raven the go-to pick for Arcane Tricksters**
* **Flaming Sphere is indesctrutible and ignored by enemies. It can only act if the caster uses their bonus action to command it to.**
* **Shield: fixes the tooltip so it states the bonus AC lasts for only 1 turn**
* **Sleep lasts for 10 turns instead of 2 and it's a circular area, which the targets are selected based on HP on increasing order**
* **Spare the Dying introduced as a new cantrip for Clerics. Stabilises the target (no check required), and the stabilized character is healed once out of combat. If the character is stabilised own their own by succeeding the Death Saving Throws, they will still require a Help Action (and the Medicine Check) or a cast of Spare The Dying to regain 1 HP.**
* **Spiritual Weapon is indesctrutible and ignored by enemies. It can only act if the caster uses their bonus action to command it to (except on the turn it is cast). Also removed all special attacks**
* **Produce Flame is a spell container, with instant attacking as an option (but it seems a bit buggy how the spell container is organizing it)**
* **Removes surface interaction for spells that are not AoE. They can still interact with surfaces, but must target the ground directly, instead of interacting when targeting a character on top of the surface**
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

* ~~Chromatic Orb deals `3d8` for all damage types, without surface creation~~
* ~~Entangle applies the Restrained condition upon casting (and gives a temporary spell for removal attempts). The vine surfaces are only considered difficult terrain and no longer entangle characters walking on it~~
* ~~False Life provides `1d4+4 THP` instead of `7 THP` (plus `5` per spell slot above first)~~
* ~~Goodberry provides 10 berries, each healing `1 HP`~~
* ~~Searing Smite is a Shout/Concentration spell that requires concentration to both the initial hit application and the damage per turn effect~~
* ~~Spells and effects that should have a duration of 10 minutes or 1 hour but were lasting until a Long Rest had their durations adjusted and end with a Short Rest. Spells that last 8 hours or more still last until a Long Rest~~
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

## Short Rests ~~& Hit Dice~~
* **Short Rest puts the characters in a standby mode and provides them with 1 new spell**
  - **End Short Rest: Ends the Short Rest standby mode**
  - ~~Regain Hit Points: spend 1 Hit Die to recover its value plus the character's Constitution Modifier~~
* **Some abilities are only available while short resting:**
  - **Wizard's Arcane Recovery**
  - **Druid's Natural Recovery (Circle of the Land)**
* ~~Short Rest is considered an hour long downtime period, thus ending effects that last up to 1 hour~~
* ~~Long Rest recharges half the character's level worth of Hit Dice (rounded up)~~

## Global changes
* **Changes Initiative Dice Roll from 1d4 to 1d20**
* **Removes weapon abilities (like Cleave, Smash and Pin Down) for default weapons (not on magic weapons yet)**
* **Removes the disadvantage on Strength and Dexterity Saving Throws when Prone, and adds the Disadvantage to Ranged Attack Rolls**
* **Gives a Walk passive to players that allows them to toggle between walking and running for cinematic and roleplay purposes (as requested by fmarzullo)**
* ~~Nerfs Fire dipped (also Torch) and Poison coating damage to 1 static damage (from `1d4`)~~
* ~~Removes surface creation on most benefitial potions (like healing and resistance potions) - you can't heal people by throwing potions at their feet!~~
* ~~Adds Heavy Armor to various locations and traders~~

## Two-Weapon Fighting
* **Removes the automatic offhand bonus attack option when Dual Wielding (This removes Dual Wielding AoO as well)**
* **The Offhand Attack is only available after attacking with the main hand weapon while Dual Wielding (or when outside of Combat)**
