#!/bin/bash

echo "Read Gender"
read gender
echo "Read CTC"
read ctc

case $gender in
MALE)
echo "You are Male"
if [ $ctc -gt 50 ]
then 
 echo "Above 50 L slab"
 ((tax = ($ctc*100000*30/100)))
elif [ $ctc -gt 20 ] && [ $ctc -lt 49 ]
then
 echo "Between 20 to 49 L slab"
 ((tax = ($ctc*100000*25/100)))
else
 echo "Below 20L slab"
 ((tax = ($ctc*100000*20/100))) 
fi
echo "Tax computed as $tax";;

FEMALE)
echo "You are Female"
if [ $ctc -gt 50 ]
then 
 echo "Above 50 L slab"
 ((tax = ($ctc*100000*25/100)))
elif [ $ctc -gt 20 ] && [ $ctc -lt 49 ]
then
 echo "Between 20 to 49 L slab"
 ((tax = ($ctc*100000*20/100)))
else
 echo "Below 20L slab"
 ((tax = ($ctc*100000*10/100)))
fi
echo "Tax computed as $tax";;

*)
echo "It's not a right gender"
esac
