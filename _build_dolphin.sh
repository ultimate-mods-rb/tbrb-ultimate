dependencies/wit/wit extract ./iso ./_build/wii
rm ./_build/wii/sys/main.dol
rm ./_build/wii/setup.txt
cp ./dependencies/patch/main.dol ./_build/wii/sys
cp ./dependencies/patch/setup.txt ./_build/wii

cp ./_build/wii_rebuild_files/main_wii.hdr ./_build/wii/files/gen
rm ./_build/wii/files/gen/main_wii_10.ark
dependencies/arkhelper patchcreator -a ./_ark -o ./_build/wii/files/gen ./_build/wii/files/gen/main_wii.hdr
mv ./_build/wii/files/gen/gen/main_wii.hdr ./_build/wii/files/gen
mv ./_build/wii/files/gen/gen/main_wii_10.ark ./_build/wii/files/gen
rmdir ./_build/wii/gen/gen

echo "TBRB ultimate should've successfully built. make sure to add _build/wii as a game path in dolphin and enable search subfolders so it will show up. enjoy :)"