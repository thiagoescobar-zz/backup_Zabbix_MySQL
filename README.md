# backup_Zabbix_MySQL
Scripts to backup a zabbix application database that uses MySQL (tested using MariaDB)

This script creates a .sql file using mysqldump containing the backup of the 'zabbix' database, which contains configuration data and item history.

Then, the script uses tar and bzip2 to compact the database dump.

Usage:
Just make the script executable (chmod a+x backup.sh) and run it. You will be prompted for the password.

Options:
You can use the option -p Your_Password to use 'Your_Password' as the password for the mysql user
Or use the option -u to use a different user. The script defaults the mysql user to 'zabbix'
Or use the option -d to use a different database. The script defaults the database to 'zabbix'
If the user uses an unexpected option, the script outputs the unexpected option and exits. 
