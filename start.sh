#!/bin/bash

export WINEPREFIX=/app/wineprefix
wineboot --init

cd /app/server

echo "Starting Novetus 2010L server..."
wine ServerWrapper.exe config.ini
