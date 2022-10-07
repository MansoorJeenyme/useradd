#!/bin/sh
echo "enter username"
read username
#echo "enter key"
#read pubkey
sudo useradd -s /bin/bash -d /home/$username/ -m -G sudo $username
echo $username'  ALL=(ALL) NOPASSWD:ALL' >> /etc/sudoers
mkdir -p /home/$username/.ssh
touch /home/$username/.ssh/authorized_keys
pubkey="ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQDik9uSADk9ttSp/ugvUfCfnzjff0uJal33aO6by6uJJZgt3byddnqZpVdYN2YPLunZF8uIiWEtmgRXWREw8R/Ysl2Kq9B6KT1oBTBLwZ480M/EzSB26Kb6/S2yccwxaP9zn1cYe41eEdZBzX2hZrDAGHwrLBA9pShYal9xn+TICYkhT0a3C0LPVktDCUIxkiekRAfyByCaaUZiGGIX+72UNTnhAehz9hTqOxqXeVmzoXxZSM84alcemVGYoXpLK7/5xP8V099Iae3GjfJgSkl6OpXZNSVQm1iE/U/o+oHH0KYiq2oMClP+uIm3aEPwsKeENB64b3eCwFZvmMAyEjtPWVsEIYnrHTNHAVtDT9BoK/mC/NO+kJCAANxHXOmiodPyWeFYxLN0uItRq5zhYz9x3EIK1CAsljnJWl8yrk/xyjoTFo+Lzu/B80r7c1JxuG0zMyGDi9Zj+RdDpWgxz7Lllbt8mR+7vIe0iUwxZdngAGJ486P1omCbj5vGPiQPF68= Lenovo@DESKTOP-6MF07AB"
echo $pubkey >> /home/$username/.ssh/authorized_keys

#cat key.txt >> /home/$user/.ssh/authorized_keys
#cat /path/to/pubkey >> /home/$user/.ssh/authorized_keys
#chmod 700 /home/$user/.ssh
#chmod 644 /home/$user/.ssh/authorized_keys
#chown -R $user.$user /home/$user/.ssh

#sudo useradd -s /path/to/shell -d /home/{dirname} -m -G {secondary-group} {username}
# sudo passwd {username}

added new code for development