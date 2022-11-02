#! /bin/bash

#markFile="marklist"
#FINAL_RESULT="result"
#Filter="crop1"
source /home/local/ZOHOCORP/narmatha-15442/bashWorkItems/Bash-Scripts/mark_generation/filenames.properties

function student {
	touch file2
	> $markFile
	cut -d '|' -f1,2 $FINAL_RESULT > $Filter
	while read line; do
		sub1=$(( $RANDOM % 101 ))
        	sub2=$(( $RANDOM % 101 ))
       		sub3=$(( $RANDOM % 101 ))
        	total=`expr $sub1 + $sub2 + $sub3`
		echo " $line $sub1 $sub2 $sub3 $total " >> $markFile
	done < $Filter
 	rm file2
}

while true
do
	while [ -f file1 ]
	do
		sleep 5
	done
	student
	#cat $markFile
	#echo "###################"
	sleep 5
done




































































