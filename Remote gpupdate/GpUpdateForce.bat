@echo off
title Force gpupdate on remote computer
echo Enter remote Computer's name or IP Adress:
set /p computer=""
echo Running gpupdate on %computer%...
psexec \\%computer% -i gpupdate /force
pause