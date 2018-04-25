@echo off
title Get ip address from name
set /p computer="Enter remote Computer's name: "
echo Returning IP Address of %computer%...
for /F "tokens=2 skip=4" %%a in ('"nslookup %computer%"') do echo %%a
pause