@echo off
title Network Toolkit

:menu
cls
echo ==============================
echo      NETWORK TOOLKIT
echo ==============================
echo 1. Show IP Config
echo 2. Ping Google
echo 3. Trace Route (Google)
echo 4. DNS Lookup
echo 5. Flush DNS
echo 6. Check Open Ports
echo 7. Exit
echo ==============================

set /p choice=Enter choice:

if %choice%==1 ipconfig /all & pause & goto menu
if %choice%==2 ping google.com & pause & goto menu
if %choice%==3 tracert google.com & pause & goto menu
if %choice%==4 set /p host=Enter hostname: & nslookup %host% & pause & goto menu
if %choice%==5 ipconfig /flushdns & echo DNS flushed & pause & goto menu
if %choice%==6 netstat -an & pause & goto menu
if %choice%==7 exit

goto menu
