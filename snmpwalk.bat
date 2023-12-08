@echo off
setlocal
set "PATH=%~dp0bin\%EPICS_HOST_ARCH%;%~dp0..\..\OpenSSL\master\bin\%EPICS_HOST_ARCH%"
snmpwalk.exe %*
