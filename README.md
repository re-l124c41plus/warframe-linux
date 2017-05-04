## Installation Instructions

1. Install wine-staging 2.7 (or higher) patched with my patch found here:  
[Warframe Mission loading/exit crash fix](https://raw.githubusercontent.com/GloriousEggroll/wine-warframe-patches/master/0001-revert-changes-that-cause-warframe-mission-loading-e.patch)  

2. Create a 32 bit wine prefix for Warframe:  

    WINEARCH=win32 WINEPREFIX=~/.Warframe winecfg  

--Enable CSMT in the staging tab of winecfg  

3. Install Warframe wine dependencies:  

    WINEARCH=win32 WINEPREFIX=~/.Warframe winetricks winxp vcrun2015 directx9 hosts wininet winhttp devenum quartz  

4. Extract all files in this git repository to ~/.Warframe/drive_c/Warframe/  

5. Move EE.cfg to ~/.Warframe/drive_c/users/YOUR-USER-NAME/Local\ Settings/Application\ Data/Warframe  

6. Import wf-launcher.reg, wf-wine-direct3d.reg, wf-wine-dlloverrides.reg into registry via regedit:  

    WINEARCH=win32 WINEPREFIX=~/.Warframe wine regedit /S wf-launcher.reg  
    WINEARCH=win32 WINEPREFIX=~/.Warframe wine regedit /S wf-wine-direct3d.reg  
    WINEARCH=win32 WINEPREFIX=~/.Warframe wine regedit /S wf-wine-dlloverrides.reg  

7. Install the game with Warframe-Linux-Installer.bat. The black box that comes up is the command line auto-updater. Progress is shown in the window title.  

    WINEARCH=win32 WINEPREFIX=~/.Warframe wine cmd /C Warframe-Linux-Installer.bat  

8. LAUNCH THE GAME using Warframe-Launcher.bat:  

    WINEARCH=win32 WINEPREFIX=~/.Warframe wine cmd /C Warframe-Launcher.bat  

## Always launch the game using Warframe-Launcher.bat. It runs the black-box updater before each launch to ensure your game is up to date.  

Technical notes:  

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

## Known Issues  
Known Issues:  
-Changing Screen Size and Switching between Borderless/Fullscreen/Windowed crashes the game  
-Fullscreen mode does not work  

To run the game in borderless fullscreen:  
1. Open ~/.Warframe/drive_c/users/YOUR-USER-NAME/Local Settings/Application Data/Warframe/EE.cfg  
2. Add this in the [Windows_Config,/EE/Types/Base/Config] section:  
Graphics.Borderless=1  
