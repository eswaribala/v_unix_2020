#!/bin/bash
# using select in the menu
echo -e "$color: \\033[38;5;7mhello\\033[48;5;9mworld\\033[0m"
function diskspace {
clear
df -k
}
function whoseon {
clear
who
}
function memusage {
clear
cat /proc/meminfo
}
PS3="Enter option: "
select option in "Display disk space" "Display logged on users" "Display memory usage" "Exit program"
do
case $option in
"Exit program")
break ;;
"Display disk space")
diskspace ;;
"Display logged on users")
whoseon ;;
"Display memory usage")
memusage ;;
*)
clear
echo "Sorry, wrong selection";;
esac
done
clear
