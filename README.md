## Installation Instructions


Option A: Download Lutris. If you have lutris already, please make sure it is updated to version 0.4.13 or higher, as older versions had problems running batch scripts.  Next, run my Lutris install script for warframe:  
[Lutris 0.4.13](https://lutris.net/downloads/)  
[Warframe Install Script for Lutris](https://lutris.net/games/warframe/)  

Option B: Without Lutris:  
1. Install wine-staging 2.17 (or higher) for your linux distribution.  

2. Download a copy of my warframe wine wrapper repo and extract it somewhere: [warframe-linux-master](https://github.com/GloriousEggroll/warframe-linux/archive/master.zip)  

3. Open the extracted folder in a terminal and:  

```shell
  chmod a+x install.sh
```

# Optionally update the install directory in install.sh - if you do so, update uninstall.sh as well

```shell
  ./install.sh
```

4. Launch the game via any of the following methods:  

```
  Applications>Games>Warframe
  Warframe desktop shortcut
  type "warframe" in a terminal
```

5. There will be a black box that comes up - this will update your warframe game. Let it run. When it finishes, the Launcher will run. Press play!  

## Uninstallation/Removal Instructions
This applies to non-lutris only: 

```shell
  chmod a+x uninstall.sh
  ./uninstall.sh
```

## Technical notes:  
Known issues:
Local Reflections cause graphical glitches. Motion blurring is broken, Depth of Field causes stuttering and does not work correctly. Leave them off.  

These settings are disabled in the launcher to prevent crashing and for better performance:  

```
  64-bit mode
  Launcher GPU Acceleration
  Multithreading (this is handled by csmt instead. Game's MT causes artifacting)
```

These settings are disabled by default to reduce gameplay stuttering and/or graphical glitches:  

```
  Vsync: OFF
  Local Reflections: OFF
  Local Reflection Blur: OFF
  Motion Blurring: OFF
  Depth of Field: OFF
```

You can set all other graphics settings as you wish.
