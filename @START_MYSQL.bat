@echo off
echo Starting MySQL database. Please wait 5-10 seconds.
start /D.\MySQL\ MySQL.bat
echo.
echo.
echo.
ping 127.0.0.1 -n 5 >NUL
exit