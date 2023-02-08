@echo off
color 0F
mkdir "%userprofile%\Documents\Map_drives"

echo Backing up %username%'s MAPPED Drives...
:: Creates .bat file for mapping drives on users PC
echo @echo off > "%userprofile%\Documents\Map_drives\%username%_MapDrives.bat"
echo net use /del * >> "%userprofile%\Documents\Map_drives\%username%_MapDrives.bat"
for /f "delims=: tokens=2"  %%a in ('net use') do (
     echo net use * %%a >> "%userprofile%\Documents\Map_drives\%username%_MapDrives.bat"
)

