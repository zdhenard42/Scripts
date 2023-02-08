@echo off
setlocal enabledelayedexpansion
color 0A
set /A "i=0"

:main
CLS
ECHO 1.Add to table
ECHO 2.Copy Table
ECHO 3.Reset Table
ECHO.
choice /c 123 /n /m "Select an option (1-3): "
goto :Label-%ERRORLEVEL%


:Label-1 enterData
echo Right click to paste your data from KQL and press enter twice when complete
echo: 
goto :type

:type
set "var1="
set "var2="
set /P "var1="
if "%var1%" == "" (
echo Data has been saved to table. Select Option 2 to save to clipboard.
timeout /t 2 >nul
goto :main
)
set /P "var2="
echo %var2% | findstr /r "\<[0-9][0-9]*\.[0-9][0-9]*\.[0-9][0-9]*\.[0-9][0-9]*\>" > test.txt
set /p ip=<test.txt
del test.txt
if not "%ip%" == "" (
set "var2=%var2% ^| [VirusTotal](https://www.virustotal.com/gui/search/%var2%) ,  [AbuseIPDB](https://www.abuseipdb.com/check/%var2%), [WhoIs](https://who.is/whois-ip/ip-address/%var2%)"
set "ip="
goto :add
)
if not "%var2:~63%" == "" (
if "%var2:~64%" == "" set "var2=%var2% ^| [VirusTotal](https://www.virustotal.com/gui/search/%var2%)"
) ELSE ( set "var2=%var2% ^| N/A")
goto :add

:add
set /A "i+=1"
set "multi%i%=| %var1% | %var2:^=% |"
goto :type


:Label-2 print
echo ^| Type      ^| Value ^| Analysis ^| > test.txt
echo ^| ----------- ^| ----------- ^| ----------- ^|>> test.txt
for /L %%a in (1,1,%i%) do (
echo !multi%%a! >> test.txt
)
type "test.txt" | clip
del test.txt
echo Copied to Clipboard
timeout /t 2 >nul
goto :main


:Label-3 reset
set /A "i=0"
echo Done!
timeout /t 2 >nul
goto :main
