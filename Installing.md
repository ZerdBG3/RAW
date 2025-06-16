# Requirements
> [!WARNING]  
> This mod requires Norbyte's [BG3 Script Extender](https://github.com/Norbyte/bg3se/releases). You can install it following the instructions on its page, or install through [Laughing Leader's BG3 Mod Manager](https://github.com/LaughingLeader/BG3ModManager):

<p align="left">
  <img src="https://github.com/ZerdBG3/RAW/assets/40004649/cd17077f-d8da-48e9-ba20-d258266e6367">
</p>

---

# First installation

<img align="right" width="55%" src="https://github.com/user-attachments/assets/313a1cc6-6df1-4662-a7c3-0cb58a277575">

* Download the latest `RAW.pak` file from [Releases](https://github.com/ZerdBG3/RAW/releases)
* Using Laughing Leader's BG3MM, Import the mod:

<br clear="right"/>
<br/>

* Click and drag the mod from the right panel to the left one and click the `Export` button:

<p align="left">
  <img src="https://github.com/user-attachments/assets/a9ce848a-d81c-48f4-96c4-28087b934f1a">
</p>

<details>
 <summary>Manual installation</summary>
 <p>
  
  * Locate your Profile Folder. You can click on the `Open Profile Folder` on the launcher
![](https://i.imgur.com/hvJVL0j.png)
  * Download the latest `RAW.pak` file from [Releases](https://github.com/ZerdBG3/RAW/releases) and place it on the `Mods` folder inside the Profile folder opened previously, creating the `Mods` folder if it doesn't exist (the complete path should look something like `\Users\{USER_NAME}\AppData\Local\Larian Studios\Baldur's Gate 3\Mods`)
* Download the `modsettings.lsx` file on the root of this project (or access it [here](https://github.com/ZerdBG3/RAW/blob/main/modsettings.lsx)) and place it on the Public Player Profile (the complete path should look something like `\Users\{USER_NAME}\AppData\Local\Larian Studios\Baldur's Gate 3\PlayerProfiles\Public`). You should replace the file that already exists there
  
 </p>
</details>

---

# Optional Configurations
> [!TIP]
> You only need to find and tweak the configuration file if you want to alter the default behavior. Therefore, there is no need to do anything beside installing the mod if you don't want to change any of the mod's default behavior

> [!NOTE]
> If you want to make sure your configurations are being loaded properly, turn on the Debug Console for the Script Extender using the BG3MM [`Settings` -> `Open Preferences` -> `Create Console`]

<details>
 <summary>Console example</summary>
 <p>

  * Once the game starts, a console will open alongside the game. In it, you'll be able to see enabled/disabled features and if your configuration files were properly loaded or not. Make sure you don't close the console, or your game will be closed.

  <p align="center">
    <img src="https://github.com/user-attachments/assets/9e984fd2-a300-4c52-a46c-00eab1aa5f6a">
  </p>
  <p>
   <img width="48%" src="https://github.com/user-attachments/assets/6e29dfa8-35a5-4cfa-824e-e76b68ba9085">
   <img width="48%" align="top" src="https://github.com/user-attachments/assets/61484d4d-a7a9-4fcd-934c-7f87950e956e">
  </p>
 </p>
</details>

* To turn on/off the mod features or customize them, access the `ModOptions.json` file at the folder `\Users\{USER_NAME}\AppData\Local\Larian Studios\Baldur's Gate 3\Script Extender\RAW\`. If the folder/file doesn't exist, open the game once with the mod active and it will create the file
* Simply change the `enabled` from `true` to `false` on whichever feature you want to turn off and `false` to `true` for those you want to turn on. For features which allow a `value`, keep `enabled` as `true` and change the `value` for a valid one specified by the option's description
* For customizable features 🔧, keep `enabled` as `true` and modify their configuration files at `\Users\{USER_NAME}\AppData\Local\Larian Studios\Baldur's Gate 3\Script Extender\RAW\{option}`. Opening the game once with the option enabled will create the folder and configuration files for each customizable option
* If you want to see logs of what's happening on any specific feature, change the value of its `log` to `true`

> [!CAUTION]
> All dependencies of enabled features will be automatically turned on to avoid inconsistencies or bugs in your game (if you want to disable a feature, you must also disable every feature on the `Depended by` column to actually disable it)

| Option | Depends on | Depended by | Default | Description | 
|---|---|---|---|---|
| [`attunement`](https://github.com/ZerdBG3/RAW/blob/main/Features.md#attunement-%EF%B8%8F-attunement) 🔧 | - | - | **enabled**<br>**`value:3`** | Sets a limit to the amount of magic items a character can have attuned at once (choose a value between 1 and 10). |
| [`barbarian`](https://github.com/ZerdBG3/RAW/blob/main/Features.md#barbarian-%EF%B8%8F-barbarian) | - | - | **enabled** | Changes to Reckless Attack. |
| [`barbarian_berserker`](https://github.com/ZerdBG3/RAW/blob/main/Features.md#barbarian-berserker-%EF%B8%8F-barbarian_berserker) | - | - | **enabled** | Removes Throw as a bonus action from Frenzy. |
| [`barbarian_wildMagic`](https://github.com/ZerdBG3/RAW/blob/main/Features.md#barbarian-wild-magic-%EF%B8%8F-barbarian_wildmagic) | - | - | **enabled** | Allows Wild Magic results to be used on the first turn and adjusts Shadowy Tendrils targeting. |
| [`concentration_failsafe`](https://github.com/ZerdBG3/RAW/blob/main/Features.md#concentration-failsafe-%EF%B8%8F-concentration_failsafe) | - | - | **enabled** | Gives the player a toggleable passive that stops them from casting concentration spells while already concentrating. |
| [`defaultActions`](https://github.com/ZerdBG3/RAW/blob/main/Features.md#default-actions-%EF%B8%8F-defaultactions) | - | `extraAttack`, `feats` | **enabled** | Changes to Jump and Shove. Introduces Distract and Dodge as player actions. |
| [`downed`](https://github.com/ZerdBG3/RAW/blob/main/Features.md#downed-%EF%B8%8F-downed) | - | - | **enabled** | Healing a downed character allows them to play their turn normally. |
| [`extraAttack`](https://github.com/ZerdBG3/RAW/blob/main/Features.md#extra-attack-%EF%B8%8F-extraattack) | `defaultActions` | - | **enabled** | Removes Extra Attack stacking from multiple sources and allow Shove to be used as part of it. |
| [`familiars`](https://github.com/ZerdBG3/RAW/blob/main/Features.md#familiars-%EF%B8%8F-familiars) | - | - | **enabled** | Replaces familiar attacks with Distract and adjust their stats. |
| [`feats`](https://github.com/ZerdBG3/RAW/blob/main/Features.md#feats-%EF%B8%8F-feats) | `defaultActions` | - | **enabled** | Changes to Shield Master. |
| [`freeWeaponEquip`](https://github.com/ZerdBG3/RAW/blob/main/Features.md#free-weapon-equip-%EF%B8%8F-freeweaponequip) | - | - | **enabled** | The first weapon equipped in a turn doesn't cost an Action Point. |
| [`fighter_battleMaster`](https://github.com/ZerdBG3/RAW/blob/main/Features.md#fighter-battle-master-%EF%B8%8F-fighter_battleMaster) | - | - | **enabled** | Adjust Feinting Attack Use Cost. |
| [`highGround`](https://github.com/ZerdBG3/RAW/blob/main/Features.md#high-ground-%EF%B8%8F-highground) | - | - | **enabled** | Removes the High Ground bonus to attack rolls. |
| [`initiative`](https://github.com/ZerdBG3/RAW/blob/main/Features.md#initiative-%EF%B8%8F-initiative) | - | - | **enabled** | Changes Initiative Dice Roll from 1d4 to 1d20. |
| [`instantDeath`](https://github.com/ZerdBG3/RAW/blob/main/Features.md#instant-death-%EF%B8%8F-instantDeath) | - | - | **enabled** | Kills players outright if damage taken exceeds current hit points by hit point maximum. |
| [`intangibleSummons`](https://github.com/ZerdBG3/RAW/blob/main/Features.md#intangible-summons-%EF%B8%8F-intangiblesummons) | - | - | **enabled** | Changes to Flaming Sphere, Guardian of Faith and Spiritual Weapon to make them invulnerable and ignored by the AI. |
| [`invisibility`](https://github.com/ZerdBG3/RAW/blob/main/Features.md#invisibility-%EF%B8%8F-invisibility) 🔧 | - | - | **enabled** | Changes to invisibility rules and sneaking while invisible. |
| [`monk`](https://github.com/ZerdBG3/RAW/blob/main/Features.md#monk-%EF%B8%8F-monk) | - | - | **enabled** | Changes to most monk base features. |
| [`monk_fourElements`](https://github.com/ZerdBG3/RAW/blob/main/Features.md#monk-way-of-the-four-elements-%EF%B8%8F-monk_fourElements) | - | - | **enabled** | Adjust specific disciplines, without necessarily making them RAW. |
| [`prone`](https://github.com/ZerdBG3/RAW/blob/main/Features.md#prone-%EF%B8%8F-prone) | - | - | **enabled** | Changes the advantage and disadvantage conditions while Prone. |
| [`rogue`](https://github.com/ZerdBG3/RAW/blob/main/Features.md#rogue-%EF%B8%8F-rogue) | `throw` | `rogue_thief` | **enabled** | Changes to Cunning Action and Sneak Attack. |
| [`rogue_thief`](https://github.com/ZerdBG3/RAW/blob/main/Features.md#rogue-thief-%EF%B8%8F-rogue_thief) | `rogue`,`stabilize` | - | **enabled** | Changes to Fast Hands and Second-Story Work. |
| [`shortRest`](https://github.com/ZerdBG3/RAW/blob/main/Features.md#short-rest-%EF%B8%8F-shortrest) | - | - | **enabled** | Short Rest becomes an active downtime period. |
| [`skillCheck_critFail`](https://github.com/ZerdBG3/RAW/blob/main/Features.md#disable-critical-fail-on-checks-%EF%B8%8F-skillcheck_critfail) | - | - | **enabled** | Disables the possibility of a critical fail on ability or skill checks and saving throws. |
| [`spells`](https://github.com/ZerdBG3/RAW/blob/main/Features.md#spells-%EF%B8%8F-spells) | - | - | **enabled** | Various changes to spells and statuses applied by spells. |
| [`spells_bonusAction`](https://github.com/ZerdBG3/RAW/blob/main/Features.md#spells---bonus-action-rule-%EF%B8%8F-spells_bonusaction) | - | - | **enabled** | Enforces the spell casted as a bonus action rule stopping casting other leveled spells on the same turn. |
| [`spells_duration`](https://github.com/ZerdBG3/RAW/blob/main/Features.md#spells---duration-%EF%B8%8F-spells_duration) | - | `spells_durationExpanded` | **enabled** | Changes spells durations to match RAW. |
| [`spells_durationExpanded`](https://github.com/ZerdBG3/RAW/blob/main/Features.md#spells---duration-expanded-%EF%B8%8F-spells_durationexpanded) | `spells_duration` | - | **disabled** | Extends the list from `spells_duration` to include non-combat spells. |
| [`spells_onApplyAndOnTurn`](https://github.com/ZerdBG3/RAW/blob/main/Features.md#spells---on-apply-and-on-turn-%EF%B8%8F-spells_onapplyandonturn) | - | - | **enabled** | Changes the damage application timing of spells like Cloud of Daggers, Moonbeam and Spirit Guardians. |
| [`spells_surfaceRemoval`](https://github.com/ZerdBG3/RAW/blob/main/Features.md#spells---surface-removal-%EF%B8%8F-spells_surfaceremoval) | - | - | **enabled** | Removes surface interaction for spells that are not AoE. |
| [`spells_wildshape`](https://github.com/ZerdBG3/RAW/blob/main/Features.md#spells---wildshape-%EF%B8%8F-spells_wildshape) | - | - | **enabled** | Allows concentration spells to be reactivated during Wildshape. |
| [`stabilize`](https://github.com/ZerdBG3/RAW/blob/main/Features.md#stabilize-%EF%B8%8F-stabilize) | - | `rogue_thief` | **enabled** | Changes Help to only stabilize a character, healing once out of combat. |
| [`throw`](https://github.com/ZerdBG3/RAW/blob/main/Features.md#throw-%EF%B8%8F-throw) | `twoWeaponFighting` | `rogue`, `rogue_thief` | **enabled** | Changes to the throw action and introduction of the throwing weapon spell. |
| [`twoWeaponFighting`](https://github.com/ZerdBG3/RAW/blob/main/Features.md#two-weapon-fighting-%EF%B8%8F-twoweaponfighting) | - | `rogue`, `rogue_thief`, `throw` | **enabled** | Removes automatic off-hand attacks and only allows them after attacking with a weapon while dual wielding. |
| [`weaponSets`](https://github.com/ZerdBG3/RAW/blob/main/Features.md#weapon-sets-%EF%B8%8F-weaponsets) | - | - | **enabled** | Disable Weapon Sets. Equipping a ranged weapon unequips melee weapons and vice-versa. |
| [`weaponSpells`](https://github.com/ZerdBG3/RAW/blob/main/Features.md#weapon-spells-%EF%B8%8F-weaponspells) | - | - | **enabled** | Removes weapon spells/passives from basic weapons, such as Cleave, Overwhelm, Piercing Shot and Topple. |

---

# Updating your version
* Be aware that some updates won't work on existing save files and might require new games to work
* To update your mod version, simply follow the same steps on the [First installation](https://github.com/ZerdBG3/RAW/blob/main/Installing.md#first-installation) section, replacing the old `.pak` with the new one
* There is no need to change anything in your `modsettings.lsx` file when updating your mod version

# Playing with multiple mods
* Again, Laughing Leader's [Mod Manager](https://github.com/LaughingLeader/BG3ModManager) takes care of that, but if you want to do it manually:
* To use multiple mods, you'll need to manually edit your `modsettings.lsx` file to include all mods (you can use Notepad++, VSCode, Sublime or any other text editor to edit `.lsx` files)
* The file already has an example commented in (the parts between `<!-- -->`), with an example on how to include a generic mod.
* On the `<node id="ModOrder">`, you'll notice commented block (between `<!-- -->`). Uncomment by removing the `<!--` at the beginning and `-->` at the end and change the atribute `value` with the `UUID` of the other mod
* Next, on the `<node id="Mods">`, there will also be a commented block. Uncomment it and replace the attributes `Folder`, `Name`, `UUID` and `Version` with the ones available from the other mod
* The `ModOrder` is of your choosing. As a rule of thumb, place the mods you want to have priority on the bottom of the mod order. To change the load order, you need to swap the entire `<node id="Module"> ... </node>` at the top with each other
* More mods can be added by including new nodes inside `<node id="ModOrder">` and `<node id="Mods">`
