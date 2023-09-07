# Features

## Classes
* **Barbarian:**
  - Level 2: Reckless Attack
    - Both the Interrupt and the Spell can only be used on the first attack of the turn
    - Interrupt changed to no longer consider the roll before asking, so it can always activate even if the attack will hit without needing advantage. Unfortunately, I wasn't able to hide the attack roll. If you use the interrupt without the "asking" option, it will always trigger.
    - Attacking Recklessly allows for all attacks on the same turn to be done with advantage (but not after the turn ends, so no advantage on AoO). The enemies can still gain advantage on attacks aganinst the barbarian until the start of the barbairan's next turn
  - Level 3 (Path of the Berserker): Removed Throw as a bonus action
  - Level 3 (Path of Wild Magic): Makes all bonus actions granted by the random outcomes castable in the first round for free (next rounds it still requires a bonus action)
* **Druid:**
  - Level 2: Wild Shape allows for spells that require reactivation to be usable (eg.: Heat Metal, Moonbeam, Call Lightning) 
  - Level 2 (Circle of the Land): Natural Recovery is only usable during a Short Rest
* **Fighter:**
  - Level 3 (Battle Master): Feinting Attack (Maneuver) fixed to cost a bonus action and a superiority die regardless if the attack hits or misses
* **Ranger:**
  - Level 1: Hunter's Mark counts as a separate damage entry and can critically strike
