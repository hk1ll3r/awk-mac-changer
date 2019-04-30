#!/bin/bash
set -e
f=$1
if ! [ $(id -u) = 0 ]; then
   echo "Run as root. $> sudo ./change-wifi-mac.sh <mac>"
   exit 1
fi
cp -f "$f" "$f-back"
awk -f "wifi-mac-changer.awk" "$f" > "$f-tmp"
rm -f $f
mv "$f-tmp" $f
service NetworkManager restart

