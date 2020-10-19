#!/bin/bash
#1nam testing
#LAPTOP LID open or closed and if power cable is plugged in
                     # THE PATH #
#on linux mint the LID path to file is:  /proc/acpi/button/lid/LID/
#on Manjaro Lid Path is: /proc/acpi/button/lid/LID0/state
#on linux mint power path is: /sys/class/power_supply/AC/online
#on Manjaro power path is: /sys/class/power_supply/ACAD/online

# simply remove hash tag to use for linux mint path and add a hash tag in frot of, 
# the manjaro path.
z=$USER
x=$HOSTNAME

read -p "Lid & Power Test Press Enter : "

echo -e " \e[5m $z $x       \e[91mTESTING\e[25m" #Blinking Text
grep -q open /proc/acpi/button/lid/LID0/state   # manjaro path
# grep -q open /proc/acpi/button/lid/LID/state # linux mint path remove hash tag
if [ $? = 0 ] # [1 is yes 0 is no]
then
    echo  -e "\e[92mYes your laptop lid is open."

            # [POWER CABLE PLUGGED IN]

    grep -q 1 /sys/class/power_supply/ACAD/online  # manjaro path
#   grep -q 1 /sys/class/power_supply/AC/online   #linux mint path remove hash tag
    if [ $? = 0 ] # [1 is yes 0 is no]
    then
       echo -e "\e[92mYes your laptop power cable is plugged in." 
    fi
fi
