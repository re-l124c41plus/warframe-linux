echo off
title Warframe Linux Game Launcher
set launcherDir=C:\users\%USERNAME%\Local Settings\Application Data\Warframe\Downloaded\Public\Tools
set gameDir=C:\Warframe\Downloaded\Public

start /wait "%gameDir%\Warframe-updater.exe" -log:/Preprocess.log -dx10:0 -dx11:0 -threadedworker:1 -cluster:public -language:en -applet:/EE/Types/Framework/ContentUpdate
del "%gameDir%\Warframe.exe"
move /wait /Y "%launcherDir%\Launcher.exe" "%launcherDir%\Launcher-copy.exe"
sleep 5
start "%launcherDir%\Launcher-copy.exe"
exit 0
