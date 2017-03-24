@echo off
::
::Set Name of Server, the same as what you placed in server_start.bat
set "_servername=Name of Server"
::
::Do Not add a \ at the end of path!
set "_armaserverpath=c:\path\to\server"
::
::Set the time that monitor will check to see if server is down, in seconds
set "_time=180"
::
::
title %_servername%
:start
C:\Windows\System32\tasklist /FI "IMAGENAME eq arma3server.exe" 2>NUL | C:\Windows\System32\find /I /N "arma3server.exe">NUL
if "%ERRORLEVEL%"=="0" goto loop
echo %_servername% is not running, will be started now 
:: SET DIRECTORY TO PROPER LOCATION
start "" /min /wait "%_armaserverpath%\start_server.bat" 
timeout 30
::
echo Server started succesfully
goto started
:loop
cls
echo %_servername% is already running, running monitoring loop
:started
:: THESE ARE WERFAULT AND TASK KILLS
taskkill /f /im WerFault.exe /fi "WINDOWTITLE eq %_servername%"
C:\Windows\System32\timeout /t %_time%
C:\Windows\System32\tasklist /FI "IMAGENAME eq arma3server.exe" 2>NUL | C:\Windows\System32\find /I /N "arma3server.exe">NUL
if "%ERRORLEVEL%"=="0" goto loop
goto start
