echo off
title Warframe Linux Game Launcher
set launcherDir=C:\users\%USERNAME%\Local Settings\Application Data\Warframe\Downloaded\Public\Tools
set gameDir=C:\Program Files\Warframe\Downloaded\Public

start /wait "%gameDir%\Warframe-updater.exe" -log:/Preprocess.log -dx10:0 -dx11:0 -threadedworker:1 -cluster:public -language:en -applet:/EE/Types/Framework/ContentUpdate
del "%gameDir%\Warframe.exe"
if exist "%launcherDir%\Launcher.exe" (
del "%launcherDir%\Launcher-copy.exe"
move /wait /Y "%launcherDir%\Launcher.exe" "%launcherDir%\Launcher-copy.exe"
) else (
start /wait Warframe.msi
move /wait /Y "%launcherDir%\Launcher.exe" "%launcherDir%\Launcher-copy.exe"
)

start "%launcherDir%\Launcher-copy.exe"
ping -n 10 127.0.0.1 > nul
xcopy /Y "%gameDir%\Warframe.exe" "%gameDir%\Warframe-updater.exe"
exit 0
