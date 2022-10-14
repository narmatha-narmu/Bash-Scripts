#! /bin/bash

top=toppers
function update {

	touch file1
	> $top
	sort -nrk 6 marklist > update1 
	sed -n '1,3p' update1 >  $top
	rm file1


}
 

while true
do
        while [ -f file2 ]	
	do
		sleep 5
	done

	update
	#cat $top
	#echo "####################"
	sleep 5
done

