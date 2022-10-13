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
        #!/bin/bash
        x=1
        echo "enter how many users you want to add"
        read y
        while [ $x -le $y ]
        do
            echo "Enter Username"
            read name
            echo "Enter Key path"
            read key
            my_name=("${my_name[@]}" $name)
            my_key=("${my_key[@]}" $key)
            x=$(( $x + 1 ))
        done
        #add username
        for user_name in ${my_name[@]}
        do 
            if id -u "$user_name" >/dev/null 2>&1; then
                echo 'user already exists'
            else
                sudo useradd -s /bin/bash -d /home/$user_name/ -m -G sudo $user_name
                echo 'user Created'
                echo $user_name'  ALL=(ALL) NOPASSWD:ALL' >> /etc/sudoers
            fi
        done
        # add key
        for pub_key in ${my_key[@]}
        do 
            mkdir -p /home/$user_name/.ssh
            touch /home/$user_name/.ssh/authorized_keys
            cat $pub_key >> /home/$user_name/.ssh/authorized_keys
        done
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




