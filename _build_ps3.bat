set FAILED_ARK_BUILD=0
@echo off
echo:
echo:Temporarily moving Xbox and Wii files out of the ark path to reduce final ARK size
@%SystemRoot%\System32\robocopy.exe "%~dp0_ark" "%~dp0_temp\_ark" *.milo_xbox /S /MOVE /XD "%~dp0_temp\_ark" /NDL /NFL /NJH /NJS /R:0 >nul
@%SystemRoot%\System32\robocopy.exe "%~dp0_ark" "%~dp0_temp\_ark" *.png_xbox /S /MOVE /XD "%~dp0_temp\_ark" /NDL /NFL /NJH /NJS /R:0 >nul
@%SystemRoot%\System32\robocopy.exe "%~dp0_ark" "%~dp0_temp\_ark" *.bmp_xbox /S /MOVE /XD "%~dp0_temp\_ark" /NDL /NFL /NJH /NJS /R:0 >nul
@%SystemRoot%\System32\robocopy.exe "%~dp0_ark" "%~dp0_temp\_ark" *.milo_wii /S /MOVE /XD "%~dp0_temp\_ark" /NDL /NFL /NJH /NJS /R:0 >nul
@%SystemRoot%\System32\robocopy.exe "%~dp0_ark" "%~dp0_temp\_ark" *.png_wii /S /MOVE /XD "%~dp0_temp\_ark" /NDL /NFL /NJH /NJS /R:0 >nul
@%SystemRoot%\System32\robocopy.exe "%~dp0_ark" "%~dp0_temp\_ark" *.bmp_wii /S /MOVE /XD "%~dp0_temp\_ark" /NDL /NFL /NJH /NJS /R:0 >nul
echo:
echo:Building PS3 ARK
"%~dp0dependencies/arkhelper" dir2ark "%~dp0_ark" "%~dp0_build\ps3\USRDIR\gen" -n "patch_ps3" -e -v 5 -s 4073741823 >nul
if %errorlevel% neq 0 (set FAILED_ARK_BUILD=1)
echo:
echo:Moving back Xbox files
@%SystemRoot%\System32\robocopy.exe "%~dp0_temp\_ark" "%~dp0_ark" *.milo_xbox /S /MOVE /XD "%~dp0_ark" /NDL /NFL /NJH /NJS /R:0 >nul
@%SystemRoot%\System32\robocopy.exe "%~dp0_temp\_ark" "%~dp0_ark" *.png_xbox /S /MOVE /XD "%~dp0_ark" /NDL /NFL /NJH /NJS /R:0 >nul
@%SystemRoot%\System32\robocopy.exe "%~dp0_temp\_ark" "%~dp0_ark" *.bmp_xbox /S /MOVE /XD "%~dp0_ark" /NDL /NFL /NJH /NJS /R:0 >nul
@%SystemRoot%\System32\robocopy.exe "%~dp0_temp\_ark" "%~dp0_ark" *.milo_wii /S /MOVE /XD "%~dp0_ark" /NDL /NFL /NJH /NJS /R:0 >nul
@%SystemRoot%\System32\robocopy.exe "%~dp0_temp\_ark" "%~dp0_ark" *.png_wii /S /MOVE /XD "%~dp0_ark" /NDL /NFL /NJH /NJS /R:0 >nul
@%SystemRoot%\System32\robocopy.exe "%~dp0_temp\_ark" "%~dp0_ark" *.bmp_wii /S /MOVE /XD "%~dp0_ark" /NDL /NFL /NJH /NJS /R:0 >nul
rd _temp
echo:
if %FAILED_ARK_BUILD% neq 1 (echo:Successfully built Beatles Rock Band Ultimate ARK files. You may find the files needed to place on your PS3 in /_build/PS3/)
if %FAILED_ARK_BUILD% neq 0 (echo:Error building ARK. Download the repo again or some dta file is bad p.s turn echo on to see what arkhelper says)
echo:
pause