#!/bin/bash


# Created Jan, 2017                                                     #
# Created by Thiago G. Escobar <thiago.escobar@gmail.com>               #
# Update Jan, 2017                                                      #

DATE=`date +%Y-%m-%d`

while getopts ":p:d:u:e:" opt; do
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
		e)
			EXTENSION=$OPTARG
			if [ "$EXTENSION" == ".zip" ] ; then 
				echo "The .zip extension is not supported. Exiting now"
				exit 1
			fi
			;;
		\?)
			echo "Invalid option: $OPTARG " >&2
			echo "exiting now" >&2
			exit 1
			;;
	esac
done

if [ "$DB" == "" ] ; then
	DB='zabbix'
fi


if [ "$DBUSER" == "" ] ; then
	DBUSER='zabbix'
fi

if [ "$EXTENSION" == "" ]; then
	EXTENSION='.tar.bz2'
fi

# Generates a .sql file with the backup of the zabbix Database
mysqldump -u $DBUSER -p$PASS -x -e -B $DB > $PWD/zabbix-$DATE.sql

# Uses tar to create a compacted file with the backup. By default, -cjf is used to compact the file with bzip2
tar caf $PWD/zabbix-$DATE$EXTENSION -C $PWD zabbix-$DATE.sql --remove-files

exit 0
