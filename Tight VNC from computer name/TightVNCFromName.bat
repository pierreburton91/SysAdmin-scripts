@echo off
title Connect with TightVNC from name
set /p computer="Enter remote Computer's name: "
for /F "tokens=2 skip=4" %%a in ('"nslookup %computer%"') do psexec -d "C:\Program Files\TightVNC\tvnviewer.exe" %%a
