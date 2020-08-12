#!/bin/bash
function sqlhelper {

read -p "Give File Name:"  fileName
i=1

if [ -f $fileName ]
then
 echo "It's file and read"
 #Read file using redirection STDIN
 exec 0<$fileName
 while IFS="=" read -r key value
 do 
   echo "$key,$value"
   values[$i]=$value
   #echo "${values[$i]}"
   ((i++))
 done 

else
 echo "It's not a file"
fi

echo " array of values ${values[1]},${values[2]}, ${values[3]}, ${values[4]}"

}

function addproduct {

echo "Product will be added"

}




function retrievedata {

#Prepare sql query

SQL_Query='select * from customer'

#mysql command to connect to database
#-u username -p password -P port -h host -D db name
mysql -u ${values[1]} -p${values[2]} -P ${values[3]} -h ${values[4]} -D ${values[5]} <<EOF
$SQL_Query
EOF
echo "End of script"


}

function updateproduct {

 echo "Product Update will happen"

}

function deleteproduct {

 echo "Product will be deleted"


}




#global varaible
values=()
#invoke the function
sqlhelper
#display values from sqlhelper
echo " array of values from main ${values[1]},${values[2]}, ${values[3]}, ${values[4]}"

PS3="Enter option: "

#create menu
select option in "Add Product" "View Products" "Edit Product" "Delete Product" "Exit program"
do
case $option in
"Exit program")
break ;;
"Add Producr")
addproduct ;;
"View Products")
retrievedata ;;
"Edit product")
updateproduct ;;
"Delete product")
deleteproduct ;;

*)
clear
echo "Sorry, wrong selection";;
esac
done

