#!/bin/bash

exec 2>>/tmp/trace.log; PS4=':${BASH_SOURCE}:$LINENO+'; set -x

# Example output:
#  /media/me/whatever
#  /media/me/whatever2
# #
# lsblkOutput=$(lsblk -J -o MOUNTPOINT | \
#               jq -r '.blockdevices[] | select(.mountpoint != null) | .mountpoint | select(startswith("/media"))');

# lsblkOutput=$(df | grep ^/dev/ | awk '{print $1, $5, $6}');
lsblkOutput=$(df | grep ^/dev/|grep -v "/$" | awk '{print $6}');

nameToShow=""
deviceMountpoint=""

toConky=""
toConky2=""

if [[ "$lsblkOutput" == "" ]]
then
  exit
fi

# To array
IFS=$'\n' devices=($lsblkOutput)
for device in "${devices[@]}"
do
    # Remove the path...
    nameToShow=${device##*/}
    # If the name has several words, only show the first one.
    nameToShow=${nameToShow:0:8}
    nameToShow=${nameToShow%\ *}
    # In case the device has whitespaces in the name -> escape them
    device=$(printf "%q" "$device")
    toConky="$toConky\${template3 $nameToShow $device}\n"

    toConky2="$toConky2\${font sans-serif:normal:size=8}$nameToShow \$alignc \${fs_used $device} / \${fs_size $device} \$alignr \${fs_used_perc $device}%\n"
    toConky2="$toConky2\${fs_bar $device}\n"
done

printf '%b' "$toConky2"
