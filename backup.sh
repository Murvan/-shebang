#!/usr/bin/bash


if [ $# -ne 2 ]
then
	echo "Error occured "
	echo "Usage ex.: script  <SourceDir> <BackypDir> "
	echo "Try again..."
	exit 1
fi

rsyncdir=/usr/bin/rsync

if [ -d $rsyncdir ]
then
        echo "Doing Backup wait for a seconds..."
else
 	echo " Rsync is not installed in your machine Please install it"
        echo " If you have debian based OS install with : sudo apt install rsync "
	exit 2
fi


current_date=$(date +%Y-%m-%d)

rsync_options="-avb --backup-dir archive/${current_date} --delete "

$(which rsync) $rsync_options $1 $2/current >> backup_$current_date.log

sleep 1.5

if [ $? = 0 ]
then
	echo " Backup is Succsesfull "
else
	echo " Error occured see in log file "
fi
