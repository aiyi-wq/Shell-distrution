#!/bin/bash
if [[ $# -lt 1 ]];then
    echo "Usage:$0 lstavg"
fi

time=`date +%Y-%m-%d__%H:%M:%S`
lstavg=$1
if [[ ${lstavg}x == x ]];then
    exit 1
fi

total=`free | head -2 | tail -1 | awk '{printf("%d", $2)}'`
total=$[${total}/1000]

free=`free | head -2 | tail -1 | awk '{printf("%d", $4)}'`
free=$[${free}/1000]

used=$[${total}-${free}]

bi=`echo "scale=1;100*${used}/${total}" | bc`

avgbi=`echo "scale=1;0.7*${bi}+0.3*$1" | bc`

echo "$time ${total}M $free ${bi}% ${avgbi}%"
