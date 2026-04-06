@echo off
setlocal enabledelayedexpansion

title PDF to JPG Converter (ImageMagick)
echo ==============================================
echo PDF to JPG Converter (ImageMagick)
echo ==============================================

if "%~1"=="" (
    echo Please drag and drop one or more PDF files onto this script.
    echo.
    pause
    exit /b
)

:loop
if "%~1"=="" goto :done

echo Processing "%~nx1"...
set "pdffile=%~1"
set "basefolder=%~dpn1"

rem Create a folder named after the PDF file
if not exist "!basefolder!" mkdir "!basefolder!"

rem Use ImageMagick to convert PDF to JPG with high quality (300 dpi)
rem The %%02d will pad the page numbers like page_00.jpg, page_01.jpg, etc.
magick -density 300 "!pdffile!" -quality 100 "!basefolder!\page_%%02d.jpg"

echo Saved images to: "!basefolder!"
echo.

shift
goto :loop

:done
echo ==============================================
echo All conversions complete!
echo ==============================================
pause
