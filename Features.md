# Features

* All features are enabled by default, except when stated otherwise. If you want to play with all changes from the list below that aren't explicitly disabled, there's no additional step beside installing the mod
* If you want to disable any of the features (or enable a disabled one), you can individually modify them following the instructions on the [Installation Guide](https://github.com/ZerdBG3/RAW/blob/main/Installing.md#optional-configurations)
* ⚠️ All dependencies of enabled features will be automatically turned on to avoid inconsistencies or bugs in your game (if you want to disable a feature, you must also disable every feature listed as `Depended by` to actually disable it) ⚠️
  - _For example, if you disable [`defaultActions`](https://github.com/ZerdBG3/RAW/blob/main/Features.md#default-actions-%EF%B8%8F-defaultactions) on the options file, but keep any of its `Depended by` (like [`extraAttack`](https://github.com/ZerdBG3/RAW/blob/main/Features.md#extra-attack-%EF%B8%8F-extraattack) or [`feats`](https://github.com/ZerdBG3/RAW/blob/main/Features.md#feats-%EF%B8%8F-feats)), the `defaultActions` option will be enabled automatically when the game starts_

## Attunement ⚙️ `attunement`
* Several magical items now require attunement. [Here's the list](https://docs.google.com/spreadsheets/d/1yCJ9ITC180dqykK713iHMEsrvVOHkgOmLF882-yr_hQ/edit#gid=0&fvid=1734738953)
  - To attune to an item, you simply equip it
  - Items that require attunement can only be equipped outside of combat (except for weapons)
* You have a maximum number of items that can be attuned at once to each character (amount modifiable on the optional files)
  - After reaching your maximum amount of attuned items, you can no longer equip items that require attunement
  - To end an attunement, simply unequip an item that requires it

### 🔧 Customization

* You can add items that require attunement by including their stat name to `attunement/Items_Add.json`. If you wish to have an item that usually requires attunement not require attunement instead, you can add its stat name to `attunement/Items_Remove.json`
  - _Instructions to create the file is present on the [Installation Guide](https://github.com/ZerdBG3/RAW/blob/main/Installing.md#optional-configurations)_
* In both files, you must structure it like a json array, as demonstrated in the example below

<details>
  <summary>Example of Items_Remove.json</summary>
  <p>

  * Pay close attention to the lack of `,` at the last line

    ```json
    [
      "UNI_ARM_OfDefense_Gloves",
      "ARM_TalismanOfJergal"
    ]
    ```

  </p>
</details>

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
* Level 3: Fixes Wild Magic: Teleport applying to everyone around the Barbarian, for some reason (vanilla bug)

## Concentration Failsafe ⚙️ `concentration_failsafe`
_Quality of Life feature_
* Provides a toggleable passive for players that prevents casting spells that require Concentration while concentrating on another spell.
* Toggle it off or manually stop the concentration (clicking the `X` below the portrait) to cast another concentration spell.
* Given the implementation, spells that are concentration but don't give the caster a status might result in the concentration spells being blocked even though the caster ended concentration manually (or timeout). Basically taking any action (even moving) will remove the blockage, but if nothing works, just untoggle the passive to remove the blockage.

## Default Actions ⚙️ `defaultActions`
_Depended by: [`extraAttack`](https://github.com/ZerdBG3/RAW/blob/main/Features.md#extra-attack-%EF%B8%8F-extraattack)_, [`feats`](https://github.com/ZerdBG3/RAW/blob/main/Features.md#feats-%EF%B8%8F-feats)

Thanks [Kilay](https://www.nexusmods.com/users/26711484) and [ogugght](https://www.nexusmods.com/users/176938878) for the icons! ❤️
* Shove is an action (from bonus action). It's a spell container with the option to push (fixed 1.5 m) or knock prone
* Removes Bonus Action Cost from Jump and the Movement Cost is the same as the distance travelled
* Gives a Walk passive to players that allows them to toggle between walking and running for cinematic and roleplay purposes (as requested by fmarzullo)

#### Due to an issue with disabling this option, the following changes are always present, even if the option is disabled. You can simply not use those actions if you don't want them (AI won't have them)
* Introduces Distract and Dodge as actions to player characters and summons
* Unarmed Attack is always available, even when wielding weapons

## Disable Critical Fail on Checks ⚙️ `skillCheck_critFail`
* Disables critical fails on skill checks, ability checks (like raw strength or dexterity checks) and saving throws by setting the minimum roll as 2. This means you can't roll a 1 anymore, so no more crit fails on dialogues, lockpicking or concentration.
* The downside is, of course, the specific cases where a 2 is enough to pass a check but a 1 wouldn't be. So `+3` on a `DC 5` or `+8` on a `DC 10`. On those cases, you have a 5% chance of being unfairly benefited from the mod. However, given the biggest frustration tends to be on `+15` on `DC 10`, I think it's a fair tradeoff.
* Through testing, I've confirmed that the minimum roll is enforced after the roll, so this doesn't increase your probability of getting higher rolls. You still have a 5% chance of getting any value on dice rolls, but 1's will become 2.
* This also means that there's no interaction with `Reroll` features, like Halfling's Lucky. Mechanically speaking, the roll is made first, checks for a reroll possibility, returns the raw value of the dice, then it's set to the minimum specificed by the passive. So Halflings will still reroll their 1's in skill/ability checks, but if they roll a 1 again, it'll be increased to a 2.

## Downed ⚙️ `downed`
* Healing a downed character allows them to play their turn normally

## Extra Attack ⚙️ `extraAttack`
_Depends on: [`defaultActions`](https://github.com/ZerdBG3/RAW/blob/main/Features.md#default-actions-%EF%B8%8F-defaultactions)_
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
_Depends on: [`defaultActions`](https://github.com/ZerdBG3/RAW/blob/main/Features.md#default-actions-%EF%B8%8F-defaultactions)_
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

## Instant Death ⚙️ `instantDeath`
Thanks [dr. kekyll](https://next.nexusmods.com/profile/drkekyll/mods?gameId=3474) for the implementation
* Players only: Taking damage that exceeds the current hit points by the character's hit point maximum kills them outright, without death saving throws
  - _There is a bug in vanilla that outright kills polymorphed characters if the damage is bigger than the transformation's and the original character's current HP combined. This is not the mod's fault_

## Intangible Summons ⚙️ `intangibleSummons`
❗️ I highly recommend using [dr. kekyll's Summon Initiative Fixer mod](https://www.nexusmods.com/baldursgate3/mods/8692?tab=description) to make sure Flaming Sphere and Spiritual Weapon always share their turn with the caster
* Flaming Sphere is indestructible and ignored by enemies. It can only act if the caster uses their bonus action to command it to
* Guardian of Faith is indestructible (except by its own damage), ignored by enemies and has no hitbox. It only attacks enemies that enter its range on their turn, or start their turn in its range (similar to the spells changed by [`spells_onApplyAndOnTurn`](https://github.com/ZerdBG3/RAW/blob/main/Features.md#spells---on-apply-and-on-turn-%EF%B8%8F-spells_onapplyandonturn)). No longer retaliates when attacks are made in range or during its turn in combat
* Spiritual Weapon is indestructible and ignored by enemies. It can only act if the caster uses their bonus action to command it to (except on the turn it is cast). Also removed all special attacks

## Invisibility ⚙️ `invisibility`
> [!CAUTION]
> This feature does not work on existing saves. Make sure to disable it if you're encountering any issues regarding encounters with ambushes.

Major thanks to [dr. kekyll](https://next.nexusmods.com/profile/drkekyll/mods?gameId=3474) for his initial implementation on [(See) Invisibility Rework](https://www.nexusmods.com/baldursgate3/mods/3902) was the base for this option. However, the mod is now redundant and **incompatible** with this option!
* Invisibility alone no longer makes the character completely undetectable, only providing Advantage to attack rolls against enemies that can't see invisible and Disadvantage when being attacked by enemies that can't see invisible
* Spells that require the caster to see the target also can't be used against an invisible creature, unless the caster has See invisibility or similar
* Attacks of Opportunity are also not possible against targets that can't be seen
* Normal Invisibility is no longer removed by being damaged, interacting with items or being _wet_ 💧. Only attacking and casting a spell will remove Invisibility
* Greater Invisibility is no longer removed at all (no saves)
* Sneaking while invisible turns the character `Hidden & Invisible` (can be done inside enemy sight cones if they can't see invisible), not being detectable by anyone that can't see invisible
  - _Being `Hidden & Invisible` is the same as Vanilla Invisible. It allows pickpocketing, avoids starting combat when near enemies, etc_
* See Invisibility and similar features allows characters to see the `Hidden & Invisible` characters if they're in their Line of Sight (the usual red cone for sneaking), but doesn't remove the invisibility status, allowing the usual Stealth check when inside a sight cone. It also negates the advantage/disadvantage benefits from Invisibility, so it fully counters invisibility. Leaving the sight cone of See Invisibility while still sneaking regains `Hidden & Invisible`
  - _Players aren't restricted by their sight cone, revealing enemies all around them, to avoid the necessity of micro managing your character's LoS_
* Sense Hidden Presence (the NPC seeking ability) makes a perception check against the passive stealth of every sneaking character in a radius (no LoS required, since it theoretically uses hearing). Upon succeeding, it removes the sneaking (but never the invisibility). It can be used by players and was readjusted to cost 1 action (emulating RAW Active Perception roll)
* Enemies gain one free sneak _attempt_ when they become invisible, rolling their stealth against the highest passive perception of their enemies in a radius (same radius as Sense Hidden Presence). If they succeed the stealth check, they become `Hidden & Invisible`
* While invisible, enemies can now attempt to sneak for 1 action, becoming `Hidden & Invisible` without need for a stealth check
* _Some enemies don't have a proper transparent status effect to indicate they're invisible, like players do. So sometimes it might be difficult to realize enemies are invisible to your characters_

### 🔧 Customization

<details>
  <summary>Default list of Spells that require sight</summary>
  <p>

  Based on [this list](https://homebrewery.naturalcrit.com/share/Hk7zwD4Gxr)

    - Vanilla spells
      - Projectile_AcidSplash
      - Target_AnimalFriendship
      - Target_Bane
      - Target_Banishment
      - Target_Blight
      - Target_Blindness
      - Projectile_ChainLightning (can bounce to invisible targets)
      - Target_CharmPerson
      - Projectile_ChromaticOrb
      - Target_Command_Container
      - Target_CompelledDuel
      - Target_Counterspell
      - Target_CrownOfMadness
      - Projectile_Disintegrate
      - Target_DominateBeast
      - Target_DominatePerson
      - Target_EnlargeReduce
      - Target_Enthrall
      - Target_Eyebite
      - Target_FleshToStone
      - Target_Harm
      - Target_Haste
      - Target_Heal
      - Target_HealingWord
      - Target_HeatMetal (reapply damage can be used against invisible targets)
      - Shout_HellishRebuke
      - Target_Hex
      - Target_HoldMonster
      - Target_HoldPerson
      - Target_HuntersMark
      - Target_Knock
      - Projectile_MagicMissile
      - Shout_HealingWord_Mass
      - Target_IrresistibleDance
      - Target_PhantasmalForce
      - Target_PhantasmalKiller
      - Projectile_PoisonSpray
      - Target_Polymorph
      - Target_PowerWordKill
      - Shout_PrayerOfHealing
      - Target_SacredFlame
      - Target_Seeming
      - Target_HideousLaughter
      - Throw_Telekinesis
      - Target_ViciousMockery

    - 5e Spells
      - Target_Catnap
      - Target_CauseFear
      - Target_CharmMonster
      - Target_Frostbite
      - Target_Infestation
      - Target_IntellectFortress
      - Target_LifeTransference
      - Target_LightningLure
      - Target_MaximiliansEarthenGrasp
      - Target_MindSliver
      - Target_MindSpike
      - Projectile_NegativeEnergyFlood
      - Target_PowerWordStun
      - Target_SteelWindStrike
      - Target_TashasMindWhip
      - Target_TollTheDead
      - Shout_WordOfRadiance

  </p>
</details>

* You can add other spells that require sight by including their stat name to `invisibility/Spells_Add.json`. If you wish to have a spell not require sight, add its stat name to `invisibility/Spells_Remove.json`
  - _Instructions to create the file is present on the [Installation Guide](https://github.com/ZerdBG3/RAW/blob/main/Installing.md#optional-configurations)_
  - _Adding a spell to `Spells_Add.json` or `Spells_Remove.json` will automatically affect all spells that inherit from it, like upcast, container spells, etc_
  - _For interrupts, use the spell entry which has the `InterruptPrototype`, not the interrupt entry (Eg.: `Shout_HellishRebuke` instead of `Target_HellishRebuke` or `Interrupt_HellishRebuke`)_
* In both files, you must structure it like a json array, as demonstrated in the example below

<details>
  <summary>Example of Spells_Add.json</summary>
  <p>

  * Pay close attention to the lack of `,` at the last line

    ```json
    [
      "Target_MyCustomSpellThatRequiresSight",
      "Projectile_SomethingThatRequiresSight"
    ]
    ```

  </p>
</details>

## Monk ⚙️ `monk`
* Level 1: Martial Arts Bonus Unarmed Strike changed from a temporary spell to a permanent spell that is only usable after attacking with your action first
* Level 1: Removes Ki Points and Flurry of Blows
* Level 2: All monk save DCs now properly use Wisdom on the calculation
* Level 2: Gives Ki Points and Flurry of Blows on the correct level (total amount of Ki Points reduced by 1 to the correct value)
* Level 2: Flurry of Blows is only available after attacking with your action and both attacks are separate, not needing to be against the same target
* Level 2: Step of the Wind (both Dash and Disengage) doubles your jumping distance for the turn
* Level 2: Specifies that Patient Defense has the same removal conditions as Dodge
* Level 5: Introduces a Interrupt for Stunning Strike. It is also possible to use it against a target that is already stunned

## Monk (Way of the Four Elements) ⚙️ `monk_fourElements`
* Level 3: Fangs of the Fire Snake
  - Initial damage changed to be entirely fire damage: unarmed damage +1d10 + dex
  - Animation changed to not use the weapon
  - For the remainder of the turn, only unarmed attacks get the extra 1d4 fire damage, but they have increased range (same range as the initial ability)

## Prone ⚙️ `prone`
* Removes the disadvantage on Strength and Dexterity Saving Throws when Prone, and adds the Disadvantage to Ranged Attack Rolls

## Rogue ⚙️ `rogue`
_Depends on: [`throw`](https://github.com/ZerdBG3/RAW/blob/main/Features.md#throw-%EF%B8%8F-throw)_

_Depended by: [`rogue_thief`](https://github.com/ZerdBG3/RAW/blob/main/Features.md#rogue-thief-%EF%B8%8F-rogue_thief)_
* Level 1: Sneak Attack
  - Fixes Sneak Attack Interrupt being possible to apply the damage on AoE effects (such as the explosion of a Fire Arrow). Only the main target will be prompted - the side effect is AoEs that roll for attack rolls on each target, such as a Cleave, will only allow you to deal sneak attack damage to the first one
  - Removes check for killing blow on Sneak Attack Interrupt. You'll still be able to see the character died, but you can opt into deal your sneak attack regardless (honor system) or if you're not asking to be prompted by the interrupt, it will consume regardless if the base damage killed the target
  - Spells no longer consume the Sneak Attack Charge if it missed (thus allowing for retries on other attacks on the same turn, specially off-hand attacks)
* Level 2: Cunning Action provides a toggleable passive (default on) that replaces the action cost for Dash, Disengage and Hide for a Bonus Action. It is automatically disabled when the rogue doesn't have a bonus action or when they're hasted. Cunning Action is also available as a Spell Container with all bonus actions inside it for when the player must enforce the bonus action cost (such as when they're hasted)

## Rogue (Thief) ⚙️ `rogue_thief`
_Depends on: [`rogue`](https://github.com/ZerdBG3/RAW/blob/main/Features.md#rogue-%EF%B8%8F-rogue), [`stabilize`](https://github.com/ZerdBG3/RAW/blob/main/Features.md#stabilize-%EF%B8%8F-stabilize)_
* Level 3: Fast Hands no longer provides an extra Bonus Action - instead, it gives Help, Distract and Throw (no damage) as possible Cunning Actions (bonus action). There's a toggleable passive just as above, except for Throw - since it doesn't deal damage, it's not a simple action cost replacement, it's a separate spell kept inside the Cunning Action Spell Container
* Level 3: Second-Story Work now provides a Jump with distance scaling with Dexterity

## Short Rest ⚙️ `shortRest`
* Short Rest puts the characters in a standby mode and provides them with 1 new spell
  - End Short Rest: Ends the Short Rest standby mode
* Some abilities are only available while short resting:
  - Druid's Natural Recovery (Circle of the Land)
  - Wizard's Arcane Recovery

## Spells ⚙️ `spells`
❗️ I highly recommend using [jjdoorframe's True Darkness](https://www.nexusmods.com/baldursgate3/mods/13542) to make Darkness RAW
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
* Stinking Cloud no longer blocks action usage, instead consuming one single action from characters inside it on their turn start upon failing the Saving Throw

## Spells - Bonus Action Rule ⚙️ `spells_bonusAction`
* Leveled spells with a casting cost of a bonus action block characters from casting another leveled spell on the same turn. Casting a leveled spell that doesn't require a bonus action will also block casting a leveled bonus action spell after
  - **_Currently, due to a bug crashing the game, only players are bound by this rule_**
  - _Multiple spells with a casting cost of an Action is still allowed (by the likes of Action Surge)_
  - _Due to a technical limitation, scrolls for spells your character don't know inside a container (such as a backpack) can bypass this rule, so can scrolls sent to the character after they've already cast a spell on their turn_
* Sorcer's Quickened Spell Metamagic cost reduced from 3 Sorcery Points to 2 and is made to work correctly with the bonus action spell ruling

## Spells - Duration ⚙️ `spells_duration`
_Depended by: [`spells_durationExpanded`](https://github.com/ZerdBG3/RAW/blob/main/Features.md#spells---duration-expanded-%EF%B8%8F-spells_durationexpanded)_
* Spells and effects that should have a duration of 10 minutes or 1 hour but were lasting until a Long Rest had their durations adjusted and are removed upon taking a Short Rest. Spells that last 8 hours or more still last until a Long Rest. This doesn't include spells that don't affect combat (see [`spells_durationExpanded`](https://github.com/ZerdBG3/RAW/blob/main/Features.md#spells---duration-expanded-%EF%B8%8F-spells_durationexpanded)) for QoL purposes
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

## Spells - Duration Expanded ⚙️ `spells_durationExpanded`
> [!CAUTION]
> Disabled by default

_Depends on: [`spells_duration`](https://github.com/ZerdBG3/RAW/blob/main/Features.md#spells---duration-%EF%B8%8F-spells_duration)_
* Includes the spells ignored by the `spells_duration` option to the list of duration changes
  <details>
    <summary>List of Spells with durations changed</summary>
    <p>

      - 10 minutes (100 turns)
        - Speak with Animals
        - Speak with Dead

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
_Depended by: [`rogue_thief`](https://github.com/ZerdBG3/RAW/blob/main/Features.md#rogue-thief-%EF%B8%8F-rogue_thief)_
* Help stabilizes the target (Medicine `DC 10`), and the stabilized character is healed once out of combat. If the character is stabilized own their own by succeeding the Death Saving Throws, they will still require a Help Action (and the Medicine Check) to regain 1 HP

## Throw ⚙️ `throw`
_Depends on: [`twoWeaponFighting`](https://github.com/ZerdBG3/RAW/blob/main/Features.md#two-weapon-fighting-%EF%B8%8F-twoweaponfighting)_

_Depended by: [`rogue`](https://github.com/ZerdBG3/RAW/blob/main/Features.md#rogue-%EF%B8%8F-rogue), [`rogue_thief`](https://github.com/ZerdBG3/RAW/blob/main/Features.md#rogue-thief-%EF%B8%8F-rogue_thief)_
* Throw and Improvised Weapon can no longer be used on enemies that are alive, and can't throw equipped items either, except for weapons. Throwing a weapon using this action counts as an improvised weapon (`1d4 bludgeoning` damage), regardless of the weapon properties
* All players have access to two Throw Weapon Spells (Main Hand and Off-Hand). They're only usable once you have melee weapons with the thrown property equipped on the respective slots
  - _Feel free to remove them from your hotbar if you're not planning on using thrown weapons_
* They correctly calculate Range, Attack Roll, and Damage Roll, while also allowing for Two-Weapon Fighting (and correctly applying Sneak Attack). The range shown is the long range, but it will show the Disadvantage UI if you're attacking outside the short range
  - `Throw Weapon (Main Hand)`: throws the weapon from your main hand using an action, using a melee weapon attack roll and deals the normal damage as if using a melee weapon attack. Can be used as part of your extra attack
  - `Throw Weapon (Off-Hand)`: available after attacking with your main hand weapon. Throws the weapon from your off-hand using a bonus action, using a melee off-hand weapon attack roll, dealing the normal damage as if using a melee off-hand weapon attack (by subtracting the ability modifier from the damage if the caster doesn't have Two Weapon Fighting Style)
  - `Throw Weapon (Transition)`: a temporary spell that shows up after throwing your main hand weapon. Throws the weapon from your main hand using a bonus action, behaving similarly to `Throw Weapon (Off-Hand)`. Because the game automatically switches weapon hands, this is to ensure you can still throw your off-hand weapon using a bonus action after it was automatically moved to your main hand
* To use this option, I recommend also using the [`freeWeaponEquip`](https://github.com/ZerdBG3/RAW/blob/main/Features.md#free-weapon-equip-%EF%B8%8F-freeweaponequip) option, so you can always equip one weapon per turn for free, allowing you to equip one weapon as part of your throwing action

## Two Weapon Fighting ⚙️ `twoWeaponFighting`
_Depended by: [`rogue`](https://github.com/ZerdBG3/RAW/blob/main/Features.md#rogue-%EF%B8%8F-rogue), [`rogue_thief`](https://github.com/ZerdBG3/RAW/blob/main/Features.md#rogue-thief-%EF%B8%8F-rogue_thief)_, [`throw`](https://github.com/ZerdBG3/RAW/blob/main/Features.md#throw-%EF%B8%8F-throw)
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
