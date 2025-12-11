#!/bin/bash

export WINEPREFIX=/app/wineprefix
wineboot --init

cd /app/server

echo "starting 2010l server..."
wine RobloxApp_server.exe -place "Place.rbxl" -port $PORT
