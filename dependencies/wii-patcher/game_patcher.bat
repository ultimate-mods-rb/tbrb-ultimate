@echo off
set "ISO_FOLDER=%cd%\iso"
set "ULTIMATE_FILES_FOLDER=%cd%\ultimate_files"
set "WIT_EXECUTABLE=%cd%\wit\wit.exe"

if not exist "%ISO_FOLDER%" (
    echo ISO folder not found.
    exit /b 1
)

if not exist "%ULTIMATE_FILES_FOLDER%" (
    echo Ultimate files folder not found.
    exit /b 1
)

if not exist "%WIT_EXECUTABLE%" (
    echo WIT executable not found.
    exit /b 1
)

for %%I in ("%ISO_FOLDER%\*.wbfs" "%ISO_FOLDER%\*.iso") do (
    "%WIT_EXECUTABLE%" extract "%%~fI" _temp\_temp_out
    goto :found
)
:found

if not exist _temp\_temp_out (
    echo No WBFS or ISO file found in the "iso" folder.
    pause
    exit /b 1
)

if exist _temp\_temp_out\DATA (
    xcopy /s /e /y "%ULTIMATE_FILES_FOLDER%\*" "_temp\_temp_out\DATA\"
) else (
    xcopy /s /e /y "%ULTIMATE_FILES_FOLDER%\*" "_temp\_temp_out\"
)

"%WIT_EXECUTABLE%" copy _temp\_temp_out "%cd%\R9JE69.wbfs"


rem Delete _temp directory
rd /s /q _temp

pause

exit /b 0
