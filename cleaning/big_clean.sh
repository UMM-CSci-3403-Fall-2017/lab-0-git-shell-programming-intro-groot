#!/usr/bin/bash

#This takes a zip and uncompresses the files, cleans out the file containing "DELETE ME!"
#text, then makes a file called "cleaned_FILENAME" ex, "cleaned_big_dir.tgz"

#Take in arguments for the file to be cleaned and the scratch (working) directory.
FILE=$1
tmp_dir=$2

#Extract the tar file into the scratch directory.
tar -xf $FILE --directory $tmp_dir

#Store the file name before .tgz and the cleaning directory path. 
target_dir=$(tar -tzf $FILE | head -1 | cut -f1 -d"/")
parent_dir=$(pwd)

#Store the scratch directory path and move to target_dir.
cd $tmp_dir
scratch_dir=$(pwd)
cd $target_dir

#Remove all files containing the specified text.
rm $(grep -lir "DELETE ME!") 

#Move back to the scratch dir, create the tarball and store it in the parent_dir.
cleaned="cleaned_"
cleaned_filename="$cleaned$target_dir"
cd $scratch_dir
tar -zcf $parent_dir/$cleaned_filename.tgz $target_dir

