#!/bin/bash

file=`find /root/ansible/InputFiles -name "*.csv" | tail -n 1 | cut -d "/" -f 5`

nbr=`cat /root/ansible/InputFiles/$file | sed 1d | wc -l`

printf "[servers]\n" > /root/ansible/hosts

for (( c=1; c <= $nbr; c++ ))

do

adresse_source=`cat /root/ansible/InputFiles/$file | sed 1d | cut -d ";" -f 1 |sed -n ''$c'p'`
ansible_user=`cat /root/ansible/InputFiles/$file | sed 1d | cut -d ";" -f 2 |sed -n ''$c'p'`
ansible_ssh_pass=`cat /root/ansible/InputFiles/$file | sed 1d | cut -d ";" -f 3 |sed -n ''$c'p'`

printf "$adresse_source ansible_user=$ansible_user ansible_ssh_pass=$ansible_ssh_pass" >> /root/ansible/hosts
printf "\n" >> /root/ansible/hosts

done

