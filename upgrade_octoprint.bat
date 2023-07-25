@echo off
cls
@echo !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
@echo !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
@echo !!!                                                                           !!!
@echo !!! An attempt will be made to stop all OctoPrint services, you may be        !!!
@echo !!! prompted for admin priviledges for each instance as the process proceeds. !!!
@echo !!!                                                                           !!!
@echo !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
@echo !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
pause
FOR %%f IN (OctoPrintService*.exe) DO ((Echo "%%f" | FIND /I "OctoPrintService.exe" 1>NUL) || (%%f stop))
pause
cls
@echo !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
@echo !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
@echo !!!                                                                           !!!
@echo !!! Starting upgrade process...                                               !!!
@echo !!!                                                                           !!!
@echo !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
@echo !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
call "####EXEPATH####" -m pip install --upgrade octoprint
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
FOR %%f IN (OctoPrintService*.exe) DO ((Echo "%%f" | FIND /I "OctoPrintService.exe" 1>NUL) || (%%f start))
pause
