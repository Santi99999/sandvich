#!/bin/bash

export WINEPREFIX="/home/runner/.wine-roblox"
export DISPLAY=":0"

echo "iniciando prefix de wine"
xvfb-run -a wineboot --init

echo "instalando mfc90.dll"
winetricks -q vcrun2008

echo "iniciando server: novetus 2010L"
cd server

xvfb-run -a wine RobloxApp_server.exe -place "place.rbxl" -port 53640
