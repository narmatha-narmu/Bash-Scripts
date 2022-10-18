#! /bin/bash

FINAL_RESULT="result"
while true
do
	read -p "Do you want to remove an entry  (y/n)?" -r yn
	case "${yn}" in
		[Yy]* )
			read -p " name " name
			var1=$(grep -wn $name $FINAL_RESULT)
			echo "$var1"
			if [ "$(echo "$var1" | wc -l)" -eq 1 ]; then
				read -p "sure you want to remove this entry  (y/n)?" -r yn
                                case "${yn}" in
                                        [Yy]* )
						read -p "linenumber " linenumber
						sed -i "${linenumber}d" $FINAL_RESULT
						#sed -i "${var1}d" $FINAL_RESULT
                                                echo "entry removed"
                                                break;;
                                        [Nn]* ) exit;;
                                        * ) echo " ";;
                                esac

			else
				echo "multiple entries exist on that name"
				read -p "linenumber " linenumber
				read -p "sure you want to remove this entry  (y/n)?" -r yn
				case "${yn}" in
					[Yy]* )
						sed -i "${linenumber}d" $FINAL_RESULT
						echo "entry removed"
						break;;
					[Nn]* ) exit;;
					* ) echo " ";;
				esac
			fi
			
			break;;

		[Nn]* ) exit;;
		* ) echo " ";;
	esac
done
