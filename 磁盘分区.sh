#!/bin/bash
DATE=(`date +%F__%T`)
#echo ${DATE[*]}
DISK=(`df`)
FLAG=1
i=11
z=10
j=9
k=8
while [[ $i -lt ${#DISK[*]} ]]; do
echo ${DATE[*]} $FLAG $[${DISK[j]}-${DISK[k]}] ${DISK[z]} ${DISK[i]}
let i+=6 k+=6 j+=6 z+=6
done

time=$(date +"%Y-%m-%d__%T")
echo "$time"
df -T -m -x tmpfs -x devtmpfs |grep /|awk -F ' ' '{print "1\t"$6 "\t\t" $2 "\t"$4"\t"$5}'
echo $5
#sum=$(grep /|awk '{print $2}')
#echo "sum=$sum"
#$now=$(grep /|awk '{print $2}')
echo "end"
