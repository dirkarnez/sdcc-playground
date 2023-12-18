@REM run as Administrator
@echo off
cd /d %~dp0
set DOWNLOADS_DIR=%USERPROFILE%\Downloads
set DOWNLOADS_DIR_LINUX=%DOWNLOADS_DIR:\=/%

SET PATH=^
%DOWNLOADS_DIR%\sdcc-4.3.0-x64-setup\bin;

DEL /Q /F /S "*.tmp"
DEL /Q /F /S "*.hex"
DEL /Q /F /S "*.lk"
DEL /Q /F /S "*.lst"
DEL /Q /F /S "*.map"
DEL /Q /F /S "*.mem"
DEL /Q /F /S "*.rel"
DEL /Q /F /S "*.rst"
DEL /Q /F /S "*.sym"
DEL /Q /F /S "*.asm"

pause

sdcc --help &&^
pause &&^
sdcc --verbose -mmcs51 --model-small --iram-size 256 --xram-size 0 --code-size 8192 main.c -o main.hex &&^
echo "Successful build"
pause