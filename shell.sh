#!/bin/bash



#counting the number of lines in converted hosts file, eliminate the first line,
nbr1=`cat /root/ansible/hosts | sed 1d | wc -l`

for (( c=1; c <= $nbr1; c++ )) 
do

#taking the first elements which is the source address in each line of the file
sources=`cat /root/ansible/hosts | sed 1d | cut -d " " -f 1 | sed -n ''$c'p'`

#showing the lines of the hosts converted file for each source address
nbr2=`cat /root/ansible/InputFiles2/sourceDPcsv.csv | sed 1d | egrep "^$sources" | wc -l`

printf "IPVARS:\n" > /root/ansible/$sources

     for (( i=1; i <= $nbr2; i++ ))
     do

        dests=`cat /root/ansible/InputFiles2/sourceDPcsv.csv | sed 1d | egrep "^$sources" | cut -d ";" -f 2 | sed -n ''$i'p'` 
        ports=`cat /root/ansible/InputFiles2/sourceDPcsv.csv | sed 1d | egrep "^$sources" | cut -d ";" -f 3 | sed -n ''$i'p'`

        printf "  - IPname: $dests\n" >> /root/ansible/$sources
        printf "    Port:\n" >> /root/ansible/$sources 
        printf "      - Port_nb: $ports\n" >> /root/ansible/$sources

     done 
done





