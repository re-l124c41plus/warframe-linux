echo off
title Warframe Command Line Install tool
set gameDir=%cd%\Downloaded\Public
cmd /C "%gameDir%\Drivers\DirectX9\DXSETUP.exe /silent"
cmd /C "%gameDir%\Warframe-updater.exe -log:/Preprocess.log -threadedworker:1 -cluster:public -language:en -applet:/EE/Types/Framework/ContentUpdate"
exit 0
