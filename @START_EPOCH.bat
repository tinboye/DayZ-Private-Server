copy .\@dayz_epoch_server\*.dll .\
@echo off
echo Starting MySQL database. Please wait 5-10 seconds.
start /D.\MySQL\ MySQL.bat
ping 127.0.0.1 -n 5 >NUL
.\MySQL\cecho {0A}	OK.{07}
echo.
echo.
echo.
echo Executing spawn script...
.\MySQL\bin\mysql.exe --user=epoch	--password=epoch --host=127.0.0.1 --port=3306 --database=dayz_epoch --execute=""
ping 127.0.0.1 -n 5 >NUL
.\MySQL\cecho {0A}	OK.{07}
echo.
echo.
echo.
echo Starting server...
start .\arma2oaserver.exe -mod=@dayz_epoch;@dayz_epoch_server -name=admin -config=config\epoch\server.cfg -cfg=config\epoch\basic.cfg -profiles=config\epoch
.\MySQL\cecho {0A}	OK.{07} 
echo.
echo.
echo.
ping 127.0.0.1 -n 5 >NUL
exit