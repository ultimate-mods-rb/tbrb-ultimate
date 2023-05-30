git pull https://github.com/CaptnCH/tbrb-ultimate
copy "%~dp0\build\rebuild\main_wii.hdr" "%~dp0\build\wii"
copy "%~dp0\build\rebuild\main_wii_10.ark" "%~dp0\build\wii"
"%~dp0\dependencies/arkhelper" patchcreator -a "%~dp0\ark" -o "%~dp0\build\wii" "%~dp0\build\wii\main_wii.hdr"
move "%~dp0\build\wii\gen\main_wii.hdr" "%~dp0\build\wii"
move "%~dp0\build\wii\gen\main_wii_10.ark" "%~dp0\build\wii"
rmdir "%~dp0\build\wii\gen"
pause
