@echo off
echo.
echo KILL arma2oaserver.exe

:: just to be careful, set the server path
set serverlocation="C:\arma_server"

:: kill the server application
taskkill /f /im "arma2oaserver.exe"
echo.
timeout 2

:: now shutdown bec. comment this out if you dont have bec installed/running
:: it wont hurt to have it here though
echo Kill Bec.exe
set beclocation="C:\arma_server\BEC"
cd /d %beclocation%
taskkill /f /im "bec.exe"

:: wait 1 second just because
timeout 1

echo.
echo Starting Dayz Server

:: start the server by COPY the startup line from your normal bat file.
:: we DO NOT use the normal bat file again because we have not shutdown the MYSQL server
:: and the normal @start_overpoch.bat would start another mysql server which would be an error.
cd /d %serverlocation%
start .\arma2oaserver.exe -mod=@dayzoverwatch;@dayz_epoch;@dayz_overpoch_server -name=infected -config=config\overpoch\server.cfg -cfg=config\overpoch\basic.cfg -profiles=config\overpoch
echo.

echo Starting Bec
:: the server MUST be running or else BEC will fail. There is a timeout in the BEC config.cfg you 
:: could use instead of here, but I like to keep everything all in one place
timeout 30
:: start bec
cd /d %beclocation%
start "" "bec.exe" -f Config.cfg --dsc
echo.
echo Server Started 

cls
@exit