#!/usr/bin/bash


if [ $# -ne 2 ]
then
	echo "Error occured : Must be two arguments."
	echo "Usage ex.: script  <SourceDir> <BackupDir> "
	echo "Try again..."
	exit 1
fi

rsyncdir=/usr/bin/rsync

if [ -d $rsyncdir ]
then
        echo " Rsync is not installed in your machine Please Install it"
        echo " If you have debian based OS install with : sudo apt install rsync "
	exit 1
else
	echo "Doing Backup wait for a seconds..."

fi


current_date=$(date +%Y-%m-%d)

rsync_options="-avb --backup-dir archive/${current_date} --delete "

$(which rsync) $rsync_options $1 $2/current >> backup_$current_date.log



if [ $? = 0 ]
then
	sleep 1.5
	echo " Backup is Succsesfull "
else
	sleep 1.5
	echo " Error occured see in log file "
fi
