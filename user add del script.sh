#!/bin/bash
# Main display
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

    if id -u "$username" >/dev/null 2>&1; then

        echo 'user already exists'
    else
        sudo useradd -s /bin/bash -d /home/$username/ -m -G sudo $username
        mkdir -p /home/$username/.ssh
        touch /home/$username/.ssh/authorized_keys
        pubkey="ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQDnVyGru7blOaSzMI3vSzLqf4fQrCTkA6yI4Hsd+PxIDo1Qket8PXSQKg9WSE9ibmCzcm14neyU8/UYMtQG3huaJhtOFoFBi4D9lIPMQTjSHSzaw0G1p1zFZ425nCJzHcvteZksweuBbIfNSR9sxRZX6z+iw2IHQ81JD8a4ndzN/Aj36nxemqofmROI+bVsFw0ln0V8hB9qNBkJb6RFphurKv6RDu2xQ4c5lHwJl44KynjGPmpmbW2k0l6DcEj9XL/A+Ck5bVTXvAKXHgN74aJQAqIPMdLhQANkUzOPv7x11rl3EEUpUyrXM2UrqAo6EhL6uLyFlbTzahft2k4tf8h05TIhhboWvrE4nXmuLJg4qxs7Oz48P8RSAumegw3rYoHYd3Xm6izFTrEpGJz0aRHGT5ltj1pvMyvEFluaWUsV1xwuEzAjHrp+x5kyJZDE+lJD0KJLiw+QHUPUg8wM1B3VFKQkUwRW8j0ptR5AvdyLDuTtdQBptx6eAfAFakbUjOk= mansoor@DESKTOP-N768L1T"
        pubkey1="ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQDGAGlTVcBfL68m5DNNcpaoO6amuZ3P8CBA79S3MVvIbaPBY2BxPM9VJJr8GvhtczMEY9e6LprYvUDxgN6dblZE3Z60OPHtA3iOtKakSZSOciNd5OecMoajeRnAhCxGl8cdeiEBjdtdZonw6F8I7HaNWYgF+zvkVfYGsIkpES23aRcQ5FoveN/k1efuyE6YxWQxaGwg41eHyprccIneyBN73yjNYJ2GLejfqjsEj+KWJqt6KO721uqB3Mc1eL39JwVm/weGBSTawi07wFeakIjt+hUodhAo3wMV6zTq2J7CgCq8XGxnmJ24yKG1arj0YTM7RwjoAkNtK+KICpbiU+4PlvdACgwGnITZL1KVc35XIqmabZyDzqPl+7krkSHlYshEAqu/5FmpQ930lKxulrdNSblkm3VVZitXwgjYGJQQFrbuX9X7GYxCuuDAEAnxWotjuQlb7C3VeeHYnLBuAS6u80F6bGIvJEMixLubaL06JX28pmZ+2H50HkcuO0yTtms= mansoor@DESKTOP-N768L1T"
        echo $pubkey >> /home/$username/.ssh/authorized_keys
        echo $pubkey1 >> /home/$username/.ssh/authorized_keys
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


