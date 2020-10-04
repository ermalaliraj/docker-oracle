#!/bin/bash

#/etc/init.d/oracle-xe start 

#chown -R oracle. /root/logs
#chown -R oracle. /home/oracle/

echo "#########################"
echo "STARTING DATABASE... for populating DB (create-my-schema.sh)"
echo "#########################"
/etc/init.d/oracle-xe start

errors=`/u01/app/oracle/setPassword.sh $ORACLE_PWD | grep ERROR |wc -l`
while [ $errors -ne 0 ]
do
	echo "DB NOT ready, try after 5 seconds.."
	sleep 5
	errors=`/u01/app/oracle/setPassword.sh $ORACLE_PWD | grep ERROR |wc -l`
done
echo "**DB READY** - SYS/SYSTEM password changed to '$ORACLE_PWD'"


echo "********************************************************"
echo " BEGIN CREATE my DATABASE"
echo " ********************************************************"
#su -p oracle -c "cd /my-scripts/ && sqlplus / as sysdba @00_my_create_user.sql"
#su -p oracle -c "cd /my-scripts/ && sqlplus / as sysdba @01_my_create_tables.sql"
echo " ********************************************************"
echo " CREATE my DATABASE Done"
echo " ********************************************************"

echo "********************************************************"
echo " BEGIN POPULATE my DATABASE"
echo " ********************************************************"
echo " No data to insert for now"
#su -p oracle -c "cd /my-scripts/ && sqlplus / as sysdba @02_my_populate_db.sql"
echo "********************************************************"
echo " END POPULATE my DATABASE"
echo " ********************************************************"

#/etc/init.d/oracle-xe stop 
