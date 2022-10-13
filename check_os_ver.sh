#!/bin/bash

#osname="$(egrep '^(NAME)=' /etc/os-release)"
#todays=$(date)
#echo $todays
osver=$(egrep '^(NAME)=' /etc/os-release)
echo $osver
ubuntu='NAME="Ubuntu"'
if [ $osver == $ubuntu ]
then
    echo "Enter number to select an option"
    echo
    echo "1) Add User"
    echo "2) Delete User"
    echo
    #choice=3
    #while [ $choice -eq 3 ]; do
    declare -i choice # See [1]
    read choice
    if [ $choice -eq 1 ] 
    then
        echo "Enter Username"

        read username
        
        echo -en "Please enter ssh key complete path (/home/me/logs/****.log) : "
        read filename
        filepath="$filename"
        #echo $filepath
        
        if id -u "$username" >/dev/null 2>&1; then

            echo 'user already exists'
        else
            sudo useradd -s /bin/bash -d /home/$username/ -m -G sudo $username
            mkdir -p /home/$username/.ssh
            touch /home/$username/.ssh/authorized_keys
            cat $filepath >> /home/$username/.ssh/authorized_keys

            #echo $pubkey >> /home/$username/.ssh/authorized_keys
            #cat $pubkey >> /home/$username/.ssh/authorized_keys
            echo 'user Created'
            echo $username'  ALL=(ALL) NOPASSWD:ALL' >> /etc/sudoers

        fi
    elif [ $choice -eq 2 ] 
    then
        echo "Enter Username"

        read username

        if id -u "$username" >/dev/null 2>&1; then
            userdel $username
            rm -rf /home/$username
            echo 'user deleted'
        else
            echo 'user not found'
        fi
    else   
        echo ""
        echo "please select a valid option"
    fi    
else
    echo "your os is not supported"
fi




