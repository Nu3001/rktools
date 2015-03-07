#!/bin/bash

set -e
set -x

if [ $# != 2 ]; then
	echo "usage : $@ V2.09.bin V2.10.bin"
	exit 1
fi

OLD_VER=$1
NEW_VER=$2 

LINUX_PATH=linux/Linux_Upgrade_Tool_v1.16/rockdev
WINDOWS_PATH=windows/AndroidTool_Release_v2.1/rockdev

FILES=(
$WINDOWS_PATH/package-file
$WINDOWS_PATH/backupimage/package-file
$WINDOWS_PATH/mkupdate.bat
$LINUX_PATH/package-file
$LINUX_PATH/mkupdate.sh
)

for f in ${FILES[*]}
do
	sed -i 's/'$OLD_VER'/'$NEW_VER'/g' $f
        #fromdos $f
done

