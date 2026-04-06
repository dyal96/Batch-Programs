@echo off
setlocal
echo ==============================================
echo PDF to JPG Converter (pdf2image)
echo ==============================================

if "%~1"=="" (
    echo Please drag and drop one or more PDF files onto this script.
    echo.
    pause
    exit /b
)

python "%~dp0pdf to jpg2.py" %*

echo.
pause
