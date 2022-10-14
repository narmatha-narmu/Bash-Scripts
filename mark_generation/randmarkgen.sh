#! /bin/bash

markFile=marklist

function student {
	touch file2
	> $markFile
	cut -d '|' -f1,2 /home/local/ZOHOCORP/narmatha-15442/students/result > crop1
	while read line; do
		sub1=$(( $RANDOM % 101 ))
        	sub2=$(( $RANDOM % 101 ))
       		sub3=$(( $RANDOM % 101 ))
        	total=`expr $sub1 + $sub2 + $sub3`
		echo " $line $sub1 $sub2 $sub3 $total " >> $markFile
	done < crop1
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


