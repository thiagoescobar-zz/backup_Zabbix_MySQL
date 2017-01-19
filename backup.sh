#!/bin/bash


# Created Jan, 2017                                                     #
# Created by Thiago G. Escobar <thiago.escobar@gmail.com>               #
# Update Jan, 2017                                                      #

DATE=`date +%Y-%m-%d`

# Generates a .sql file with the backup of the zabbix Database
mysqldump -u zabbix -p -x -e -B zabbix > /root/backup_Zabbix_MySQL/zabbix-$DATE.sql

# Uses tar to create a .tar.bz2 file compacting the backup
tar -cjf /root/backup_Zabbix_MySQL/zabbix-$DATE.tar.bz2 -C /root/backup_Zabbix_MySQL zabbix-$DATE.sql --remove-files

exit 0
