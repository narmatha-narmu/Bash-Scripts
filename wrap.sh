#! /bin/bash

function options()
{

	echo "which script do you want to access?"
	echo "		1 newstudents2.sh - to add students entry
		2 randmarkgen.sh - to generate random mark for the students
		3 backup.sh - toppers update list
		4 removestud.sh - to remove a student's entry
		5 kill random mark generating process
		6 kill toppers mark updating process
		7 exit"
		read -p "type the number:" number

	case $number in
		One|one|1 )
			echo "start to enter the student detail"
       			/home/local/ZOHOCORP/narmatha-15442/students/newstudents2.sh
       			echo "entries are stored"

       			options
			echo " "
			;;

		Two|two|2 )
			dupe_script=$(ps -ef | grep "/home/local/ZOHOCORP/narmatha-15442/mark_generation/randmarkgen.sh" | grep -v grep | wc -l | xargs)
			if [ ${dupe_script} -eq 1 ]
			then
        			echo  "already running"
			else
        			echo "background process started"
        			setsid -f /home/local/ZOHOCORP/narmatha-15442/mark_generation/randmarkgen.sh
        			echo "random mark gen started pid is $!"
			fi

		     	options 
			;;

		Three|three|3 )
			dupe_script2=$(ps -ef | grep "/home/local/ZOHOCORP/narmatha-15442/mark_generation/backup.sh" | grep -v grep | wc -l | xargs)
			if [ ${dupe_script2} -eq 1 ]
			then
				echo "already running"
			else	
				echo "starting backup"
				setsid -f /home/local/ZOHOCORP/narmatha-15442/mark_generation/backup.sh
                        	echo "update initialised"
			fi

                        options
			echo ""
			;;

		Four|four|4 )
			/home/local/ZOHOCORP/narmatha-15442/students/removestud.sh

			options
			echo ""
			;;

		Five|five|5 )
			pid=$(ps -aux | grep /home/local/ZOHOCORP/narmatha-15442/mark_generation/randmarkgen.sh | grep -v grep | tr -s ' ' | cut -d\  -f2) 
			kill -15 $pid
			echo "process killed"

			options
			echo ""
			;;
		
		Six|six|6 )
			pid=$(ps -aux | grep /home/local/ZOHOCORP/narmatha-15442/mark_generation/backup.sh | grep -v grep | tr -s ' ' | cut -d\  -f2)
			kill -15 $pid
			echo "process killed"

			options 
			echo ""
			;;

		Seven|seven|7 )
			echo "exit"

			;;
	esac
}


options