#!/usr/bin/bash

check_disk_space(){

local threshold=90
local disk_usage=$(df -h / | awk 'NR==2 { print $5 }' | sed 's/%//')


if [ "${disk_usage}" -ge "$threshold" ]; then
   echo "Disk usage is ${disk_usage}, which is high risk!!!"
else
   echo "Disk usage is ${disk_usage}, which is Normal"
fi

}


while true
do
	check_disk_space
	sleep 3600
done
