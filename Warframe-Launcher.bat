echo off
title Warframe Linux Game Launcher
start /wait C:\Warframe\Downloaded\Public\Warframe.exe -log:/Preprocess.log -dx10:0 -dx11:0 -threadedworker:1 -cluster:public -language:en -applet:/EE/Types/Framework/ContentUpdate
start /wait C:\Warframe\Downloaded\Public\Warframe.exe -fullscreen:0 -dx10:1 -dx11:1 -threadedworker:1 -cluster:public -language:en
exit 0