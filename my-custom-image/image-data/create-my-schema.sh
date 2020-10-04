#!/bin/bash

echo "#########################################################"
echo "STARTING DATABASE... from custom file create-my-schema.sh"
echo "#########################################################"
/etc/init.d/oracle-xe start

errors=`/u01/app/oracle/setPassword.sh $ORACLE_PWD | grep ERROR |wc -l`
while [ $errors -ne 0 ]
do
	echo "DB NOT ready, try after 5 seconds.."
	sleep 5
	errors=`/u01/app/oracle/setPassword.sh $ORACLE_PWD | grep ERROR |wc -l`
done
echo "DB READY - SYS/SYSTEM password changed to '$ORACLE_PWD'"


echo "********************************************************"
echo " BEGIN CREATE my DATABASE"
echo "********************************************************"

su -p oracle -c "cd /db-install-scripts/db-creation && sqlplus / as sysdba @00_mydb_create_user.sql" #as sysdba
echo "********************************************************"
echo " USER CREATION COMPLETED"
echo "********************************************************"

su -p oracle -c "cd /db-install-scripts/db-creation && sqlplus my_user/my_password @01_mydb_create_tables.sql"
echo "********************************************************"
echo " TABLES CREATION COMPLETED"
echo "********************************************************"

su -p oracle -c "cd /db-install-scripts/db-creation && sqlplus my_user/my_password @00_populate_tables.sql"
echo "********************************************************"
echo " TABLES POPULATIONS COMPLETED"
echo "********************************************************"

echo "********************************************************"
echo " END CREATE my DATABASE"
echo "********************************************************"