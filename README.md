# Exile-Server-Monitor
Batch scripts to monitor server
This set of batch scripts was initially from midgetgrimm at https://epochmod.com/forum/topic/31262-simple-server-monitorrestart/

I have added arma server monitor as well, thanks to fred41 https://forums.bistudio.com/forums/topic/146822-arma-server-monitor-very-small-but-useful/ for a great tool, he unfortunately has terminated the project.

I have just added my own variables so a person can just enter fields within the batch files.

If you wish to use BEC (Battleye Extended Controls) then change

::set "_becpath="%_armaserverpath%\bec"
to
set "_becpath="%_armaserverpath%\bec"

change
::taskkill /im Bec.exe
to
taskkill /im Bec.exe

and change

::cd /d %_becpath%
::start "" /min "Bec.exe" -f Config.cfg
::timeout 1
::echo Battleye Extended Controls has started.. 
::timeout 3

to

cd /d %_becpath%
start "" /min "Bec.exe" -f Config.cfg
timeout 1
echo Battleye Extended Controls has started.. 
timeout 3



