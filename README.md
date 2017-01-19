# backup_Zabbix_MySQL
Scripts to backup a zabbix application database that uses MySQL (tested using MariaDB)

This script creates a .sql file using mysqldump containing the backup of the 'zabbix' database, which contains configuration data and item history.

Then, the script uses tar and bzip2 to compact the database dump.

Usage:
Just make the script executable (chmod a+x backup.sh) and run it. You will be prompted for the password.
