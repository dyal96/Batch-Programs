@echo off
setlocal enabledelayedexpansion
title HEIF to JPG Converter

:: Check if files were dragged and dropped
if "%~1"=="" (
    echo Drag and drop HEIF / HEIC files onto this batch file.
    pause
    exit /b
)

:: Create output folder
set "outfolder=%~dp1jpg"
if not exist "%outfolder%" mkdir "%outfolder%"

:: Check if ImageMagick exists
where magick >nul 2>&1
if errorlevel 1 (
    echo ImageMagick is not installed or not in PATH.
    echo Download from: https://imagemagick.org
    pause
    exit /b
)

:: Convert all dropped files
:loop
if "%~1"=="" goto done

echo Converting: %~nx1
magick "%~1" "%outfolder%\%~n1.jpg"

shift
goto loop

:done
echo.
echo Done! Converted files saved in:
echo %outfolder%
pause