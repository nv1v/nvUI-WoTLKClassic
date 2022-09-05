# nvUI-WoTLKClassic  
- Author: Nviv    
- Updated: Sep 9, 2022

## Summary
> Custom add-ons created and used by Nviv for World of Warcraft: Wrath of the Lich King Classic. These add-ons or variantions of them have been used throughout Burning Crusade Classic & Live Shadowlands (not included here) and are in mostly working conditions.

## Features
An addon that tries to be as minimal as "necessary". This addon will statically adjust the position, opacity and scale of elements in the default user interface. This may include the following:
- Unit Frames(Player, Target, TargetofTarget, Class Coloring)
- Player Cast Bars(Scale, Remove Border/Clean)
- MiniMap(Enable Mouse-wheel Zoom, Opacity)
- Nameplates(Class Coloring)
- Action Bar, Primary + Secondary(Scale, Position, Opacity)
- Action Bar, Top-left + Top-right(Scale, Position, Opacity)
- Action Bar, Utility / Far-Right Corner(Scale, Position, Opacity)
- Menu Buttons(Scale, Position, Opacity)
- PetBar(Scale, Position, Opacity)
- ExperienceBar(Scale, Position, Opacity)
- Hotkey Keybinds(Adjusts the formatting of text on keybinds)

## Notes
- Typing "/ms" in the in-game chat will print your current latency(ms).
- The core.lua scripts for each add-on are fairly well commented and position/opacity variables can be lightly adjusted.
- The core.lua scripts have a "verbosemode" variable that is set to 1 by default. Set this to 0 to prevent output to the console at login.
    
## Disclaimer 
- I use UI Scale on the lowest setting and recommend doing the same if using these addons... (Settings > System > Advanced > UI Scale)
- Most changes are made to my personal tastes, and may or may not be useful to others.
- These add-ons were tested and work with my version of WoW. YMMV.

## Installation
1. Download latest release ([Releases](https://github.com/nv1v/nvUI-WoTLKClassic/releases))
2. Extract folder from release
3. Open the folder and delete README.md
4. Move add-on(s) in the folder to your WoW AddOns folder in the WoW Directory (e.g `C:/ProgramFiles/WorldofWarcraft/_classic/Interface/AddOns/`)
5. Login to WoW and enable the add-ons from the Addons or Interface menu.

### Other AddOns
> These addons maintain a default / blizz-like aethesetic or have quality-of-life value and are preferred to use with nvUI. These add-ons are not included in the release here and will need to be downloaded separately, such as from CurseForge.
> Other:
```
- Auctionator (buying/selling on the AH)
- BadBoy (block spam in server chats)
- BasicChatMods (minimal-ify chat window)
- Details! (damage/healing/other meters)
- Leatrix Maps (world map tweaks, may not be needed with Mapster(?))
- Leatrix Plus (general UI and QoL tweaks)
- Mapster (Map Addon)
- MinimapButtonButton (places all addon buttons on minimap into single collapsable button)
- ModernFrameFont (cleans up font used in unitframes and elsewhere)
- PixelPerfectAlign (toggle grid to help align UI elements, type "/ppa show")
- Plater (nameplates customization)
- Questie (quest tracking / assistant)
- tdBag2 (blizz-like one-bag)
- tdInspect (long distance inspect)
- tdPack2 (button to auto-sort tdBag2)
- Vendor Price (shows vendor price of items in tooltip)
- WeakAuras (cooldowns tracking)
```
