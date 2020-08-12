#!/bin/bash
function sqlhelper {


i=1

if [ -f "mysql.properties" ]
then
 echo "It's file and read"
 #Read file using redirection STDIN
 exec 0<"mysql.properties"
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

return 1
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

#create menu
select option in  "Add Product" "View Products" "Edit Product" "Delete Product" "Exit program"
do
case $option in
"Exit program")
break ;;

"Add Product")
addproduct ;;
"View Products")
sqlhelper
retrievedata ;;
"Edit Product")
updateproduct ;;
"Delete Product")
deleteproduct ;;
*)
echo "Sorry, wrong selection";;
esac
done

