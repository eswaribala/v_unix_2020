#!/bin/bash

loggedInUser=`whoami`
echo $loggedInUser
echo "Enter File Name"
read fileName
#test the file exists
if [ -f $fileName ]
then
echo "File exists and it is File"
  #nested if
  if [ -O $fileName ]
  then 
   echo "You are owner and owner name is $loggedInUser"
  else
   echo "You are not the owner and logged in user is $loggedInUser"
  fi
else
echo "It is not File"
fi

#compare  username with file owner name
fileownerName=`ls -l $fileName | awk '{print $3}'`
echo $fileownerName
if [ $loggedInUser  =  $fileownerName ]
then
echo "File Owner Found"
else
echo "File Owner Not Found"
fi
