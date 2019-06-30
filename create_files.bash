#!/bin/bash

SIZE=$1
NUM=$2

if [ $# -ne 2 ]; then
    echo "Please enter the size of the file (KB) and the number of files to be created."
    echo "For example - ./create_files.bash 4 10"
    exit 1
fi

# Create a data directory and put all files in it
mkdir -p data && cd data

# Create 1 big master file
TOTAl_SIZE=$(($SIZE*1024*$NUM))
dd if=/dev/zero of=masterfile bs=1 count=$TOTAl_SIZE

# Split it up
SIZE_OF_FILES=$(($SIZE * 1024))
split -b $SIZE_OF_FILES -a 10 masterfile

