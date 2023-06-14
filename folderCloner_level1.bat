@echo off
setlocal enabledelayedexpansion

for /d /r %%F in (*) do (
    set "folderName=%%~nxF"
    echo mkdir "!folderName!" >> makefolders.bat
)

echo del makefolders.bat >> makefolders.bat

echo Folder names extracted and saved to makefolders.bat successfully.
