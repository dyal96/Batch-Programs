@echo off
setlocal enabledelayedexpansion

set "sourceDirectory=C:\Users\admin\Desktop\orignal_folder"
set "targetDirectory=C:\Users\admin\Desktop\clone_here_folder"

for /r "%sourceDirectory%" %%F in (.) do (
    set "folderPath=%%F"
    set "folderPath=!folderPath:%sourceDirectory%=%targetDirectory%!"
    echo mkdir "!folderPath!" >> makefolders.bat
)

echo Folder structure extracted and saved to makefolders.bat successfully.

