
title Warframe Linux Game Launcher

set launcherDir=C:\users\%USERNAME%\Local Settings\Application Data\Warframe\Downloaded\Public\Tools
set gameDir=%cd%\Downloaded\Public
set currDir=%cd%

if exist "%currDir%\Warframe.msi" (
del "%currDir%\Warframe.msi"
)

if exist "%gameDir%\Warframe.exe" (
del "%gameDir%\Warframe.exe"
)

if exist "%gameDir%\Warframe.x64.exe" (
del "%gameDir%\Warframe.x64.exe"
)

if exist "%launcherDir%\Launcher.exe" (
del "%launcherDir%\Launcher.exe"
)

wget.exe /transfer "Warframe" "http://content.warframe.com/dl/Warframe.msi" "Warframe.msi"
ping -n 5 0.0.0.0 > nul

msiexec /i Warframe.msi
ping -n 5 0.0.0.0 > nul

exit 0
