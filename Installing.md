# Requirements
* This mod requires Norbyte's [BG3 Script Extender](https://github.com/Norbyte/bg3se/releases). You can install it following the instructions on its page, or install through Laughing Leader's [Mod Manager](https://github.com/LaughingLeader/BG3ModManager)

![](https://github.com/ZerdBG3/RAW/assets/40004649/cd17077f-d8da-48e9-ba20-d258266e6367)

# First installation
* Locate your Profile Folder. You can click on the `Open Profile Folder` on the launcher
![](https://i.imgur.com/hvJVL0j.png)
* Download the latest `RAW.pak` file from [Releases](https://github.com/ZerdBG3/RAW/releases) and place it on the `Mods` folder inside the Profile folder opened previously, creating the `Mods` folder if it doesn't exist (the complete path should look something like `\Users\{USER_NAME}\AppData\Local\Larian Studios\Baldur's Gate 3\Mods`)
* Next, you need to setup your mod's profile:
  * I recommend using Laughing Leader's [Mod Manager](https://github.com/LaughingLeader/BG3ModManager) to set up your mod profile
  * If you wish to manually set it up, download the `modsettings.lsx` file on the root of this project (or access it [here](https://github.com/ZerdBG3/RAW/blob/main/modsettings.lsx)) and place it on the Public Player Profile (the complete path should look something like `\Users\{USER_NAME}\AppData\Local\Larian Studios\Baldur's Gate 3\PlayerProfiles\Public`). You should replace the file that already exists there

# Optional Configurations
* To turn on/off the mod features or customize them, copy the [`ModOptions.json`](https://github.com/ZerdBG3/RAW/blob/main/ModOptions.json) file to the `Script Extender` folder inside the Profile folder, creating it if necessary. The complete path should look something like `\Users\{USER_NAME}\AppData\Local\Larian Studios\Baldur's Gate 3\Script Extender`
* You only need to set the configuration file if you want to alter the default behavior. Therefore, there is no need to download and set the file up if you are not going to change any of its values. All features are enabled by default
* Simply change the `enabled` from `true` to `false` on whichever feature you want to turn off. For customizable features, keep `enabled` as `true` and change the `value` for a valid one specified by the option's description

| Option | Default | Description | 
|---|---|---|
| [attunement](https://github.com/ZerdBG3/RAW/blob/main/Features.md#attunement-%EF%B8%8F-attunement) | 3 | Sets a limit to the amount of magic items a character can have attuned at once (choose a value between 1 and 10). |
| [spells_bonusAction](https://github.com/ZerdBG3/RAW/blob/main/Features.md#weapon-sets-%EF%B8%8F-spells_bonusaction) | - | Enforces the spell casted as a bonus action rule stopping casting other leveled spells on the same turn. |
| [spells_duration](https://github.com/ZerdBG3/RAW/blob/main/Features.md#bonus-action-spells-rule-%EF%B8%8F-spells_bonusaction) | - | Removes statuses that last up to 1 hour on Short Rest. |
| [weaponSets](https://github.com/ZerdBG3/RAW/blob/main/Features.md#weapon-sets-%EF%B8%8F-weaponspells) | - | Disable Weapon Sets. Equipping a ranged weapon unequips melee weapons and vice-versa. |
| [weaponSpells](https://github.com/ZerdBG3/RAW/blob/main/Features.md#weapon-spells-%EF%B8%8F-weaponspells) | - | Removes weapon spells/passives from basic weapons, such as Cleave, Overwhelm, Piercing Shot and Topple. |

* If you want to make sure your configurations are being loaded properly, turn on the Debug Console for the Script Extender by creating a `ScriptExtenderSettings.json` file on the same folder the extender was installed (`\steamapps\common\Baldurs Gate 3\bin`). The file should contain the following:
```json
{
    "CreateConsole": true
}
```
* Upon entering the game with this file, a console will open alongside the game. You should see something similar to this, indicating your Mod Options loaded properly and are applied (_don't close the console, or your game will close as well. Just remove the `ScriptExtenderSettings.json` afterwards if you no longer want it to open alongside your game_)

![image](https://github.com/ZerdBG3/RAW/assets/40004649/9cf40487-80a8-42d8-a40b-c81b719b6558)

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
