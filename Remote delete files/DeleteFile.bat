@echo off
title Delete file on remote computer
echo Enter remote Computer's name or IP Adress:
set /p computer=""

echo Enter folder path where the file is located:
set /p filePath=""

echo Enter file name you wish to delete (wildcards allowed):
set /p fileName=""

echo Deleting %fileName% at location %filePath% on %computer%...
psexec \\%computer% cmd.exe /c "pushd %filePath% && del %fileName%
pause