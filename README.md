## Installation Instructions

*Please be aware that these steps can be easily avoided by installing [Lutris 0.4.13](https://lutris.net/downloads/) or higher and using it to install my [Warframe Install Script](https://lutris.net/games/warframe/).

1. Install wine-staging 2.17 (or higher) patched with my patch found here:  
[Warframe Mission loading/exit crash fix](https://raw.githubusercontent.com/GloriousEggroll/wine-warframe-patches/master/0001-revert-changes-that-cause-warframe-mission-loading-e.patch)  

2. Create a 64 bit wine prefix for Warframe:  

    ```
    WINEPREFIX=~/.Warframe winecfg  
    ```

3. Install Warframe wine dependencies:  

    ```
    WINEPREFIX=~/.Warframe winetricks vcrun2015 devenum quartz xact xinput win7 
    ```

4. Extract all files in this git repository to ~/.Warframe/drive_c/Program\ Files/Warframe/  

5. cd into ~/.Warframe/drive_c/Program\ Files/Warframe/

6. chmod wget.exe. This is simply a shell script for wget that i renamed into a .exe, you can see its contents in any text editor.
   ```
   chmod a+x wget.exe
   ```
7. Move EE.cfg to ~/.Warframe/drive_c/users/YOUR-USER-NAME/Local\ Settings/Application\ Data/Warframe  

8. Import wf.reg into registry via regedit:  

    ```
    WINEPREFIX=~/.Warframe wine regedit /S wf.reg  
    ```


9. LAUNCH THE GAME using Warframe-Launcher.bat:  

    ```
    WINEPREFIX=~/.Warframe wine cmd /C Warframe-Launcher.bat  
    ```

# Always launch the game using Warframe-Launcher.bat. 

## But why?

a) It ensures that Launcher.exe is removed and always downloads a fresh copy of Warframe.msi from the warframe website.

## Technical notes:  
Known issues:
Tessellation and Local Reflections cause graphical glitches. Motion blurring causes stuttering and does not work correctly. Leave them off.

These settings are disabled in the launcher to prevent crashing and for better performance:
  ```
-64-bit mode
-Launcher GPU Acceleration
  ```
These settings are disabled by default to reduce gameplay stuttering and/or graphical glitches:
  ```
-Vsync: OFF
-Tessellation: OFF
-Local Reflections: OFF
-Local Reflection Blur: OFF
-Motion Blurring: OFF
-Depth of Field: OFF
  ```
You can set all other graphics settings as you wish.
