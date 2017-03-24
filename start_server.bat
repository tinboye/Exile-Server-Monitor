@echo off

::Refer to the following URL for any commandline Parameter
::
::https://community.bistudio.com/wiki/Arma_3_Startup_Parameters
::
::Edit only raw text, nothing between % % tags, and only after the = sign
:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
:: Name of Server
set "_servername=Name of Server"
::
title %_servername%
:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
:: paths to programs without \
::
set "_armaserverpath=c:\path\to\server"
set "_ServerMonitorPath=%_armaserverpath%"
::set "_becpath="%_armaserverpath%\bec"
set "_ASM="%_armaserverpath%"
:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
:: port to server
::
set "_port=2302"
:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
:: path to server.cfg or config.cfg
::
set "_config=%_armaserverpath%\@exileserver\config.cfg"
:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
:: path to basic.cfg or arma3.cfg
::
set "_cfg=%_armaserverpath%\@exileserver\basic.cfg"
:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
:: folder name in your arma3server folder to store rpt
set "_profiles=%_armaserverpath%\%_name%"
:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
:: will create user folder under profiles folder
::
set "_name=A3DS"
:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
:: enter your client mods below
::
set "_mods=@Exile;"
:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
:: enter mods that are only required by the server and not the clients.
::
set "_servermods=@exileserver;@ASM;"
::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
:: path to ranking.log
::
set "_ranking=%_cfg%\ranking.log"
:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
::  set the max memory your server will be allowed.
::  32-bit Windows + 32-bit game: 2047
::  64-bit Windows + 32-bit game: 3071
set "_maxmem=3071"
::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
:: If Intel Processor Enable HyperThreading
set "_HT=-enableHT"
:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
::If Intel Processor Change to a number 0,1,3,5,7. This will override
::auto detection (which use 3 for dualcore and 7 for quadcore).
::Example add below -exThreads=7
set "_exThreads=-enableHT=7"
:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
::Option which allows define number of CPUs/cores available. The
::best way to simulate dual core on quad core is to use -cpuCount=2
::when you run the game and then change the affinity to 2 cores to 
::make sure additional cores can never be used when some over-scheduling
::happens. It might be also possible to set the affinity in the OS 
::before you launch the process, that would work as well. 
::
set "_cpu=4"
:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
:: tbb4malloc_bi or jemalloc_bi or system
::
set "_malloc=system"
:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
::
::taskkill /im Bec.exe
taskkill /im ArmaServerMonitor.exe
taskkill /f /fi "status eq not responding" /im arma3server.exe
taskkill /f /im arma3server.exe
timeout 1
::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
taskkill /f /im cmd.exe /fi "windowtitle eq servermonitor.bat"
timeout 1
::
echo Kill all instances for safety
timeout 3
::
echo Starting %_servername% Server...
::CHANGE THE DIRECTORY BELOW TO THE PROPER LOCATION
cd /d %_armaserverpath%
start "arma3server" /min /high "arma3server.exe" -port=%_port% "-config=%_config%" "-cfg=%_cfg%" "-profiles=%_profiles%" -name=%_name%  "-servermod=%_servermods%" "-mod=%_mods%" "-ranking=%_ranking%" -cpuCount=%_cpu% %_HT% %_exThreads% -maxMem=%_maxmem% -malloc=%_malloc% -nosplash -noSound -noPause -nobenchmark -world=empty -autoinit
timeout 5
echo %_servername% has started..
timeout 5

::CHANGE THE DIRECTORY BELOW TO THE PROPER LOCATION
cd /d %_ServerMonitorPath%
start "" "servermonitor.bat"
echo Server Monitor has started. Have Fun
timeout 3

::CHANGE THE DIRECTORY BELOW TO THE PROPER LOCATION
::cd /d %_becpath%
::start "" /min "Bec.exe" -f Config.cfg
::timeout 1
::echo Battleye Extended Controls has started.. 
::timeout 3

::CHANGE THE DIRECTORY BELOW TO THE PROPER LOCATION
cd /d %_ASM%
start "" /min "ArmaServerMonitor.exe"
timeout 1
echo ArmaServerMonitor has started.. 
timeout 3
exit
