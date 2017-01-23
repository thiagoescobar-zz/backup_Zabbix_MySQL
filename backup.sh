#!/bin/bash


# Created Jan, 2017                                                     #
# Created by Thiago G. Escobar <thiago.escobar@gmail.com>               #
# Update Jan, 2017                                                      #

DATE=`date +%Y-%m-%d`

while getopts ":p:d:u:" opt; do
	case $opt in
		p)
			PASS=$OPTARG
			;;
		d)
			DB=$OPTARG
			;;
		u)
			DBUSER=$OPTARG
			;;
		\?)
			echo "Invalid option: $OPTARG " >&2
			echo "exiting now" >&2
			exit 1
			;;
	esac
done

if [$DB = ''] ; then
	DB='zabbix'
	echo "DB setado para $DB"
fi


if [$DBUSER = ''] ; then
	USER='zabbix'
	echo "USER setado para $USER"
fi
# Generates a .sql file with the backup of the zabbix Database
mysqldump -u $USER -p$PASS -x -e -B $DB > $PWD/zabbix-$DATE.sql

# Uses tar to create a .tar.bz2 file compacting the backup
tar -cjf $PWD/zabbix-$DATE.tar.bz2 -C $PWD zabbix-$DATE.sql --remove-files

exit 0
