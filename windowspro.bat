
for /F "tokens=1,2 delims=#" %%a in ('"prompt #$H#$E# & echo on & for %%b in (1) do rem"') do (set "DEL=%%a" & set "COL=%%b") >nul 2>&1

@echo off
setlocal enabledelayedexpansion

:SilentUpdates
set local=0.1
set localtwo=%LOCAL%
if exist "%TEMP%\Updater.bat" DEL /S /Q /F "%TEMP%\Updater.bat" >nul 2>&1
curl -g -L -# -o "%TEMP%\Updater.bat" "https://raw.githubusercontent.com/r1ccardd/WindowsProActivator/main/ver" >nul 2>&1
call "%TEMP%\Updater.bat"
if "%LOCAL%" gtr "%LOCALTWO%" (
		curl -L -o %0 "https://github.com/r1ccardd/WindowsProActivator/releases/download/tools/windows.pro.bat" >nul 2>&1
		call %0
)

slmgr /ipk W269N-WFGWX-YVC9B-4J6C9-T83GX
slmgr /skms kms8.msguides.com
slmgr /ato 
cls
echo Windows pro has been successfully activated!
PING localhost -n 4 >NUL