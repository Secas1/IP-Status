#!/bin/bash


INPUT=RandomDataTestCSV.csv
OLDIFS=$IFS
IFS=';'
TOTAL=0
COUNT_SUCCESS=0
[ ! -f $INPUT ] && { echo "$INPUT file not found"; exit 99; }
while read hostname ip
do
	if [[ $hostname == "Host" ]]; then
		echo "$hostname;$ip;connection_status" >> status.csv
		continue
	fi
	#echo "================================="
	#echo "Hostname: $hostname"
	#echo "================================="
	ping -c 1 $ip

	if [[ $? == 0 ]]; then
		#echo "Ping Success"
		echo "$hostname;$ip;success" >> status.csv
		let "COUNT_SUCCESS+=1"
	else  
		#echo "Ping Fail"
		echo "$hostname;$ip;fail" >> status.csv
	fi
	echo " "
	let "TOTAL+=1"
done < $INPUT

echo "Connection established: $COUNT_SUCCESS"
echo "Total IPs: $TOTAL"

IFS=$OLDIFS
