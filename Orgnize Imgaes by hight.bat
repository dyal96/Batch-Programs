@echo off
setlocal enabledelayedexpansion

:: Create temp Python script
set script=%temp%\sort_by_height.py

echo import os> %script%
echo from PIL import Image>> %script%
echo import shutil>> %script%
echo folder = os.getcwd()>> %script%
echo for f in os.listdir(folder):>> %script%
echo     if f.lower().endswith(('.png','.jpg','.jpeg','.webp')):>> %script%
echo         p = os.path.join(folder,f)>> %script%
echo         try:>> %script%
echo             with Image.open(p) as im:>> %script%
echo                 w,h = im.size>> %script%
echo             d = os.path.join(folder,str(h)+"px")>> %script%
echo             os.makedirs(d, exist_ok=True)>> %script%
echo             shutil.move(p, os.path.join(d,f))>> %script%
echo         except Exception as e:>> %script%
echo             print("Error:", f, e)>> %script%

:: Install Pillow silently (first run only)
pip show pillow >nul 2>&1
if errorlevel 1 (
    echo Installing Pillow...
    pip install pillow
)

:: Run script
python "%script%"

echo Done!
pause