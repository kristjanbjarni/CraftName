# Craft name for Betaflight TX Lua Scripts (DRAFT)

This is a modification of [betaflight-tx-lua-scripts](https://github.com/betaflight/betaflight-tx-lua-scripts) to be able to configure vtx tables for different craft names. This means you can share the same model with different crafts that have different vtx hardware. The solution consist of changes to the original lua scripts to support craft name and a helper widget to display the craft name on the screen to easily see what craft you have just selected.

Unfortunately craft name doesn’t seem to be accessible through MSP so instead we have to store the craft names on the remote and implement switching the craft name with a manual switch.

## Requirements
- Betaflight 4.1 or newer
- OpenTX 2.3.4 or newer;
- betaflight-tx-lua-scripts 1.5

## Installing

Download a zip file containing the latest version from the [releases page](releases).

Unzip the files from the link above and drag the contents to your radios SD card and overwrite any files.

## Setting up Craft names

1. Create a switch to set the value of the global variable ‘gvar9’ from 1 to maximum on your remote. For example if you have a six position switch you can set it to set gvar9=1 to gvar9=6 and have 6 different craft names. If you have only 3 position switch then set it from gvar9=1 to gvar9=3.

Example:
![Special Functions](/docs/images/special_functions.png)

2. Go to folder ‘/CraftName’ and add a lua script file with the craft names for each model you want support for different vtx. For example if you have a model named ‘Example’ and three crafts named ‘Craft A’, ‘Craft B’ and ‘Craft C’. Then the lua script file will be called ‘Example.lua’ and have the following content:

    return {“Craft A”,“Craft B”,“Craft C”}

This means that the switch in position 1 will map to craft name as “Craft A” and switch in position 2 will map to “Craft B” and etc.

3. This is not required but if you want to see what craft you have selected you can add the CraftName widget to display currently selected craft name.

## How to use
First select the correct craft name from the switch and then launch Betaflight LUA script and it will download the needed vtx table required as usual. You can see if you are using the correct vtx table because the name of the craft is displayed in the menu like this: ‘vtx settings (CraftName)’. You can then change your vtx settings as usual.

## Widget
To setup the widget, add it to your screen and select the global variable ‘gvar9’ as the source. You can also select the size of the text with ‘Size’.
!Widget Settings](/docs/images/widget_settings.png)
