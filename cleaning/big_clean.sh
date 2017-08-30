#!/usr/bin/bash

FILE=$1
tmp_dir=$2

tar -xf $FILE --directory $tmp_dir

here=$(tar -tzf $FILE | head -1 | cut -f1 -d"/")
echo $here

cd $tmp_dir/$here
ls
if [ "$here" == "little_dir" ]
then
	echo "got here"
	pwd
fi



rm $(grep -lir "DELETE ME!")


