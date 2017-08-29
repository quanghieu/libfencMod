#!/bin/bash

file=$1

guid=$2

cd /home/hieu/Downloads/libfenc/tools/

echo "guid is: $guid"
read -r line<$file

line=$line$guid
 
printf '%s\n' "$line"

START_TIME=`date +%s.%N`
./abe-keygen -m CP -a 'ONE,TWO,THREE,FOUR,FIVE,SIX,SEVEN,EIGHT' -o usr_privCP_Java.key
END_TIME=`date +%s.%N`
TIMEDIFF=`echo "$END_TIME - $START_TIME" | bc | awk -F"." '{print $1"."substr($2,1,3)}'`
echo "TIME DIFF keygen is: $TIMEDIFF"

START_TIME=`date +%s.%N`
./abe-enc -m CP -d "$line" -p "((ONE and TWO) or THREE)" -o key_encrypt_hieu
END_TIME=`date +%s.%N`
TIMEDIFF=`echo "$END_TIME - $START_TIME" | bc | awk -F"." '{print $1"."substr($2,1,3)}'`
echo "Time diff enc is: $TIMEDIFF"


#START_TIME=`date +%s.%N`
#./abe-dec -m CP -k usr_privCP_Java.key -f key_encrypt.cpabe
#END_TIME=`date +%s.%N`
#TIMEDIFF=`echo "$END_TIME - $START_TIME" | bc | awk -F"." '{print $1"."substr($2,1,3)}'`
#echo "Time diff dec is: $TIMEDIFF"


