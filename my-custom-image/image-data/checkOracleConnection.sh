#!/bin/bash

logFile=logs/checkOracleConnection.log
function checkConnection() {
	sleep 10s #somehow when to early, ORA-01033 not present.
	
	#remove old file
	rm -f $logFile
	
	#If you need erroro code in case something wrong happens
	#WHENEVER SQLERROR EXIT SQL.SQLCODE
	
	#connect to DB and save output to log file
	su -p oracle -c "sqlplus repo_user/repo_password@//10.0.0.3:1521/XE << EOF
	select sysdate from dual; 
EOF
" >> $logFile

	#check for ORA-01033: ORACLE Initialization or shutdown in progress
	grep 'ORA-01033' $logFile &> /dev/null
	if [ $? == 0 ]; then
		#echo "String found, so NOT OK"
		echo "ORACLE connection NOT YET possible, exit with -1"
		return -1;
	else
		#echo "String not found in $logFile"
		echo "ORACLE connection OK, exit with 0"
		return 0;
	fi
}

checkConnection
