#!/bin/bash
#1nam testing
#LAPTOP LID
#open is yes  closed is no
#path to file /proc/acpi/button/lid/LID/


z=$USER
x=$HOSTNAME

read -p "Lid & Power Test Press Enter : "

echo -e " \e[5m $z $x       \e[91mTESTING\e[25m"
grep -q open /proc/acpi/button/lid/LID/state
if [ $? = 0 ]
then
    echo  -e "\e[92mYes your laptop lid is open."

            # POWER CABLE PLUGGED IN
    # 1 is yes 0 is no
    grep -q 1 /sys/class/power_supply/AC/online
    if [ $? = 0 ]
    then
       echo -e "\e[92mYes your laptop power cable is plugged in."
    fi
fi
