# Craft name for Betaflight TX Lua Scripts

This is a modification of [betaflight-tx-lua-scripts] to be able to configure vtx tables for different craft names. This means you can share the same model with different crafts that have different vtx hardware. The solution consist of changes to the original lua scripts to use the craft name instead of the model name.

## Requirements
- [Betaflight] 4.1 or newer
- [OpenTX] 2.3.4 or newer
- [betaflight-tx-lua-scripts 1.5]

## Installing
First install [betaflight-tx-lua-scripts] as instructed. Then download a zip file with the corresponding version of CraftName from the [releases page] and unzip the files and drag the contents to your radios SD card and overwrite any files.

## How to use
Launch Betaflight LUA script and it will fetch the craft name and download the needed vtx table for the specified craft name. You can see if you are using the correct vtx table because the name of the craft is displayed in the menu like this: `vtx settings (CraftName)`. You can then change your vtx settings as usual.

[betaflight-tx-lua-scripts]: https://github.com/betaflight/betaflight-tx-lua-scripts
[Betaflight]: https://github.com/betaflight/betaflight
[OpenTX]: https://www.open-tx.org
[betaflight-tx-lua-scripts 1.5]: https://github.com/betaflight/betaflight-tx-lua-scripts/releases/tag/1.5.0
[releases page]: ../../releases
