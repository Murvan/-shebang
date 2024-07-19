#!/usr/bin/bash

threshold=90
disk_usage=$(df -h / | awk 'NR==2 { print $6 }' | sed 's/%//')

if [ "${disk_usage}" -ge "$threshold" ]; then
   echo "Disk usage is ${disk_usage}, which is high risk!!!"
else
   echo "Disk usage is ${disk_usage}, which is Normal"
fi
