#!/usr/bin/bash


file=/usr/bin/sar.sysstat

if [ -f $file ]; then
	echo " All necessary tools are installed preparing Hardware Info:"
else
	echo "Installing necessary Tools : "
	sleep 1.5
	sudo apt -qq install sysstat -y
	echo " All necessary tools are installed preparing Hardware Info:"
fi

echo

sleep 1.5


echo "-----------------------------------------------------------------------------------"

echo  "CPU                :"  $(lscpu | cut -d: -f2 | grep GHz)


echo  "Vendor_ID          :"  $(lscpu | grep Vendor | cut -d: -f2 )

echo  "Used Space On Disk :"  $(df -h / | awk 'NR==2 { print $5 }')


iostat -c


cat /proc/meminfo | head -8

echo "------------------------------------------------------------------------------------"
