@Echo off
//created and designed By: Rythorian77

cls

:menu
color a
cls
echo.
echo ______________________________WINDOW UTILITIES____________________________
echo.
echo.
echo 1) Delete the TEMPORARY CACHE (faltu) in the system
echo 2) Activate the ON SCREEN KEYBOARD
echo 3) Show all the directories in the system with related information
echo 4) Kill any process (ex. type notepad.exe for txt files)
echo 5) show all the hidden files in an external directory (except C: drive)
echo 6) Open the system calculator
echo 7) check my ip address rather than going on google 
echo 8) Recover your pendrive data (works very seldomly- not reliable)
echo 9) To flush your DNS CACHE 
echo (in case you cre connected to a active internet connection and its showing connection errors on your browsers )
echo.
echo 10) Access the INTERNET APPLICATIONS*
echo 11) Create the GOD MODE (complete access) icon automatically
echo 12) Send files in one click Bluetooth option
echo 13) TROUBLESHOOT windows in case of any issues (if your data is getting erased abruptly or other issues)
echo 14) Shutdown the system in one click
echo 15) Add important STICKY NOTES to the desktop
echo 16) About the souce code and design
echo 17) Complete System information 
echo 18) To EXIT the program
echo.
echo. 
echo enter the choice

set /p ch=type 

if %ch%==1 goto one
if %ch%==2 goto two
if %ch%==3 goto three
if %ch%==4 goto four
if %ch%==5 goto five
if %ch%==6 goto six
if %ch%==7 goto seven
if %ch%==8 goto eight
if %ch%==9 goto nine
if %ch%==10 goto ten
if %ch%==11 goto eleven
if %ch%==12 goto twelve
if %ch%==13 goto thirteen
if %ch%==14 goto fourteen
if %ch%==15 goto fifteen
if %ch%==16 goto sixteen
if %ch%==17 goto seventeen
if %ch%==18 goto eighteen

:one
cls
echo Do you want to delete the cache
echo It might clear some trash from your system
echo type Y to delete (RECOMENDED) and N to abort

del C:\Windows\Temp 

echo.
pause
goto menu


:two
cls
osk

pause
goto menu


:three
cls
dir /A
pause
goto menu

:four
cls
echo Enter the task to kill
set /p taskme=type 

taskkill /im "%taskme%" 

echo. 
pause
goto menu

:five 
cls
echo Enter the drive name like F: or G: (for example)
set /p drive= type 

%drive%
attrib -h -s -r /s /d *.*

echo.
pause 
goto menu

:six
cls
echo Opening the calculator
start calc.exe

pause 
goto menu

:seven
cls
echo displaying your ip address and the related configurations
echo.
echo.
ipconfig
echo.

pause
goto menu

:eight
cls
echo Enter the pendrive name not the alias (like G: or F:)
set /p pendrive= type 
%pendrive%
echo recovering the data
echo.

attrib -r -s -h /D /S *.*
del *.scr
del *.lnk
del *.zaj
echo.

pause 
goto menu

:nine
cls
echo flushing dns cache as per the command......
echo.

echo Loading........
echo.

ipconfig/flushdns 
echo.

pause
goto menu

:ten
cls 
color a
cls

:web 
{
cls
echo Choose the application you what to access directly
echo.

echo 1) GoOglE  Search Engine 
echo 2) fAceBoOk  
echo 3) GmaiL  
echo 4) YaHoO  
echo 5) YouTuBe  Media Search Engine
echo 6) WhaTsApp Web  
echo 7) WikiPeDiA
echo 8) GoOgLe Play Store
echo 9) YouTuBe MP3 Downloader
echo (Downloading youtube vedios in mp3 format)
echo.
echo 10)KiTaBiKiDDa  -Best online book store 
echo 11) Back to main menu  

echo.
echo.
echo.
echo Enter the choice
set /p choice= type 

if %choice%==1 goto gugle
if %choice%==2 goto fb
if %choice%==3 goto gmail
if %choice%==4 goto yahu
if %choice%==5 goto utube
if %choice%==6 goto wsap
if %choice%==7 goto wiki
if %choice%==8 goto gugleplay
if %choice%==9 goto utubemp3
if %choice%==10 goto kk
if %choice%==11 goto menutab


:gugle
cls
start www.google.co.in

echo.
echo Back to other Web applications
pause
goto web

:fb
cls
start www.facebook.com

echo.
echo Back to other Web applications
pause
goto web

:gmail
cls
start www.mail.google.com

echo.
echo Back to other Web applications
pause
goto web

:yahu
cls
start www.login.yahoo.com

echo.
echo Back to other Web applications
pause
goto web

:utube
cls
start www.youtube.com

echo.
echo Back to other Web applications
pause
goto web

:wsap
cls
start www.web.whatsapp.com

echo.
echo Back to other Web applications
pause
goto web

:wiki
cls
start www.wikipedia.org

echo.
echo Back to other Web applications
pause
goto web

:gugleplay
cls
start www.play.google.com

echo.
echo Back to other Web applications
pause
goto web

:utubemp3
cls
start www.youtube-mp3.org

echo.
echo Back to other Web applications
pause
goto web

:kk
cls
echo LINKING TO BEST ONLINE BOOK STORE
start www.kitabikidda.com

echo.
echo Back to other Web applications
pause
goto web

:menutab
goto menu

}
:eleven
cls
echo GOD MOD icons is being created in the directory in which the program is placed
echo (recommended DESKTOP)
echo.
echo.
mkdir GodMode.{ED7BA470-8E54-465E-825C-99712043E01C}


pause
goto menu

:twelve

cls
echo opening the bluetooth panel
start fsquirt.exe
echo.
echo.
pause 
goto menu


:thirteen
cls
Echo First save the work on your system and close all files then 
echo TROUBLESHOOT the system.
echo.
echo All set to trouble shoot then 
pause
Mdsched.exe
echo.
echo.
pause
goto menu

:fourteen
cls
color c
echo SHUTDOWN THE SYSTEM SHORTLY
echo.
echo SIT DOWN AND RELAX
shutdown -s -t 05
echo.
echo.

pause 
goto menu

:fifteen
cls 
start stikynot.exe
Echo for going back to the menu
echo.
pause
goto menu

:sixteen
cls 
color c
echo.
echo Created and designed by MOHIT MALHOTRA
echo.

echo VERSION : Beta version
echo.
echo Permission to COPY, MODIFY and SHARE the program is GRANTED
echo.
echo Based on the Windows interface
echo.
echo No Copyrights reserved

echo.
echo.


pause
goto menu


:seventeen
cls
color 7
echo.
ECHO Showing complete system info from data file in SYSTEM32
msinfo32.exe
echo.
pause
goto menu


:eighteen
cls
echo CONFIRMATION: Really want to exit (yes/no)
set /p confirm= type 
if %confirm%==no    goto menu
if %confirm%==yes   exit
if %confirm%==n    goto menu
if %confirm%==N    goto menu 