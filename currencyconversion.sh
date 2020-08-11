#!/bin/bash

#create function to convert currencies
function currencyconverter {
echo "count= $#"

if [ $# -eq 0 ] || [ $# -gt 4 ] 
then
echo "Conversion not possible"
else
 echo "$2, $3 , $4" 
 case $2 in
   INR)
      exchangeamount=`expr $3*$4 | bc` ;;
      #echo "ExchangeRate=Rs.$exchangeamount" 

   SAR)
      exchangeamount=`expr $3*$4 | bc`;;      
      #echo "ExchangeRate=$exchangeamount.riyals" 

   *)
      echo "Not having right data for conversion";; 
 esac 


fi
#return the  exit status of the function

return 1

}


#invoke the function

read -p "From Currency" fromcurr
read -p "To Currency" tocurr
read -p "Amount" amount
read -p "Coversion Rate" convrate
#global variable
exchangeamount=0

currencyconverter $fromcurr $tocurr $amount $convrate
echo "State of the function $?"

echo "The exchange Rate = $exchangeamount"
