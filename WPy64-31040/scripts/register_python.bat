@echo off
call "%~dp0env_for_icons.bat"
cd/D "%WINPYDIR%\Scripts"
"%WINPYDIR%\python.exe" register_python %*