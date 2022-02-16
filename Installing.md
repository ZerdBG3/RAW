# First installation
* Download the latest `.pak` file from [Releases](https://github.com/ZerdBG3/DnD-Rebalancing/releases) and place it under `\Users\{USER_NAME}\AppData\Local\Larian Studios\Baldur's Gate 3\Mods`, where `{USER_NAME}` is the name of your user on the computer (Create the `Mods` folder if it doesn't exist)
* Download the `modsettings.lsx` file on the root of this project (or access it [here](https://github.com/ZerdBG3/DnD-Rebalancing/blob/main/modsettings.lsx)) and place it under `Documents\Larian Studios\Baldur's Gate 3\PlayerProfiles\{YOUR_PROFILE}`, where `{YOUR_PROFILE}` is the profile you want the mod to be active on. You should replace the file that already exists there

# Updating your version
* Be aware that some updates won't work on existing save files and might require new games to work
* To update your mod version, simply follow the same steps on the [First installation](https://github.com/ZerdBG3/DnD-Rebalancing/blob/main/Installing.md#first-installation) section, replacing the old `.pak` with the new one
* There is no need to change anything in your `modsettings.lsx` file when updating your mod version

# Playing with multiple mods
* To use multiple mods, you'll need to manually edit your `modsettings.lsx` file to include all mods (you can use Notepad++, VSCode, Sublime or any other text editor to edit `.lsx` files)
* The file already has an example commented in (the parts between `<!-- -->`), with an example on how to include [Alana's Custom Character Enhancer mod](https://www.nexusmods.com/baldursgate3/mods/10)
* On the `<node id="ModOrder">`, you'll notice commented block (between `<!-- -->`). Uncomment by removing the `<!--` at the beginning and `-->` at the end and change the atribute `value` with the `UUID` of the other mod
* Next, on the `<node id="Mods">`, there will also be a commented block. Uncomment it and replace the attributes `Folder`, `Name`, `UUID` and `Version` with the ones available from the other mod
* The `ModOrder` is of your choosing. As a rule of thumb, place the mods you want to have priority on the bottom of the mod order. To change the load order, you need to swap the entire `<node id="Module"> ... </node>` with each other
* More mods can be added by including new nodes inside `<node id="ModOrder">` and `<node id="Mods">`
* At the end, your `modsettings.lsx` should look something like the image below. The red lines represent the `UUID` of the mod you're using (and they have to match), and the purple lines represent the other values you'll need to change
![](https://i.imgur.com/WtEjqvG.png)
