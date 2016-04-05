#!/bin/bash

if [[ -e /dev/ttyUSB0 ]]
then
        echo "/dev/ttyUSB0 Allready up"
fi
exit 0

url="http://192.168.1.1/api/device/mode"
xmlheader="<?xml version=\"1.0\" encoding=\"UTF-8\"?>"
data="<request><mode>0</mode></request>"

ifconfig eth1 192.168.1.10 netmask 255.255.255.0
wget --post-data="$xmlheader$data" $url -qO-

