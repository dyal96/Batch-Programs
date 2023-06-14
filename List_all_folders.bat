@echo off
for /d /r %%F in (*) do echo %%~nxF >> folder_list.txt
echo List of folders generated successfully.
