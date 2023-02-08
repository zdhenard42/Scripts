@echo off

::exectute this file in the same dir that the exe is located in!

set file=rawaccel123.exe & ::Enter filename here
set path=%~dp0 & :: This is setting the path of the exe to the dir the batch file is executed in
echo @echo off > "%USERPROFILE%\AppData\Roaming\Microsoft\Windows\Start Menu\Programs\Startup\runFile.bat"
echo cd "%path%" >> "%USERPROFILE%\AppData\Roaming\Microsoft\Windows\Start Menu\Programs\Startup\runFile.bat"
echo %file% >> "%USERPROFILE%\AppData\Roaming\Microsoft\Windows\Start Menu\Programs\Startup\runFile.bat"