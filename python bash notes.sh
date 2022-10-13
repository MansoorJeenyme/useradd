cat ~/.ssh/id_rsa.pub | ssh username@remote_host "mkdir -p ~/.ssh && touch ~/.ssh/authorized_keys && chmod -R go= ~/.ssh && cat >> ~/.ssh/authorized_keys"
cat ~/ssh_key_path 
cat originalfile.txt >> newfile.txt

echo -en "Please enter a .log name (/home/me/logs/****.log) : "
read filename
filepath="/home/me/logs/$filename.log"
echo $filepath
cat $filepath >> /home/file1


echo -en "Please enter complete path (/home/me/logs/****.log) : "
read filename
filepath="$filename"
echo $filepath
cat $filepath >> /home/file1
cat $filepath >> /home/$username/.ssh/authorized_keys
cat $filepath >> /home/file1


======for loop with different outpus=======

mayarray[0]="one"
mayarray[1]="two"
mayarray[2]="three four"
for x in "${mayarray[*]}"; do
    echo "result= '$x'"
done

mayarray[0]="one"
mayarray[1]="two"
mayarray[2]="three four"
for x in ${mayarray[*]}; do
    echo "result= '$x'"
done

mayarray[0]="one"
mayarray[1]="two"
mayarray[2]="three four"
for x in "${mayarray[@]}"; do
    echo "result= '$x'"
done


mayarray[0]="one"
mayarray[1]="two"
mayarray[2]="three four"
for x in ${mayarray[@]}; do
    echo "result= '$x'"
done
============================


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
echo ${my_name[@]}
echo ${my_key[@]}

#working while loop

for x in ${my_name[@]}
do 
  echo $x
done












while read line
do
    my_array=("${my_array[@]}" $line)
done

echo ${my_array[@]}



for elem in ${arr[@]}
do 
  echo $elem
done








