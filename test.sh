#!/bin/bash


INPUT=RandomDataTestCSV.csv
OLDIFSS=$IFS
IFS=','
[ ! -f $INPUT ] && { echo "$INPUT file not found"; exit 99; }

while read hostname ip
do
	echo "Hostname: $hostname"
	echo "IP: $ip"
done < $INPUT
IGS=$OLDIFS
