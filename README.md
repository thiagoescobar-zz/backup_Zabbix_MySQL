# backup_Zabbix_MySQL
Scripts to backup a zabbix application database that uses MySQL (tested using MariaDB)

This script creates a .sql file using mysqldump containing the backup of the 'zabbix' database, which contains configuration data and item history.

Then, the script uses tar and bzip2 to compact the database dump.


#### Usage ####
Just make the script executable and run it. You will be prompted for the password.

    $ chmod a+x backup.sh
    $ ./backup.sh


#### Options ####
You can use the option ````-p```` to pass your password instead of being prompted to input it later

    $ ./backup.sh -p mypassword
    
Or use the option ````-u```` to use a different user. The script defaults the mysql user to ````zabbix````

    $ ./backup.sh -u myuser
    
Or use the option ````-d```` to use a different database. The script defaults the database to ````zabbix````

    $ ./backup.sh -d mydatabase

Or use the option ````-e```` to use a different extension. The script defaults the backup extension to .tar.bz2. You must use a valid tar extension or the script will only use tar without compression.

    $ ./backup.sh -e .tar.gz
    
If the user uses an unexpected option, the script outputs the unexpected option and exits. 

#### Restoring the Backup ####
To restore the backup, you must first decompress the .tar.bz2 file. Then just run the .sql script through mysql

    $ tar xvjf backupFile.tar.bz2
    $ mysql zabbix < backupFile.sql

where backupFile must be replaced by your backup file name. The file name is in format zabbix-YYYY-mm-dd.tar.bz2. You should also use the correct tar arguments for your file extension.
