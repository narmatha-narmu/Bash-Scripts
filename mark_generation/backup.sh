#! /bin/bash

#top=toppers
#source /home/local/ZOHOCORP/narmatha-15442/testMain/Bash-Scripts/mark_generation/filenames.properties
source /home/local/ZOHOCORP/narmatha-15442/testMain/Bash-Scripts/mark_generation/test.properties
function update {

	touch file1
	> $top
	sort -nrk 6 marklist > update1 
	sed -n '1,3p' update1 >  $top
	scp -r $top $username@$Ip:"/home/sas/narmatha/toppers/toppers_"$(date +"%Y_%m_%d_%I_%M_%S_%p").log""
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


















































