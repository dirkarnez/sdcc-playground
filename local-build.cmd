@REM run as Administrator
@echo off
cd /d %~dp0
set DOWNLOADS_DIR=%USERPROFILE%\Downloads
set DOWNLOADS_DIR_LINUX=%DOWNLOADS_DIR:\=/%

set COMPILER_DIR=%DOWNLOADS_DIR%\sdcc-portable-v4.4.0-rc3

set PATH=%COMPILER_DIR%\bin;

set CC=%COMPILER_DIR%\bin\sdcc.exe
set AS=%COMPILER_DIR%\bin\sdas8051.exe
set CXX=%COMPILER_DIR%\bin\sdcc.exe
set LD=%COMPILER_DIR%\bin\sdcc.exe
set AR=%COMPILER_DIR%\bin\sdar.exe

@REM DEL /Q /F /S "*.tmp"
@REM DEL /Q /F /S "*.hex"
@REM DEL /Q /F /S "*.lk"
@REM DEL /Q /F /S "*.lst"
@REM DEL /Q /F /S "*.map"
@REM DEL /Q /F /S "*.mem"
@REM DEL /Q /F /S "*.rel"
@REM DEL /Q /F /S "*.rst"
@REM DEL /Q /F /S "*.sym"
@REM DEL /Q /F /S "*.asm"

if exist build rmdir /s /q build
md build

@REM --model-small

%CC% -c --std-c99 -Iinclude -mmcs51 --opt-code-speed --iram-size 256 --xram-size 0 --code-size 8192 -MMD -o .\build\main.rel .\src\main.c
%CC% --out-fmt-ihx -mmcs51 --iram-size 256 --xram-size 0 --code-size 8192 -o .\build\sdcc-playground.ihx .\build\main.rel
%COMPILER_DIR%\bin\packihx.exe .\build\sdcc-playground.ihx > .\build\sdcc-playground.hex
echo Successful build
pause