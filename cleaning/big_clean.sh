#!/usr/bin/bash


FILE=$1
tmp_dir=$2

tar -xf $FILE --directory $tmp_dir

target_dir=$(tar -tzf $FILE | head -1 | cut -f1 -d"/")
parent_dir=$(pwd)

cd $tmp_dir
scratch_dir=$(pwd)
cd $target_dir

rm $(grep -lir "DELETE ME!") 

cleaned="cleaned_"
cleaned_filename="$cleaned$target_dir"
cd $scratch_dir
tar -zcf $parent_dir/$cleaned_filename.tgz $target_dir
ls -l | wc

