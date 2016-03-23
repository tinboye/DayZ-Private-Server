copy .\@dayzoverwatch_server\*.dll .\

@echo off
echo Starting MySQL database. Please wait 5-10 seconds.
start /D.\MySQL\ MySQL.bat
ping 127.0.0.1 -n 5 >NUL
.\MySQL\cecho {0A}	OK.{07}
echo.
echo.
echo.

echo.
echo.
echo.
echo Starting server...
start arma2oaserver.exe -mod=@DayzOverwatch_Server;@DayzOverwatch -name=admin -config=config\overwatch\server.cfg -cfg=config\overwatch\basic.cfg -profiles=config\overwatch