* **Rogue:**
  - Level 1: Sneak Attack
    - Fixes Sneak Attack Interrupt being possible to apply the damage on AoE effects (such as the explosion of a Fire Arrow). Only the main target will be prompted - the side effect is AoEs that roll for attack rolls on each target, such as a Cleave, will only allow you to deal sneak attack damage to the first one
    - Removes check for killing blow on Sneak Attack Interrupt. You'll still be able to see the character died, but you can opt into deal your sneak attack regardless (honor system) or if you're not asking to be prompted by the interrupt, it will consume regardless if the base damage killed the target
    - Spells no longer consume the Sneak Attack Charge if it missed (thus allowing for retries on other attacks on the same turn, specially offhand attacks)
  - Level 2: Cunning Action provides a toggleable passive (default on) that replaces the action cost for Dash, Disengage and Hide for a Bonus Action. It is automatically disabled when the rogue doesn't have a bonus action or when they're hasted. Cunning Action is also available as a Spell Container with all bonus actions inside it for when the player must enforce the bonus action cost (such as when they're hasted)
  - Level 3 (Thief): Fast Hands no longer provides an extra Bonus Action - instead, it gives Help, Distract and Throw (no damage) as possible Cunning Actions (bonus action). There's a toggleable passive just as above, except for Throw - since it doesn't deal damage, it's not a simple action cost replacement, it's a separate spell kept inside the Cunning Action Spell Container
  - Level 3 (Thief): Second-Story Work now provides a Jump with distance scaling with Dexterity
* **Wizard:**
  - Level 1: Arcane Recovery is only usable during a Short Rest

## Actions
* Shove is an action (from bonus action). It's a spell container with the option to push (fixed 1.5 m) or knock prone. Can be used as part of your Extra Attack
* Introduces Distract and Dodge as actions to player characters and summons (see Find Familiar)
* Removes Bonus Action Cost from Jump and the Movement Cost is the same as the distance travelled
* Throw and Improvised Weapon can no longer be used on enemies that are alive, and can't throw equipped items either. Throwing a weapon from inventory counts as an improvised weapon (`1d4 bludgeoning` damage)
* Thrown Weapons now provide specific spells that correctly calculate Range, Attack Roll, and Damage Roll, while also allowing for Two-Weapon Fighting (and correctly applying Sneak Attack). The range shown is the long range, but it will show the Disadvantage UI if you're attacking outside the short range
* Help stabilizes the target (Medicine `DC 10`), and the stabilized character is healed once out of combat. If the character is stabilized own their own by succeeding the Death Saving Throws, they will still require a Help Action (and the Medicine Check) to regain 1 HP.

## Feats
* Crossbow Expert: Allows shooting more than once with a crossbow during an Extra Attack
* Shield Master: Gives Shove (both options) as a bonus action after attacking on your turn

## Spells
* Call Lightning creates a storm area, inside which the caster can target a smaller area to deal damage each turn
* Feign Death provides a Dismiss spell to the caster
* Find Familiar
  - Base summons (not the ones granted by Pact of the Chain) had all their attacks replaced by the Distract Action (kept their attack animations because they're cool, though)
  - Removed all separate actions they had, except the Cat's Meow, because it has no combat functionality
  - Raven now has the Flyby passive, so it doesn't receive AoOs - Since Owl isn't an option in Vanilla, I decided to make Raven the go-to pick for Arcane Tricksters
* Fireball radius increased from 4 to 6 meters
* Flaming Sphere is indestructible and ignored by enemies. It can only act if the caster uses their bonus action to command it to
* Hail of Thorns converted to a concentration self-buff spell that applies the effect on the next ranged attack
* Haste extra action can only be used for attacking (one attack only - no Extra Attack), Dash, Disengage or Hide
* Ice Knife no longer interacts with surfaces
* Sleep lasts for 10 turns instead of 2 and it's a circular area, which the targets are selected based on HP on increasing order
* Spiritual Weapon is indestructible and ignored by enemies. It can only act if the caster uses their bonus action to command it to (except on the turn it is cast). Also removed all special attacks
* Produce Flame is a spell container, with instant attacking as an option (normal temporary spells after summoning the flame are still there as well)
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

* Spells and effects that should have a duration of 10 minutes or 1 hour but were lasting until a Long Rest had their durations adjusted and end with a Short Rest. Spells that last 8 hours or more still last until a Long Rest
  <details>
    <summary>List of Spells with durations changed</summary>
    <p>

      - 10 minutes (100 turns)
        - Darkness
        - Expeditious Retreat
        - Fly
        - Flame Blade
        - Protection from Evil and Good
        - Shield of Faith
        - Silence
        - Speak with Animals
        - Speak with Dead

      - 1 Hour (600 turns)
        - Armor of Agathys
        - Barkskin
        - Daylight
        - Enhance Ability
        - False Life
        - Feign Death
        - Fog Cloud
        - Gaseous Form
        - Invisibility
        - Longstrider
        - Magic Weapon
        - Pass without Trace
        - Protection from Energy
        - Protection from Poison
        - Warding Bond

      - Infinite, but still ends with Short Rest
        - Disguise Self

    </p>
  </details>

## Short Rests
* Short Rest puts the characters in a standby mode and provides them with 1 new spell
  - End Short Rest: Ends the Short Rest standby mode
* Some abilities are only available while short resting:
  - Wizard's Arcane Recovery
  - Druid's Natural Recovery (Circle of the Land)
* Short Rest is considered an hour long downtime period, thus ending effects that last up to 1 hour

## Global changes
* Changes Initiative Dice Roll from 1d4 to 1d20
* Extra Attack: 
  - Multiple sources no longer stack (Martial, Warlock and Wildshape)
  - Better priority logic on which extra attack to use, when considering War Priest, War Magic and Stalker's Flurry
  - Crossbows loading property only allows shooting once on an Extra Attack sequence (Crossbow Expert feat ignores the loading property)
* Removes weapon abilities (like Cleave, Smash and Pin Down) from all weapons (The `Raw_WeaponSpells.pak` mod can be used to keep the weapon spells)
* Removes the disadvantage on Strength and Dexterity Saving Throws when Prone, and adds the Disadvantage to Ranged Attack Rolls
* Gives a Walk passive to players that allows them to toggle between walking and running for cinematic and roleplay purposes (as requested by fmarzullo)

## Two-Weapon Fighting
* Removes the automatic offhand bonus attack option when Dual Wielding (This removes Dual Wielding AoO as well)
* The Offhand Attack is only available after attacking with the main hand weapon while Dual Wielding (or when outside of Combat)
