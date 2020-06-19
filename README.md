# Craft name for Betaflight TX Lua Scripts

This is a modification of [betaflight-tx-lua-scripts](https://github.com/betaflight/betaflight-tx-lua-scripts) to be able to configure vtx tables for different craft names. This means you can share the same model with different crafts that have different vtx hardware. The solution consist of changes to the original lua scripts to support craft name and a helper widget to display the craft name on the screen to easily see what craft you have just selected.

Unfortunately craft name doesn’t seem to be accessible through MSP so instead we have to store the craft names on the remote and implement switching the craft name with a manual switch.

## Requirements
- [Betaflight 4.1](https://github.com/betaflight/betaflight) or newer
- [OpenTX 2.3.4](https://www.open-tx.org/) or newer
- [betaflight-tx-lua-scripts 1.5](https://github.com/betaflight/betaflight-tx-lua-scripts/releases/tag/1.5.0)

## Installing
First install [betaflight-tx-lua-scripts 1.5](https://github.com/betaflight/betaflight-tx-lua-scripts/releases/tag/1.5.0) as instructed. Then download a zip file with the corresponding version of CraftName from the [releases page](../../releases) and unzip the files and drag the contents to your radios SD card and overwrite any files.

## Setting up craft names

1. Create a switch in `Special Functions` to set the value of the global variable `GV9` from 1 to maximum on your remote for your model. For example if you have a six position switch you can set it to set `GV9=1` to `GV9=6` and have 6 different craft names. If you have only 3 position switch then set it from `GV9=1` to `GV9=3`.

![Special Functions](/docs/images/special_functions.png)

2. Go to folder `/CraftName` on your remote and add a lua script file with the craft names for each model you want support for with different vtx. For example if you have a model named `Example` and three crafts named `Craft A`, `Craft B` and `Craft C`. Then the lua script file in the folder `/CraftName` will be called `Example.lua` and have the following content:

```Lua
return {"Craft A","Craft B","Craft C"}
```

This means that the switch in position 1 will map to `Craft A` and switch in position 2 will map to `Craft B` and etc.

3. This is not required but if you want to see what craft you have selected you can add the `CraftName` widget to display currently selected craft name.

## Widget setup
To setup the widget, add it to your screen and select the global variable `GV9` as the source. You can also adjust the size of the text with `Size`.

![Widget Settings](/docs/images/widget_settings.png)

## How to use
First select the correct craft name from the switch and then launch Betaflight LUA script and it will download the needed vtx table required as usual. You can see if you are using the correct vtx table because the name of the craft is displayed in the menu like this: `vtx settings (CraftName)`. You can then change your vtx settings as usual.
