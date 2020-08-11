#!/bin/bash
#read log file name from command line
Date=`date "+%m%d%y%H%M%S"`
logfileName=file.$Date.log
touch $logfileName
echo $logfileName
read -p "File Name: " fileName
Date=`date "+%m/%d/%y %H:%M:%S"`
echo "$Date INFO $0 $fileName to read success" | tee $logfileName

exec 3<> $fileName

while read line<&3
do 
 #reading from file
 echo "Read Line:" $line 
done
#writing to file
echo "Akshaya,K,FEMALE,India,18/04/1997" >&3
