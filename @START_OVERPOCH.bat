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
.\MySQL\bin\mysql.exe --user=overpoch --password=overpoch --host=127.0.0.1 --port=3306 --database=epoch --execute=""
ping 127.0.0.1 -n 5 >NUL
.\MySQL\cecho {0A}	OK.{07}
echo.
echo.
echo.
echo Starting server...
start .\arma2oaserver.exe -mod=@dayzoverwatch;@dayz_epoch;@dayz_epoch_server -name=infected -config=config\overpoch\server.cfg -cfg=config\overpoch\basic.cfg -profiles=config\overpoch
.\MySQL\cecho {0A}	OK.{07} 
echo.
echo.
echo.
ping 127.0.0.1 -n 5 >NUL
exit