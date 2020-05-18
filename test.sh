#!/bin/bash


INPUT=RandomDataTestCSV.csv
OLDIFS=$IFS
IFS=';'
[ ! -f $INPUT ] && { echo "$INPUT file not found"; exit 99; }

while read hostname ip
do
	echo "================================="
	echo "Hostname: $hostname"
	echo "================================="
	echo "IP: $ip"
	ping -c 1 $IP_TEST
	if [[ $? == 0 ]]; then
		echo "Ping Success"
	else  
		echo "Ping Fail"
	fi
	echo ""
done < $INPUT
IFS=$OLDIFS
