copy .\@dayz_epoch_server\*.dll .\
@echo off
echo Starting MySQL database. Please wait 5-10 seconds.
start /D.\MySQL\ MySQL.bat
ping 127.0.0.1 -n 5 >NUL
.\MySQL\cecho {0A}	OK.{07}
echo.
echo.
echo.
echo Starting server...
start .\arma2oaserver.exe -mod=@customMod;@customMod_server -name=admin -config=config\customMod\server.cfg -cfg=config\customMod\basic.cfg -profiles=config\customMod
.\MySQL\cecho {0A}	OK.{07} 
echo.
echo.
echo.
ping 127.0.0.1 -n 5 >NUL
exit