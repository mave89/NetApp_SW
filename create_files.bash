#!/bin/bash

SIZE=$1
NUM=$2

if [ $# -ne 2 ]; then
    echo "Please enter the size of the file (KB) and the number of files to be created."
    echo "For example - ./create_files.bash 1024 10"
    exit 1
fi

# Create files
for ((i=0; i<$NUM; i++)); do
    dd if=/dev/zero of=file$i.txt count=1024 bs=$SIZE
done

