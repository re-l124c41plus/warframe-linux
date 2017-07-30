echo off
title Warframe Command Line Install tool
set gameDir=%cd%\Downloaded\Public
start /wait "%gameDir%\Drivers\DirectX9\DXSETUP.exe" /silent
start /wait "%gameDir%\Warframe-updater.exe" -log:/Preprocess.log -threadedworker:1 -cluster:public -language:en -applet:/EE/Types/Framework/ContentUpdate
exit 0
