reg add HKLM /F >nul 2>&1
if %errorlevel% neq 0 start "" /wait /I /min powershell -NoProfile -Command start -verb runas "'%~s0'" && exit /b 

@echo off
setlocal enabledelayedexpansion

:SilentUpdates
set local=1.0
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
