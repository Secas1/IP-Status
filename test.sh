#!/bin/bash


INPUT=RandomDataTestCSV.csv
OLDIFS=$IFS
IFS=';'
COUNT_SUCCESS=0
[ ! -f $INPUT ] && { echo "$INPUT file not found"; exit 99; }

while read hostname ip
do
	echo "================================="
	echo "Hostname: $hostname"
	echo "================================="
	echo "IP: $ip"
	ping -c 1 $ip
	if [[ $? == 0 ]]; then
		echo "Ping Success"
		let "COUNT_SUCCESS+=1"
	else  
		echo "Ping Fail"
	fi
	echo ""
done < $INPUT

echo "Connection established: $COUNT_SUCCESS"

IFS=$OLDIFS
