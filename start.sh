#!/bin/bash

# Prefix de WineHQ
export WINEPREFIX=/app/wineprefix
wineboot --init

# Entrar a server
cd /app/server

# Ejecutar server de Novetus
wine RobloxApp_server.exe -place "place.rbxl" -port $PORT