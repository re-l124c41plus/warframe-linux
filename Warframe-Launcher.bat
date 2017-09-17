
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

start /wait wget.exe /transfer "Warframe" "http://content.warframe.com/dl/Warframe.msi" "Warframe.msi"

:CheckForFile
IF EXIST "Warframe.msi" GOTO FoundIt

REM If we get here, the file is not found.

REM Wait 60 seconds and then recheck.
REM If no delay is needed, comment/remove the timeout line.
ping -n 10 0.0.0.0 > nul

GOTO CheckForFile

:FoundIt
msiexec /i Warframe.msi
