#!/bin/bash  
  
file='read_file.txt'  
  
i=1

while read line; do  
  
#Reading each line  
echo "Line No. $i : $line"  
i=$((i+1))  
done < $file  
