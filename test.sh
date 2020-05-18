#!/bin/bash


INPUT=RandomDataTestCSV.csv
OLDIFS=$IFS
IFS=';'
COUNT_SUCCESS=0
[ ! -f $INPUT ] && { echo "$INPUT file not found"; exit 99; }
#echo "hostname;ip;connection_status" >> status.csv
while read hostname ip
do
	echo "================================="
	echo "Hostname: $hostname"
	echo "================================="
	echo "IP: $ip"
	ping -c 2 $ip

	if [[ $? == 0 ]]; then
		echo "Ping Success"
		echo "$hostname;$ip;success" >> status.csv
		let "COUNT_SUCCESS+=1"
	else  
		echo "Ping Fail"
		echo "$hostname;$ip;fail" >> status.csv
	fi
	echo " "
done < $INPUT

echo "Connection established: $COUNT_SUCCESS"

IFS=$OLDIFS
