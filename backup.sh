#!/bin/bash


# Created Jan, 2017                                                     #
# Created by Thiago G. Escobar <thiago.escobar@gmail.com>               #
# Update Jan, 2017                                                      #

DATE=`date +%Y-%m-%d`

# Generates a .sql file with the backup of the zabbix Database
mysqldump -u zabbix -p -x -e -B zabbix > $PWD/zabbix-$DATE.sql

# Uses tar to create a .tar.bz2 file compacting the backup
tar -cjf $PWD/zabbix-$DATE.tar.bz2 -C $PWD zabbix-$DATE.sql --remove-files

exit 0
