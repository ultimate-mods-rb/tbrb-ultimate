#!/bin/bash

ISO_FOLDER="$(pwd)/iso"
ULTIMATE_FILES_FOLDER="$(pwd)/ultimate_files"
WIT_EXECUTABLE="$(pwd)/wit/wit"

# Ensure execute permission for wit executable
chmod +x "$WIT_EXECUTABLE"

if [ ! -d "$ISO_FOLDER" ]; then
    echo "ISO folder not found."
    exit 1
fi

if [ ! -d "$ULTIMATE_FILES_FOLDER" ]; then
    echo "Ultimate files folder not found."
    exit 1
fi

if [ ! -x "$WIT_EXECUTABLE" ]; then
    echo "WIT executable not found or does not have execute permissions."
    exit 1
fi

for file in "$ISO_FOLDER"/*.wbfs "$ISO_FOLDER"/*.iso; do
    if [ -f "$file" ]; then
        "$WIT_EXECUTABLE" extract "$file" _temp/_temp_out
        if [ $? -eq 0 ]; then
            if [ -d "_temp/_temp_out/DATA" ]; then
                cp -r "$ULTIMATE_FILES_FOLDER"/* "_temp/_temp_out/DATA/"
            else
                cp -r "$ULTIMATE_FILES_FOLDER"/* "_temp/_temp_out/"
            fi
            "$WIT_EXECUTABLE" copy _temp/_temp_out "$PWD/R9JE69.wbfs"
            # Delete _temp directory
            rm -rf _temp
            exit 0
        fi
    fi
done

echo "No WBFS or ISO file found in the 'iso' folder."
exit 1
