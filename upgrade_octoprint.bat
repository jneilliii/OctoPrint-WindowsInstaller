@echo off
cls
@echo !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
@echo !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
@echo !!!                                                                           !!!
@echo !!! An attempt will be made to stop all OctoPrint services. Please make sure  !!!
@echo !!! you are not currently printing before continuing.                         !!!
@echo !!!                                                                           !!!
@echo !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
@echo !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
pause
FOR %%f IN (%~dp0\OctoPrintService*.exe) DO ((Echo "%%f" | FIND /I "OctoPrintService.exe" 1>NUL) || (%%f stop))
pause
cls
@echo !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
@echo !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
@echo !!!                                                                           !!!
@echo !!! Starting upgrade process...                                               !!!
@echo !!!                                                                           !!!
@echo !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
@echo !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
call "C:\OctoPrint\WPy64-31700\scripts\python.bat" -m pip install --upgrade octoprint
@echo !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
@echo !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
@echo !!!                                                                           !!!
@echo !!! Upgrade process completed, if there are any errors listed above the       !!!
@echo !!! upgrade probably failed, use the error information to open an issue on    !!!
@echo !!! GitHub: https://github.com/jneilliii/OctoPrint-WindowsInstaller           !!! 
@echo !!!                                                                           !!!
@echo !!! An attempt will now be made to start all OctoPrint services.              !!!
@echo !!!                                                                           !!!
@echo !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
@echo !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
pause
FOR %%f IN (%~dp0\OctoPrintService*.exe) DO ((Echo "%%f" | FIND /I "OctoPrintService.exe" 1>NUL) || (%%f start))
pause
