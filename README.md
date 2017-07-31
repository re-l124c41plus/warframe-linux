## Installation Instructions

*Please be aware that these steps can be easily avoided by installing [Lutris 0.4.9](https://lutris.net/downloads/) or higher and using it to install my [Warframe Install Script](https://lutris.net/games/warframe/). Lutris also installs my patched version of Wine-Staging 2.7  

In the event you must use wine directly, below are the following steps to run warframe with wine. Please also note wine must be patched with my [Warframe patch](https://raw.githubusercontent.com/GloriousEggroll/wine-warframe-patches/master/0001-revert-changes-that-cause-warframe-mission-loading-e.patch).  

1. Install wine-staging 2.7 (or higher) patched with my patch found here:  
[Warframe Mission loading/exit crash fix](https://raw.githubusercontent.com/GloriousEggroll/wine-warframe-patches/master/0001-revert-changes-that-cause-warframe-mission-loading-e.patch)  

2. Create a 32 bit wine prefix for Warframe:  

    ```
    WINEARCH=win32 WINEPREFIX=~/.Warframe winecfg  
    ```

--Enable CSMT in the staging tab of winecfg  

3. Install Warframe wine dependencies:  

    ```
    WINEARCH=win32 WINEPREFIX=~/.Warframe winetricks winxp vcrun2015 directx9 hosts wininet winhttp devenum quartz  
    ```

4. Extract all files in this git repository to ~/.Warframe/drive_c/Program\ Files/Warframe/  

5. cd into ~/.Warframe/drive_c/Program\ Files/Warframe/

6. chmod wget.exe. This is simply a shell script for wget that i renamed into a .exe, you can see its contents in any text editor.
   ```
   chmod a+x wget.exe
   ```

7. Download the official game launcher (it is a necessary file): 

    ```
    wget http://content.warframe.com/dl/Warframe.msi
    ```

8. Move EE.cfg to ~/.Warframe/drive_c/users/YOUR-USER-NAME/Local\ Settings/Application\ Data/Warframe  

9. Import wf-launcher.reg, wf-wine-direct3d.reg, wf-wine-dlloverrides.reg into registry via regedit:  

    ```
    WINEARCH=win32 WINEPREFIX=~/.Warframe wine regedit /S wf-launcher.reg  
    WINEARCH=win32 WINEPREFIX=~/.Warframe wine regedit /S wf-wine-direct3d.reg  
    WINEARCH=win32 WINEPREFIX=~/.Warframe wine regedit /S wf-wine-dlloverrides.reg  
    ```


10. LAUNCH THE GAME using Warframe-Launcher.bat:  

    ```
    WINEARCH=win32 WINEPREFIX=~/.Warframe wine cmd /C Warframe-Launcher.bat  
    ```

# Always launch the game using Warframe-Launcher.bat. 

## But why?

a) It ensures that Launcher.exe is removed and always downloads a fresh copy of Warframe.msi from the warframe website.

## Technical notes:  
Upon first install the installer WILL take a long time at "checking for new content", just let it do it's thing.

These settings are disabled by default to reduce gameplay stuttering:  
-Anti-aliasing  
-Vsync  
-Anisotropic Filtering  
-Local Reflection Blurring  
-Motion Blurring  
-Depth of Field  

These settings are disabled in the launcher for safe updating and to improve performance:  
-64-bit mode  
-DX10  
-DX11  
-Bulk-downloading  
-Launcher GPU Acceleration  

You can set all other graphics settings as you wish.  

## Known Issues:  
-Changing Screen Size and Switching between Borderless/Fullscreen/Windowed crashes the game  
-Fullscreen mode does not work  

## Tips:  
To run the game in borderless fullscreen:  
1. Open ~/.Warframe/drive_c/users/YOUR-USER-NAME/Local Settings/Application Data/Warframe/EE.cfg  
2. Add this in the [Windows_Config,/EE/Types/Base/Config] section:  
Graphics.Borderless=1  
