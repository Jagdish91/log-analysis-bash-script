#!/bin/bash

echo "========================Checking Disk Utilizaiton==================="


df -h | awk 'NR>1 {print $1, $5}' | while read filesystem usage 
do 
	use=$(echo "$usage" | tr -d '%')


	if [ "$use" -gt 70 ];
	then
	        echo -e "\nFilesystem: $filesystem"
	        echo "Usage: $usage"	
		echo -e "\nWarning!!.....Disk is utilized more then 70%"
	#else
	#	echo -e "\nDisk has enough space available"
	fi
done



