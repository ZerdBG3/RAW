# Features

* All features are enabled by default. If you want to play with all changes from the list below, there's no additional step beside installing the mod
* If you want to disable any of the features, you can individually disable them following the instructions on the [Installation Guide](https://github.com/ZerdBG3/RAW/blob/main/Installing.md#optional-configurations)
* All dependencies of enabled features will be automatically turned on to avoid inconsistencies or bugs in your game
  - _For example, if you disable [`defaultActions`](https://github.com/ZerdBG3/RAW/blob/main/Features.md#default-actions-%EF%B8%8F-defaultactions) on the options file, but keep any of its dependencies (like [`extraAttack`](https://github.com/ZerdBG3/RAW/blob/main/Features.md#extra-attack-%EF%B8%8F-extraattack) or [`familiars`](https://github.com/ZerdBG3/RAW/blob/main/Features.md#familiars-%EF%B8%8F-familiars)), the `defaultActions` option will be re-enabled in-game_

## Attunement ⚙️ `attunement`
_Developed in partnership with [Eric](https://www.nexusmods.com/baldursgate3/mods/2155). It's redundant to have both mods, since they do the same thing; they aren't compatible either._
* Several magical items now require attunement. [Here's the list](https://docs.google.com/spreadsheets/d/1yCJ9ITC180dqykK713iHMEsrvVOHkgOmLF882-yr_hQ/edit#gid=0&fvid=1734738953)
  - To attune to an item, you simply equip it
  - Items that require attunement can only be equipped outside of combat (except for weapons)
* You have a maximum number of items that can be attuned at once to each character (amount modifiable on the optional files)
  - After reaching your maximum amount of attuned items, you can no longer equip items that require attunement
  - To end an attunement, simply unequip an item that requires it

## Barbarian ⚙️ `barbarian`
* Level 2: Reckless Attack
  - Both the Interrupt and the Spell can only be used on the first attack of the turn
  - Interrupt changed to no longer consider the roll before asking, so it can always activate even if the attack will hit without needing advantage. Unfortunately, I wasn't able to hide the attack roll. If you use the interrupt without the "asking" option, it will always trigger.
  - Attacking Recklessly allows for all attacks on the same turn to be done with advantage (but not after the turn ends, so no advantage on AoO). The enemies can still gain advantage on attacks aganinst the barbarian until the start of the barbarian's next turn

## Barbarian (Berserker) ⚙️ `barbarian_berserker`
* Level 3: Removed Throw as a bonus action from Frenzy

## Barbarian (Wild Magic) ⚙️ `barbarian_wildMagic`
* Level 3: Makes all bonus actions granted by the random outcomes castable in the first round for free (next rounds it still requires a bonus action)
* Level 3: Shadowy Tendrils random outcome only damages enemies

## Concentration Failsafe ⚙️ `concentration_failsafe`
_Quality of Life feature_
* Provides a toggleable passive for players that prevents casting spells that require Concentration while concentrating on another spell.
* Toggle it off or manually stop the concentration (clicking the `X` below the portrait) to cast another concentration spell.
* Given the implementation, spells that are concentration but don't give the caster a status might result in the concentration spells being blocked even though the caster ended concentration manually (or timeout). Basically taking any action (even moving) will remove the blockage, but if nothing works, just untoggle the passive to remove the blockage.

## Default Actions ⚙️ `defaultActions`
Thanks [Kilay](https://www.nexusmods.com/users/26711484) and [ogugght](https://www.nexusmods.com/users/176938878) for the icons! ❤️
* Shove is an action (from bonus action). It's a spell container with the option to push (fixed 1.5 m) or knock prone
* Removes Bonus Action Cost from Jump and the Movement Cost is the same as the distance travelled
* Gives a Walk passive to players that allows them to toggle between walking and running for cinematic and roleplay purposes (as requested by fmarzullo)

#### Due to an issue with disabling this option, the following change is always present, even if the option is disabled. You can simply not use those actions if you don't want them (AI won't have them)
* Introduces Distract and Dodge as actions to player characters and summons

## Downed ⚙️ `downed`
* Healing a downed character allows them to play their turn normally

## Extra Attack ⚙️ `extraAttack`
_Dependencies: [`defaultActions`](https://github.com/ZerdBG3/RAW/blob/main/Features.md#default-actions-%EF%B8%8F-defaultactions)_
* Multiple sources no longer stack (Martial, Warlock and Wildshape)
* Allows shoving (both versions) to be used as part of the Extra Attack
* Better priority logic on which Extra Attack to use, when considering War Priest, War Magic and Stalker's Flurry
* Players only: Crossbows loading property only allows shooting once on an Extra Attack sequence
* Crossbow Expert Feat: Allows shooting more than once with a crossbow during an Extra Attack

## Familiars ⚙️ `familiars`
* Base summons (not the ones granted by Pact of the Chain) had all their attacks replaced by the Distract Action (kept their attack animations because they're cool, though)
* Removed all separate actions they had, except the Cat's Meow, because it has no combat functionality
* Raven now has the Flyby passive, so it doesn't receive AoOs - _Since Owl isn't an option in Vanilla, I decided to make Raven the go-to pick for Arcane Tricksters_

## Feats ⚙️ `feats`
_Dependencies: [`defaultActions`](https://github.com/ZerdBG3/RAW/blob/main/Features.md#default-actions-%EF%B8%8F-defaultactions)_
* Shield Master: Gives Shove (both options) as a bonus action after attacking on your turn

## Free Weapon Equip ⚙️ `freeWeaponEquip`
* The first weapon equipped in a turn doesn't cost an Action Point. Further equips cost one Action Point each
* Dual Wielder Feat: Allows you to equip two weapons for free per turn instead of just one

## Fighter (Battle Master) ⚙️ `fighter_battleMaster`
* Level 3: Feinting Attack (Maneuver) fixed to cost a bonus action and a superiority die regardless if the attack hits or misses

## High Ground ⚙️ `highGround`
* Removes High Ground bonus to attack rolls (Low Ground penalty is kept to emulate cover)

## Initiative ⚙️ `initiative`
* Changes Initiative Dice Roll from 1d4 to 1d20

## Intangible Summons ⚙️ `intangibleSummons`
* Flaming Sphere is indestructible and ignored by enemies. It can only act if the caster uses their bonus action to command it to
* Guardian of Faith is indestructible (except by its own damage), ignored by enemies and has no hitbox. It only attacks enemies that enter its range on their turn, or start their turn in its range (similar to the spells changed by [`spells_onApplyAndOnTurn`](https://github.com/ZerdBG3/RAW/blob/main/Features.md#spells---on-apply-and-on-turn-%EF%B8%8F-spells_onapplyandonturn)). No longer retaliates when attacks are made in range or during its turn in combat
* Spiritual Weapon is indestructible and ignored by enemies. It can only act if the caster uses their bonus action to command it to (except on the turn it is cast). Also removed all special attacks

## Prone ⚙️ `prone`
* Removes the disadvantage on Strength and Dexterity Saving Throws when Prone, and adds the Disadvantage to Ranged Attack Rolls

## Rogue ⚙️ `rogue`
_Dependencies: [`throw`](https://github.com/ZerdBG3/RAW/blob/main/Features.md#throw-%EF%B8%8F-throw)_
* Level 1: Sneak Attack
  - Fixes Sneak Attack Interrupt being possible to apply the damage on AoE effects (such as the explosion of a Fire Arrow). Only the main target will be prompted - the side effect is AoEs that roll for attack rolls on each target, such as a Cleave, will only allow you to deal sneak attack damage to the first one
  - Removes check for killing blow on Sneak Attack Interrupt. You'll still be able to see the character died, but you can opt into deal your sneak attack regardless (honor system) or if you're not asking to be prompted by the interrupt, it will consume regardless if the base damage killed the target
  - Spells no longer consume the Sneak Attack Charge if it missed (thus allowing for retries on other attacks on the same turn, specially off-hand attacks)
* Level 2: Cunning Action provides a toggleable passive (default on) that replaces the action cost for Dash, Disengage and Hide for a Bonus Action. It is automatically disabled when the rogue doesn't have a bonus action or when they're hasted. Cunning Action is also available as a Spell Container with all bonus actions inside it for when the player must enforce the bonus action cost (such as when they're hasted)

## Rogue (Thief) ⚙️ `rogue_thief`
_Dependencies: [`rogue`](https://github.com/ZerdBG3/RAW/blob/main/Features.md#rogue-%EF%B8%8F-rogue), [`stabilize`](https://github.com/ZerdBG3/RAW/blob/main/Features.md#stabilize-%EF%B8%8F-stabilize)_
* Level 3: Fast Hands no longer provides an extra Bonus Action - instead, it gives Help, Distract and Throw (no damage) as possible Cunning Actions (bonus action). There's a toggleable passive just as above, except for Throw - since it doesn't deal damage, it's not a simple action cost replacement, it's a separate spell kept inside the Cunning Action Spell Container
* Level 3: Second-Story Work now provides a Jump with distance scaling with Dexterity

## Short Rest ⚙️ `shortRest`
* Short Rest puts the characters in a standby mode and provides them with 1 new spell
  - End Short Rest: Ends the Short Rest standby mode
* Some abilities are only available while short resting:
  - Druid's Natural Recovery (Circle of the Land)
  - Wizard's Arcane Recovery

## Skill Checks Critical Fail ⚙️ `skillCheck_critFail`
* Disables critical fails on skill checks and raw ability checks (like raw strength or dexterity checks - not Saving Throws) by setting the minimum roll as 2. This means you can't roll a 1 anymore, so no more crit fails on dialogues or lockpicking.
* The downside is, of course, the specific cases where a 2 is enough to pass a check but a 1 wouldn't be. So `+3` on a `DC 5` or `+8` on a `DC 10`. On those cases, you have a 5% chance of being unfairly benefited from the mod. However, given the biggest frustration tends to be on `+15` on `DC 10`, I think it's a fair tradeoff.
* Through testing, I've confirmed that the minimum roll is enforced after the roll, so this doesn't increase your probability of getting higher rolls. You still have a 5% chance of getting any value on dice rolls, but 1's will become 2.
* This also means that there's no interaction with `Reroll` features, like Halfling's Lucky. Mechanically speaking, the roll is made first, checks for a reroll possibility, returns the raw value of the dice, then it's set to the minimum specificed by the passive. So Halflings will still reroll their 1's in skill/ability checks, but if they roll a 1 again, it'll be increased to a 2.

## Spells ⚙️ `spells`
* Call Lightning creates a storm area, inside which the caster can target a smaller area to deal damage each turn (recast is usable while wildshaped, even with the [`spells_wildshape`](https://github.com/ZerdBG3/RAW/blob/main/Features.md#spells---wildshape-%EF%B8%8F-spells_wildshape) option disabled)
* Cone of Cold range increased to 18 meters
* Feign Death provides a Dismiss spell to the caster (duration changed as well, even with the [`spells_duration`](https://github.com/ZerdBG3/RAW/blob/main/Features.md#spells---duration-%EF%B8%8F-spells_duration) option disabled)
* Fireball radius increased from 4 to 6 meters
* Hail of Thorns converted to a concentration self-buff spell that applies the effect on the next ranged attack
* Haste extra action can only be used for attacking (one attack only - no Extra Attack), Dash, Disengage or Hide
* Hunter's Mark counts as a separate damage entry and can critically strike
* Hypnotic Pattern duration increased to 10 turns
* Ice Knife no longer interacts with surfaces
* Produce Flame is a spell container, with instant attacking as an option (normal temporary spells after summoning the flame are still there as well)
* Sleep lasts for 10 turns instead of 2 and it's a circular area, which the targets are selected based on HP on increasing order

## Spells - Bonus Action Rule ⚙️ `spells_bonusAction`
* Leveled spells with a casting cost of a bonus action block characters from casting another leveled spell on the same turn. Casting a leveled spell that doesn't require a bonus action will also block casting a leveled bonus action spell after
  - **_Currently, due to a bug crashing the game, only players are bound by this rule_**
  - _Multiple spells with a casting cost of an Action is still allowed (by the likes of Action Surge)_
  - _Due to a technical limitation, scrolls for spells your character don't know inside a container (such as a backpack) can bypass this rule, so can scrolls sent to the character after they've already cast a spell on their turn_
* Sorcer's Quickened Spell Metamagic cost reduced from 3 Sorcery Points to 2 and is made to work correctly with the bonus action spell ruling

## Spells - Duration ⚙️ `spells_duration`
* Spells and effects that should have a duration of 10 minutes or 1 hour but were lasting until a Long Rest had their durations adjusted and are removed upon taking a Short Rest. Spells that last 8 hours or more still last until a Long Rest
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

      - 1 hour (600 turns)
        - Armor of Agathys
        - Barkskin
        - Daylight
        - Enhance Ability
        - False Life
        - Feign Death (done in the spells option)
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

## Spells - On Apply And On Turn ⚙️ `spells_onApplyAndOnTurn`
* Spells that deal damage when a character enters the AoE or when they start their turn on the AoE, no longer deal damage when the AoE is cast or moved during the caster's turn, and only deal damage on the target's turn (Page 16 of the [Sage Advice Compedium](https://media.wizards.com/2019/dnd/downloads/SA-Compendium.pdf)). The implementation will stop forced movement dealing damage more than once per round, but it brings much closer to RAI, since you can't move AoEs to deal damage on your turn then damage enemies again when their turn inevitably starts on the AoE.
  <details>
    <summary>List of Spells with damage application changed</summary>
    <p>

      - Cloud of Daggers
      - Moonbeam
      - Spirit Guardians

    </p>
  </details>

## Spells - Surface Removal ⚙️ `spells_surfaceRemoval`
* Chromatic Orb deals 3d8 base damage and no longer create surfaces. It can still interact with surfaces if targeting the surface directly (for cold, fire and lightning versions)
* Removes surface interaction for spells that are not AoE. They can still interact with surfaces (or create them), but must target the ground directly, instead of interacting when targeting a character on top of the surface
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

## Spells - Wildshape ⚙️ `spells_wildshape`
* Wild Shape allows for spells that require reactivation to be usable (eg.: Heat Metal and Moonbeam)
  - _Call Lightning recast while wildshaped is done on the [`spells`](https://github.com/ZerdBG3/RAW/blob/main/Features.md#spells-%EF%B8%8F-spells) option_

## Stabilize ⚙️ `stabilize`
* Help stabilizes the target (Medicine `DC 10`), and the stabilized character is healed once out of combat. If the character is stabilized own their own by succeeding the Death Saving Throws, they will still require a Help Action (and the Medicine Check) to regain 1 HP

## Throw ⚙️ `throw`
_Dependencies: [`twoWeaponFighting`](https://github.com/ZerdBG3/RAW/blob/main/Features.md#two-weapon-fighting-%EF%B8%8F-twoweaponfighting)_
* Throw and Improvised Weapon can no longer be used on enemies that are alive, and can't throw equipped items either, except for weapons. Throwing a weapon using this action counts as an improvised weapon (`1d4 bludgeoning` damage), regardless of the weapon properties
* All players have access to two Throw Weapon Spells (Main Hand and Off-Hand). They're only usable once you have melee weapons with the thrown property equipped on the respective slots
  - _Feel free to remove them from your hotbar if you're not planning on using thrown weapons_
* They correctly calculate Range, Attack Roll, and Damage Roll, while also allowing for Two-Weapon Fighting (and correctly applying Sneak Attack). The range shown is the long range, but it will show the Disadvantage UI if you're attacking outside the short range
  - `Throw Weapon (Main Hand)`: throws the weapon from your main hand using an action, using a melee weapon attack roll and deals the normal damage as if using a melee weapon attack. Can be used as part of your extra attack
  - `Throw Weapon (Off-Hand)`: available after attacking with your main hand weapon. Throws the weapon from your off-hand using a bonus action, using a melee off-hand weapon attack roll, dealing the normal damage as if using a melee off-hand weapon attack (by subtracting the ability modifier from the damage if the caster doesn't have Two Weapon Fighting Style)
  - `Throw Weapon (Transition)`: a temporary spell that shows up after throwing your main hand weapon. Throws the weapon from your main hand using a bonus action, behaving similarly to `Throw Weapon (Off-Hand)`. Because the game automatically switches weapon hands, this is to ensure you can still throw your off-hand weapon using a bonus action after it was automatically moved to your main hand
* To use this option, I recommend also using the [`freeWeaponEquip`](https://github.com/ZerdBG3/RAW/blob/main/Features.md#free-weapon-equip-%EF%B8%8F-freeweaponequip) option, so you can always equip one weapon per turn for free, allowing you to equip one weapon as part of your throwing action

## Two Weapon Fighting ⚙️ `twoWeaponFighting`
* Removes the automatic off-hand bonus attack option when Dual Wielding (This removes Dual Wielding AoO as well)
* The Off-Hand Attack is only available after attacking with the main hand weapon while Dual Wielding (or when outside of Combat)

## Weapon Sets ⚙️ `weaponSets`
* Removes the possibility of having a melee and a ranged weapon equipped at the same time, on the different weapon slots
  - _The reasoning for this is to avoid benefiting from bonuses (like AC from shields, or Spells from weapons) while using the other set_
* Upon equipping a melee weapon or a shield, both ranged weapon slots are unequipped. Upon equipping a ranged weapon, both melee weapon slots are unequipped
  - _To use this option, I recommend also using the [`freeWeaponEquip`](https://github.com/ZerdBG3/RAW/blob/main/Features.md#free-weapon-equip-%EF%B8%8F-freeweaponequip) option, so you can always equip one weapon per turn for free, allowing you to switch "sets" without necessarily spending an action_
* To better organize the hotbar, players are be given all default attacks (Melee and Ranged Main and Off-Hand Attack, plus the Unarmed Attack)
  - The default attacks are only usable when equipped with the correct weapons. These attacks are technically different from the ones given by the items, but they behave mechanically the same. It's safe to use them and ignore the ones given when equipping weapons
  - You can also remove the ones you don't intend to use from your hotbar (like off-hand ranged attack if you don't plan on dual wielding hand crossbows). They're always available on your spellbook
  - To make sure you're putting the everlasting ones on your hotbar when organizing, it's useful to remove all your weapons so only they are available on the spellbook
* _One useful tip is to place your commonly used weapons on the hotbar (drag it from your inventory to your hotbar) to make switching sets easier. That way, you don't need to keep on finding your weapons on your inventory every time_

## Weapon Spells ⚙️ `weaponSpells`
* Removes default weapon abilities from all weapons
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
