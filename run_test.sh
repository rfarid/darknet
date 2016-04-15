#!/bin/bash
if [ $# -lt 2 ]
then
	echo
	echo
	echo "USAGE: $(basename $0) folder files_pattern"
	echo
	echo
	exit
fi
in_folder=$1
files_pattern=$2
i=1
all_files=$(find $in_folder -name "$files_pattern")
n=$(find $in_folder -name "$files_pattern" | wc -l)
# echo $all_files,$n
for in_file in $all_files; do # Not recommended, will break on whitespace
    echo $in_file","$i" of "$n
    ./darknet yolo test cfg/yolo_2.cfg ~/projects/rezaf/roames/YOLO/backup/yolo_2_40000.weights $in_file
    let i=i+1
done
#find /home/rezaf/projects/rezaf/roames/testJPG/out -name "*.jpg" -exec ./darknet yolo test cfg/yolo_2.cfg ~/projects/rezaf/roames/YOLO/backup/yolo_2_40000.weights {} \;
