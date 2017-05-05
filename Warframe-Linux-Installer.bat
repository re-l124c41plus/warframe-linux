echo off
title Warframe Command Line Install tool
set gameDir=C:\Program Files\Warframe\Downloaded\Public
start /wait "%gameDir%\Drivers\DirectX9\DXSETUP.exe" /silent
start /wait "%gameDir%\Warframe-updater.exe" -log:/Preprocess.log -dx10:0 -dx11:0 -threadedworker:1 -cluster:public -language:en -applet:/EE/Types/Framework/ContentUpdate
exit 0