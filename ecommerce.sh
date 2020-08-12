#!/bin/bash
# using select in the menu
function sqlhelper {

read -p "FileName" fileName

i=1

if [ -f $fileName ]
then
  echo "It's file and read"
  
while IFS="=" read -r key value
 do 
   echo "$key,$value"
   values[$i]=$value
   #echo "${values[$i]}"
   ((i++))
 done < $fileName
  

else
 echo "It's not a file"
fi

echo " array of values ${values[1]},${values[2]}, ${values[3]}, ${values[4]}"





}
function addproduct {
echo "Record will be added"
#Prepare sql query
echo "$1,$2,$3"

#mysql command to connect to database
#-u username -p password -P port -h host -D db name
mysql -u ${values[1]} -p${values[2]} -P ${values[3]} -h ${values[4]} -D ${values[5]} <<EOF
INSERT INTO Product (\`Product_Id\`, \`Name\`, \`Cost\`) VALUES ("$1", "$2", "$3");
EOF
echo "End of script"


}
function editproduct {

echo "Record will be edited"

#Prepare sql query
echo "$1,$2,"

#mysql command to connect to database
#-u username -p password -P port -h host -D db name
mysql -u ${values[1]} -p${values[2]} -P ${values[3]} -h ${values[4]} -D ${values[5]} <<EOF
UPDATE Product SET \`Name\`="$2" WHERE \`Product_Id\`="$1"
EOF
echo "End of script"


}

function viewproduct {

echo "View Porduct"
#Prepare sql query

SQL_Query='select * from Product'

#mysql command to connect to database
#-u username -p password -P port -h host -D db name
mysql -u ${values[1]} -p${values[2]} -P ${values[3]} -h ${values[4]} -D ${values[5]} <<EOF
$SQL_Query
EOF
echo "End of script"
}

function deleteproduct {

echo "Delete Product"
}

#global varaible
values=()
#invoke the function

PS3="Enter option: "
select option in "DB Connection" "Add Product" "Edit Product" "View Product" "Delete Product" "Exit Program"
do
case $option in
"Exit Program")
break ;;
"DB Connection")
sqlhelper ;;
"Add Product")
read -p "Product Id" productId
read  -p  "Name" name
read -p "Cost" cost
addproduct $productId $name $cost;;
"Edit Product")
read -p "Product Id" productId
read  -p  "Name" name
editproduct $productId $name;;
"View Product")
viewproduct ;;
"Delete Product")
deleteproduct ;;
*)
clear
echo "Sorry, wrong selection";;
esac
done
clear

