echo off
title Warframe Command Line Install tool
start /wait C:\Warframe\Downloaded\Public\Drivers\DirectX9\DXSETUP.exe /silent
start /wait C:\Warframe\Downloaded\Public\Warframe.exe -log:/Preprocess.log -dx10:0 -dx11:0 -threadedworker:1 -cluster:public -language:en -applet:/EE/Types/Framework/ContentUpdate
exit 0