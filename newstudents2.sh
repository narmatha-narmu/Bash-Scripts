#! /bin/bash

#LAST_STUDENT_REGNO=/home/local/ZOHOCORP/narmatha-15442/students/lastStudRegNo
FINAL_RESULT="Result/result"

echo " no. of user inputs: "
read n


for (( i=1 ; i<=n ; i++ ))
do
	


read -p " name " name
while [[ $name != [a-zA-Z]* ]] 
do
        read -p " name " name
done

###############################################

regno=$(tail -n 1 $FINAL_RESULT |cut -d '|' -f1)
newRegNo=$(($regno+1))
echo regno:"$newRegNo" 

###############################################

read -p " dob " dob
while [[ $dob != [0-9]*\/[0-9]*\/[0-9]* ]]
do
	read -p " dob " dob
done

#################################################

read -p " class " class
echo "$class" | grep -E "^M{0,3}(CM|CD|D?C{0,3})(XC|XL|L?X{0,3})(IX|IV|V?I{0,3})$" > /dev/null 2>&1
check=$?

while [ $check = 1 ]
do
	echo " enter in roman letters "
	read -p " class " class
	echo "$class" | grep -E "^M{0,3}(CM|CD|D?C{0,3})(XC|XL|L?X{0,3})(IX|IV|V?I{0,3})$" > /dev/null 2>&1
	check=$?
done


################################################

read -p " sec " sec
while  [[ $sec != [[:upper:]] ]]
do
	echo " enter in capital letter "
	read -p " sec " sec
done
	
###############################################

read -p " address " address

##################################################

read -p " contact " contact
echo "$contact" | grep -E "^[0-9]{10}$" > /dev/null 2>&1
matched=$?

while [ $matched = 1 ]
do
	echo " give 10 digits "
	read -p " contact " contact
	echo "$contact" | grep -E "^[0-9]{10}$" > /dev/null 2>&1
	matched=$?
done

##########################################################



sDet=$(grep $name $FINAL_RESULT)
returnStat=$?

if [ $returnStat -eq 0 ]
then 
	sDet1=$(echo "$sDet"| grep "$dob" $FINAL_RESULT)
else 
	echo " $newRegNo |$name |$dob |$class |$sec |$address |$contact" >> $FINAL_RESULT
    continue
fi


sDet1=$(echo "$sDet"| grep "$dob" $FINAL_RESULT)
returnStat1=$?

if [ $returnStat1 -eq 0 ]
then 
	sDet2=$(echo "$sDet1"| grep "$address" $FINAL_RESULT)
else 
	echo " $newRegNo |$name |$dob |$class |$sec |$address |$contact" >> $FINAL_RESULT
	continue
fi

sDet2=$(echo "$sDet1"| grep "$address" $FINAL_RESULT)
returnStat2=$?

if [ $returnStat2 -eq 0 ]
then
	sDet3=$(echo "$sDet2"| grep "$contact" $FINAL_RESULT)
else
	echo " $newRegNo |$name |$dob |$class |$sec |$address |$contact" >> $FINAL_RESULT
	continue
fi

sDet3=$(echo "$sDet2"| grep "$contact" $FINAL_RESULT) 
returnStat3=$?

if [ $returnStat3 -eq 0 ]
then
	echo "data already exist"
    exit
else
	echo " $newRegNo |$name |$dob |$class |$sec |$address |$contact" >> $FINAL_RESULT
fi


done

