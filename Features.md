# Features

* Features with ⚙️ means they are optional. You can turn them on/off following the instructions on the [Installation Guide](https://github.com/ZerdBG3/RAW/blob/main/Installing.md#optional-configurations).

## Attunement ⚙️ `attunement`
_Developed in partnership with [Eric](https://www.nexusmods.com/baldursgate3/mods/2155). It's redundant to have both mods, since they do the same thing; they aren't compatible either._
* Several magical items now require attunement. [Here's the list](https://docs.google.com/spreadsheets/d/1yCJ9ITC180dqykK713iHMEsrvVOHkgOmLF882-yr_hQ/edit#gid=0&fvid=1734738953)
  - To attune to an item, you simply equip it
  - Items that require attunement can only be equipped outside of combat (except for weapons)
* You have a maximum number of items that can be attuned at once to each character (amount modifiable on the optional files)
  - After reaching your maximum amount of attuned items, you can no longer equip items that require attunement
  - To end an attunement, simply unequip an item that requires it

## Bonus Action Spells Rule ⚙️ `spells_bonusAction`
* Leveled spells with a casting cost of a bonus action block characters from casting another leveled spell on the same turn. Casting a leveled spell that doesn't require a bonus action will also block casting a leveled bonus action spell after
  - **_Currently, due to a bug crashing the game, only players are bound by this rule_**
  - _Multiple spells with a casting cost of an Action is still allowed (by the likes of Action Surge)_
  - _The restriction includes Quickened Spell (Metamagic) and spells from Class/Race or Items that are proper spells (even without a spell slot cost)_
  - _Due to an technical limitation, scrolls for spells your character don't know inside a container (such as a backpack) can bypass this rule, so can scrolls send to the character after they already cast a spell on their turn_

## Spells Duration ⚙️ `spells_duration`

* Removes all spell statuses with a duration of 10 minutes or 1 hour when taking a Short Rest. The list is in the [Spells section](https://github.com/ZerdBG3/RAW/blob/main/Features.md#spells)

## Weapon Sets ⚙️ `weaponSets`
* Removes the possibility of having a melee and a ranged weapon equipped at the same time, on the different weapon slots
  - _The reasoning for this is to avoid benefiting from bonuses (like AC from shields, or Spells from weapons) while using the other set_
* Upon equipping a melee weapon or a shield, both ranged weapon slots are unequipped. Upon equipping a ranged weapon, both melee weapon slots are unequipped
  - _Due to the change to equip cost mentioned on [Global Changes](https://github.com/ZerdBG3/RAW/blob/main/Features.md#global-changes), you can always equip one weapon per turn for free, allowing you to switch "sets" without necessarily spending an action_

## Weapon Spells ⚙️ `weaponSpells`
* Removes weapon abilities (like Cleave, Smash and Pin Down) from all weapons
<details>
  <summary>Only the following list is removed, any other ability granted by a weapon is still granted</summary>
  <p>

    Spells:
    - Projectile_HamstringShot
    - Projectile_Headcrack
    - Projectile_MobileShooting
    - Projectile_PiercingShot
    - Rush_SpringAttack
    - Shout_FullSwing
    - Shout_Steady
    - Shout_SteadyRanged
    - Shout_SteadyRangedCrossbow
    - Target_ConcussiveSmash
    - Target_CripplingStrike
    - Target_DisarmingStrike
    - Target_HeartStopper
    - Target_HinderingSmash
    - Target_OpeningAttack
    - Target_PiercingThrust
    - Target_PommelStrike
    - Target_PostureBreaker
    - Target_Slash_New
    - Target_Topple
    - Zone_Cleave

    Passives:
    - Overwhelm

  </p>
</details>


## Classes
### Barbarian
* Level 2: Reckless Attack
  - Both the Interrupt and the Spell can only be used on the first attack of the turn
  - Interrupt changed to no longer consider the roll before asking, so it can always activate even if the attack will hit without needing advantage. Unfortunately, I wasn't able to hide the attack roll. If you use the interrupt without the "asking" option, it will always trigger.
  - Attacking Recklessly allows for all attacks on the same turn to be done with advantage (but not after the turn ends, so no advantage on AoO). The enemies can still gain advantage on attacks aganinst the barbarian until the start of the barbairan's next turn
* Level 3 (Path of the Berserker): Removed Throw as a bonus action
* Level 3 (Path of Wild Magic): Makes all bonus actions granted by the random outcomes castable in the first round for free (next rounds it still requires a bonus action)
### Druid
* Level 2: Wild Shape allows for spells that require reactivation to be usable (eg.: Heat Metal, Moonbeam, Call Lightning) 
* Level 2 (Circle of the Land): Natural Recovery is only usable during a Short Rest
### Fighter
* Level 3 (Battle Master): Feinting Attack (Maneuver) fixed to cost a bonus action and a superiority die regardless if the attack hits or misses
### Ranger
* Level 1: Hunter's Mark counts as a separate damage entry and can critically strike
### Rogue
* Level 1: Sneak Attack
  - Fixes Sneak Attack Interrupt being possible to apply the damage on AoE effects (such as the explosion of a Fire Arrow). Only the main target will be prompted - the side effect is AoEs that roll for attack rolls on each target, such as a Cleave, will only allow you to deal sneak attack damage to the first one
  - Removes check for killing blow on Sneak Attack Interrupt. You'll still be able to see the character died, but you can opt into deal your sneak attack regardless (honor system) or if you're not asking to be prompted by the interrupt, it will consume regardless if the base damage killed the target
  - Spells no longer consume the Sneak Attack Charge if it missed (thus allowing for retries on other attacks on the same turn, specially off hand attacks)
* Level 2: Cunning Action provides a toggleable passive (default on) that replaces the action cost for Dash, Disengage and Hide for a Bonus Action. It is automatically disabled when the rogue doesn't have a bonus action or when they're hasted. Cunning Action is also available as a Spell Container with all bonus actions inside it for when the player must enforce the bonus action cost (such as when they're hasted)
* Level 3 (Thief): Fast Hands no longer provides an extra Bonus Action - instead, it gives Help, Distract and Throw (no damage) as possible Cunning Actions (bonus action). There's a toggleable passive just as above, except for Throw - since it doesn't deal damage, it's not a simple action cost replacement, it's a separate spell kept inside the Cunning Action Spell Container
* Level 3 (Thief): Second-Story Work now provides a Jump with distance scaling with Dexterity
### Sorcerer
* Level 3: Quickened Spell Metamagic cost reduced from 3 Sorcery Points to 2
### Wizard
* Level 1: Arcane Recovery is only usable during a Short Rest

## Actions
* Shove is an action (from bonus action). It's a spell container with the option to push (fixed 1.5 m) or knock prone. Can be used as part of your Extra Attack
* Introduces Distract and Dodge as actions to player characters and summons (see Find Familiar)
* Removes Bonus Action Cost from Jump and the Movement Cost is the same as the distance travelled
* Help stabilizes the target (Medicine `DC 10`), and the stabilized character is healed once out of combat. If the character is stabilized own their own by succeeding the Death Saving Throws, they will still require a Help Action (and the Medicine Check) to regain 1 HP.

## Feats
* Crossbow Expert: Allows shooting more than once with a crossbow during an Extra Attack
* Dual Wielder: Allows you to equip two weapons for free per turn (See [Global Changes](https://github.com/ZerdBG3/RAW/blob/main/Features.md#global-changes))
* Shield Master: Gives Shove (both options) as a bonus action after attacking on your turn

## Spells
* Call Lightning creates a storm area, inside which the caster can target a smaller area to deal damage each turn
* Chromatic Orb deals 3d8 base damage and no longer create surfaces. It can still interact with surfaces if targeting the surface directly (for cold, fire and lightning versions)
* Feign Death provides a Dismiss spell to the caster
* Find Familiar
  - Base summons (not the ones granted by Pact of the Chain) had all their attacks replaced by the Distract Action (kept their attack animations because they're cool, though)
  - Removed all separate actions they had, except the Cat's Meow, because it has no combat functionality
  - Raven now has the Flyby passive, so it doesn't receive AoOs - Since Owl isn't an option in Vanilla, I decided to make Raven the go-to pick for Arcane Tricksters
* Fireball radius increased from 4 to 6 meters
* Flaming Sphere is indestructible and ignored by enemies. It can only act if the caster uses their bonus action to command it to
* Guardian of Faith no longer attacks enemies in retaliation and no longer can attack enemies during its turn. Now, it only attacks creatures entering its attack range. It is also invulnerable (except to its own damage), ignored by the AI and has no hitbox.
* Hail of Thorns converted to a concentration self-buff spell that applies the effect on the next ranged attack
* Haste extra action can only be used for attacking (one attack only - no Extra Attack), Dash, Disengage or Hide
* Ice Knife no longer interacts with surfaces
* Sleep lasts for 10 turns instead of 2 and it's a circular area, which the targets are selected based on HP on increasing order
* Spiritual Weapon is indestructible and ignored by enemies. It can only act if the caster uses their bonus action to command it to (except on the turn it is cast). Also removed all special attacks
* Produce Flame is a spell container, with instant attacking as an option (normal temporary spells after summoning the flame are still there as well)
* Removes surface interaction for spells that are not AoE. They can still interact with surfaces (or create them), but must target the ground directly, instead of interacting when targeting a character on top of the surface
  <details>
    <summary>List of Spells with surface interaction changed</summary>
    <p>

      - Chromatic Orb
      - Firebolt
      - Produce Flame
      - Ray of Frost
      - Scorching Ray
      - Shocking Grasp

    </p>
  </details>

* Spells that deal damage when a character enters the AoE or when they start their turn on the AoE, no longer deal damage when the AoE is cast or moved during the caster's turn, and only deal damage on the target's turn (Page 16 of the [Sage Advice Compedium](https://media.wizards.com/2019/dnd/downloads/SA-Compendium.pdf)). The implementation will stop forced movement dealing damage more than once per round, but it brings much closer to RAI, since you can't move AoEs to deal damage on your turn then damage enemies again when their turn inevitably starts on the AoE.
  <details>
    <summary>List of Spells with damage application changed</summary>
    <p>

      - Cloud of Daggers
      - Moonbeam
      - Spirit Guardians

    </p>
  </details>

* Spells and effects that should have a duration of 10 minutes or 1 hour but were lasting until a Long Rest had their durations adjusted. Spells that last 8 hours or more still last until a Long Rest
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

      - Infinite, but still ends with Short Rest (⚙️ `spells_duration`)
        - Disguise Self

    </p>
  </details>

## Short Rests
* Short Rest puts the characters in a standby mode and provides them with 1 new spell
  - End Short Rest: Ends the Short Rest standby mode
* Some abilities are only available while short resting:
  - Wizard's Arcane Recovery
  - Druid's Natural Recovery (Circle of the Land)
* Short Rest is considered an hour long downtime period, thus ending effects that last up to 1 hour (⚙️ `spells_duration`)

## Global changes
* Changes Initiative Dice Roll from 1d4 to 1d20
* The first weapon equipped in a turn doesn't cost an Action Point. Further equips cost one Action Point each
* Extra Attack:
  - Multiple sources no longer stack (Martial, Warlock and Wildshape)
  - Better priority logic on which extra attack to use, when considering War Priest, War Magic and Stalker's Flurry
  - Players only: Crossbows loading property only allows shooting once on an Extra Attack sequence (Crossbow Expert feat ignores the loading property)
* Removes the disadvantage on Strength and Dexterity Saving Throws when Prone, and adds the Disadvantage to Ranged Attack Rolls
* Gives a Walk passive to players that allows them to toggle between walking and running for cinematic and roleplay purposes (as requested by fmarzullo)

## Throw and Thrown Weapons
* Throw and Improvised Weapon can no longer be used on enemies that are alive, and can't throw equipped items either, except for weapons. Throwing a weapon using this action counts as an improvised weapon (`1d4 bludgeoning` damage), regardless of the weapon properties
* Equipping a thrown weapon now provide specific spells that correctly calculate Range, Attack Roll, and Damage Roll, while also allowing for Two-Weapon Fighting (and correctly applying Sneak Attack). The range shown is the long range, but it will show the Disadvantage UI if you're attacking outside the short range
  - Throw Weapon (Main Hand): throws the weapon from your main hand using an action, using a melee weapon attack roll and deals the normal damage as if using a melee weapon attack. Can be used as part of your extra attack
  - Throw Weapon (Off Hand): available after attacking with your main hand weapon. Throws the weapon from your off hand using a bonus action, using a melee off hand weapon attack roll, dealing the normal damage as if using a melee off hand weapon attack (subtracts the ability modifier from the damage if the caster doesn't have Two Weapon Fighting Style)
  - Throw Weapon (Main Hand) - Transition: available after throwing your main hand weapon. Throws the weapon from your main hand using a bonus action, behaving similarly to the Throw Off Hand. Because the game automatically switches weapon hands, this is to ensure you can still throw your off hand weapon using a bonus action after it was automatically moved to your main hand
* Due to the change to equip cost mentioned on [Global Changes](https://github.com/ZerdBG3/RAW/blob/main/Features.md#global-changes), you can always equip one weapon per turn for free, allowing you to equip one weapon as part of your throwing action

## Two-Weapon Fighting
* Removes the automatic off hand bonus attack option when Dual Wielding (This removes Dual Wielding AoO as well)
* The Off Hand Attack is only available after attacking with the main hand weapon while Dual Wielding (or when outside of Combat)
