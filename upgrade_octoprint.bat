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
cls
setlocal EnableDelayedExpansion
FOR /F "usebackq skip=2 tokens=1,2*" %%A IN (`REG QUERY "HKLM\SOFTWARE\WOW6432Node\OctoPrint\Instances" 2^>nul`) DO (
    REM %%A captures the Value Name
    REM %%B captures the Value Type (e.g., REG_SZ, REG_DWORD)
    REM %%C captures the Value Data

    SET "ValueName=%%A"
    SET "ValueType=%%B"
    SET "ValueData=%%C"
    
    REM Remove quotes from ValueData if present
    SET "ValueData=!ValueData:\"=!"
    
    net stop "OctoPrint on Port !ValueName!"
)
endlocal
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
cls
setlocal EnableDelayedExpansion
FOR /F "usebackq skip=2 tokens=1,2*" %%A IN (`REG QUERY "HKLM\SOFTWARE\WOW6432Node\OctoPrint\Instances" 2^>nul`) DO (
    REM %%A captures the Value Name
    REM %%B captures the Value Type (e.g., REG_SZ, REG_DWORD)
    REM %%C captures the Value Data

    SET "ValueName=%%A"
    SET "ValueType=%%B"
    SET "ValueData=%%C"
    
    REM Remove quotes from ValueData if present
    SET "ValueData=!ValueData:\"=!"
    
    net start "OctoPrint on Port !ValueName!"
)
endlocal
pause

