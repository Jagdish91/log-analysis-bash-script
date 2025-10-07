#!/bin/bash

LOG_DIR="/home/jaggi/logs"

SEARCH_WORDS=("ERROR" "CRITICAL")


echo -e "\n       Analysing log files"
echo "========================="

echo -e "\nList of log files updated in last 24 hours"
LOG_FILES=$(find $LOG_DIR -name "*.log" -mtime -1)

echo -e "\n$LOG_FILES"


for FILE in $LOG_FILES ;
do
	echo -e "\n=====================Log File $FILE ===========================\n"
	for S_WORD in ${SEARCH_WORDS[@]};
	do 
		echo -e "\n $S_WORD"
		echo -e "\nSearching $S_WORD in $FILE"
		grep -i "$S_WORD" $FILE

		ERROR_COUNT=$(grep -c -i "$S_WORD" $FILE)
		echo -e "\nNumber of $S_WORD logs found in $FILE file"
		echo "$ERROR_COUNT"

		if [ "$ERROR_COUNT" -gt 6 ];
		then
			echo -e "\nAction Required: Too many errors"
		fi
	done
done



