@echo off
title Perforaciones Ortiz
cd /d "%~dp0"
start "" "http://localhost:8061/index.html?v=61"
where py >nul 2>nul
if %errorlevel%==0 (
  py -3 -m http.server 8061
) else (
  python -m http.server 8061
)
