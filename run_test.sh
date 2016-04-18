#!/bin/bash
# Reza Farid, Fugro Roames
# Created:      2016/04/15
# Last update:  2016/04/18
#
# a shell script to test YOLO test with multiple files in a folder
#
if [ $# -lt 4 ]
then
	echo
	echo
	echo "USAGE: $(basename $0) config_file weights_file folder files_pattern"
	echo "	config_file such as cfg/yolo_2.cfg"
	echo "	weights_file suuch as ../rezaf/roames/YOLO/backup/yolo_2_40000.weights"
	echo	
	exit
fi
config_file=$1
weights_file=$2
in_folder=$3
files_pattern=$4
i=1
all_files=$(find $in_folder -name "$files_pattern")
n=$(find $in_folder -name "$files_pattern" | wc -l)
# echo $all_files,$n
for in_file in $all_files; do
    echo $in_file","$i" of "$n
    ./darknet yolo test $config_file $weights_file $in_file
    let i=i+1
done
#find /home/rezaf/projects/rezaf/roames/testJPG/out -name "*.jpg" -exec ./darknet yolo test cfg/yolo_2.cfg ~/projects/rezaf/roames/YOLO/backup/yolo_2_40000.weights {} \;
