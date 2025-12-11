#!/bin/bash

export WINEPREFIX=/app/wineprefix
export DISPLAY=:99

echo ">>> inicializando wine..."
xvfb-run -a wineboot --init

echo ">>> instalando vcrun2008..."
xvfb-run -a winetricks -q vcrun2008

echo ">>> iniciando server 2010L..."
cd /app/server
xvfb-run -a wine RobloxApp_server.exe -place "Place.rbxl" -port $PORT
